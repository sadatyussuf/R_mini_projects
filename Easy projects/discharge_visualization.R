setwd("/Users/user/Desktop/My_Project/The R langauge/")

library(conflicted)
library(plotly)
library(ggplot2)
library(xts)
library(dygraphs)
library(dplyr)

options(stringsAsFactors = FALSE)

discharge_time <- read.csv("earth-analytics/week_02/discharge/06730200-discharge-daily-1986-2013.csv")

discharge_time <- discharge_time %>% 
  dplyr::mutate(datetime=as.Date(datetime,format="%m/%d/%y"))


discharge_timeSeries <- xts(x=discharge_time$disValue,
                            order.by = discharge_time$datetime)

View(discharge_timeSeries)

interact_time <- dygraph(discharge_timeSeries)
interact_time
interact_time2 <- dygraph(discharge_timeSeries) %>% dyRangeSelector()
interact_time2

annual_precip <- ggplot(discharge_time,aes(x=datetime,y=disValue)) +
geom_point()

ggplotly(annual_precip)
head(discharge_time)
