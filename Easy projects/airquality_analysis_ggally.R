library(ggplot2)
library(GGally)
library(datasets)
library(tidyverse)

aq.no.NA <- drop_na(airquality)

aq.subset <- subset(aq.no.NA,select = c(Ozone,Wind,Temp,Solar.R))

ggpairs(aq.subset)
head(aq.subset)
