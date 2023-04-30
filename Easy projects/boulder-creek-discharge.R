setwd("/Users/user/Desktop/My_Project/The R langauge/")

library(conflicted)
library(ggplot2)
library(lubridate)
library(dplyr)

options(stringsAsFactors = FALSE)


discharge <- read.csv("earth-analytics/week_02/discharge/06730200-discharge-daily-1986-2013.csv",
                      header = TRUE)


discharge <- discharge %>% 
  mutate(datetime=as.Date(datetime,format("%m/%d/%y"))) 
#   %>% 
#   dplyr::filter(datetime >  as.Date('2013-08-15') & datetime < as.Date('2013-10-15'))

ggplot(discharge,aes(x=datetime,y=disValue)) +
  geom_point() +
  labs(title = "Stream Discharge (CFS) - Boulder Creek 1986-2016",
       x="Year",
       y="Discharge (CFS)") + theme_bw(base_size = 15)
