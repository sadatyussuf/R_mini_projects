library(datasets)

Ozone.Temp.Wind <- subset(airquality,select = c(Ozone,Temp,Wind))
head(Ozone.Temp.Wind)

pairs(Ozone.Temp.Wind)


