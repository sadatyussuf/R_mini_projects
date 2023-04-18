library(datasets)


boxplot(Temp ~ Month,
        data=airquality,
        xaxt = "n")

axis(1, 
     at=1:5,
     labels=c("May","June","July","August", "September"))
