setwd("/Users/user/Desktop/My_Project/The R langauge/")

library(conflicted)
library(ggplot2)
library(dplyr)
library(lubridate)

options(stringsAsFactors = FALSE)

precip_boulder <- read.csv(file ="earth-analytics/week_02/precipitation/805333-precip-daily-1948-2013.csv",
header = TRUE,na.strings =  c(" ","unknown","999.99","[","]","{","}"))

precip_boulder <- precip_boulder  %>%
  mutate(DATE=as.POSIXct(DATE,format="%Y%m%d %H:%M"))

daily_sum_precip <- precip_boulder %>%
  mutate(
  day=as.Date(DATE,format="%Y-%U")
) %>% 
  group_by(day) %>%
  dplyr::filter(day >= as.Date('2013-01-01') & day < as.Date('2013-10-01')) %>%
  # dplyr::filter(day >= as.Date('2011-01-01') & day < as.Date('2014-01-01')) %>% 
  summarise(total_precip=sum(HPCP)) %>% na.omit() %>% mutate(
  month=lubridate::year(day)
) %>% mutate(day_of_yr=lubridate::yday(day))
  

ggplot(daily_sum_precip,aes(x=day,y=total_precip)) +
  geom_point(color='purple') +
  # facet_wrap(daily_sum_precip$month) +
  labs(title = "Daily Total Percipition - Boulder Station",
       subtitle = "1948-2013",
       y="Percipition (Inches)",
       x= "Date")

