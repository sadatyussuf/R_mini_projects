library(datasets)
library(tidyverse)
# library(scatterplot3d)

aq.no.NA <- drop_na(airquality)

median.Ozone <- median(aq.no.NA$Ozone)

head(aq.no.NA)
head(median.Ozone)

Ozone_Level <- NULL

for(i in 1:nrow(aq.no.NA)){
  if (aq.no.NA$Ozone[i] <= median.Ozone){
    Ozone_Level[i] = 'Low'
  }else{
    
    Ozone_Level[i] = 'High'
  }
}

aq.Ozone_Level <- cbind(aq.no.NA,Ozone_Level)


ggplot(aq.Ozone_Level,aes(x=Wind,y=Temp,color=Ozone_Level)) +
  geom_point(size=3)

# aq.analysis <- lm(Temp ~ Wind + Ozone, data= aq.Ozone_Level)
# summary(aq.analysis)


# with(aq.Ozone_Level,
#      (scatterplot3d(Wind ~ Temp + Ozone, pch = 19)))
