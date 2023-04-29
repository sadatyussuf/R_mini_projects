setwd("/Users/user/Desktop/My_Project/The R langauge/")

library(conflicted)
library(ggplot2)
library(lubridate)
library(dplyr)

options(stringsAsFactors = FALSE)


precip_daily = read.csv(file = "earth-analytics/week_02/precipitation/805325-precip-dailysum-2003-2013.csv"
                           , header = TRUE,na.strings = 999.990)
precip_daily <- precip_dailysum %>%
  mutate(DATE=as.Date(DATE,format("%m/%d/%y"))) %>% 
  na.omit() %>%
  mutate(month=month(DATE))

precip_month <- precip_daily %>%
  group_by(month,YEAR) %>%
  summarise(sum_precip =sum(DAILY_PRECIP) ) %>%
  mutate(full_date=as.Date(paste0("2015-", month,"-01"),"%Y-%m-%d"))

ggplot(precip_month,aes(x=full_date,y=sum_precip))+
  geom_bar(stat = "identity", fill = "darkorchid4") +
  facet_wrap(~ YEAR, ncol = 3) +
  labs(title = "Montly Total Daily Precipitation - Boulder, Colorado",
       subtitle = "Data plotted by year",
       y = "Daily precipitation (inches)",
       x = "Month") + theme_bw(base_size = 15) +
  scale_x_date(date_labels = "%b")

