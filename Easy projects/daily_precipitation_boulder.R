setwd("/Users/user/Desktop/My_Project/The R langauge/")

library(conflicted)
library(ggplot2)
library(lubridate)
library(dplyr)

options(stringsAsFactors = FALSE)


precip_dailysum = read.csv(file = "earth-analytics/week_02/precipitation/805325-precip-dailysum-2003-2013.csv"
                           , header = TRUE,na.strings = 999.990)

precip_dailysum <- precip_dailysum %>%
  mutate(DATE=as.Date(DATE,format("%m/%d/%y"))) %>% 
  na.omit() %>% dplyr::filter(JULIAN > 230 & JULIAN <290)



ggplot(precip_dailysum,aes(x=JULIAN,y=DAILY_PRECIP)) +
  geom_bar(stat = 'identity',fill='purple')+
  # geom_point(color='purple')+
    facet_wrap( ~ YEAR,ncol = 3 ) +
    labs(title = "Daily Precipitation - Boulder, Colorado",
     subtitle = "Data plotted by year",
     y = "Daily Precipitation (inches)",
     x = "Day of Year") +
  theme_bw(base_size = 15)

