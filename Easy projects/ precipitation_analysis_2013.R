
setwd("/Users/user/Desktop/My_Project/The R langauge/")

library(conflicted)
library(ggplot2)
library(lubridate)
library(dplyr)

options(stringsAsFactors = FALSE)

precip_dailysum = read.csv(file = "earth-analytics/week_02/precipitation/805325-precip-dailysum-2003-2013.csv"
                           , header = TRUE,na.strings = 999.990)

precip_dailysum$DATE <- as.Date(precip_dailysum$DATE, format = "%m/%d/%y")



precip_dailysum <- precip_dailysum %>%
  dplyr::filter(DATE >= as.Date('2013-08-15')
                & DATE <= as.Date('2013-10-15')) %>% na.omit()

ggplot(precip_dailysum,aes(x=DATE,y=DAILY_PRECIP)) +
  # geom_point(color = "darkorchid4") +
  geom_bar(stat = 'identity') +
  labs(title = "Daily Total Precipitation Aug - Oct 2013 for Boulder Creek",
       x = "Date",
       y = "Precipitation (Inches)") +
  # labs(title = "Hourly Precipitation - Boulder Station\n 2003-2013",
  #      x = "Date",
  #      y = "Precipitation (Inches)") +
  theme_bw(base_size = 11)

# summary(precip_dailysum)
