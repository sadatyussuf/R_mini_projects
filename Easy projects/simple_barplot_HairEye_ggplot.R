library(datasets)
library(ggplot2)
Convrt.DF <- data.frame(HairEyeColor)

ggplot(Convrt.DF,aes(x=Hair,
                     y=Freq, 
                     fill=Eye)) +
  
  geom_bar(position = "dodge",
           color="black",
           stat="identity")
 
