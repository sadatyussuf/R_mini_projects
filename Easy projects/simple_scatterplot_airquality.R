library(datasets)

plot(airquality$Temp ~  airquality$Wind ,
     pch=17,
     xlab ="Wind Velocity (MPH)",
     ylab ="Temperature (Fahrenheit)",
     main = "Temperature vs Wind Velocity")

