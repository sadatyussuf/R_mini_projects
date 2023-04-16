library(datasets)
library(dplyr)




females <- t(HairEyeColor[,,2])
head(females)
color.names = c("brown","blue","#C9C789","green")


barplot(females
        ,beside=T
        ,ylim=c(0,70)
        ,xlab="Hair Color"
        ,ylab="Frequency of 
Eye Color"
        , col=color.names
        ,axis.lty="solid"
        )

legend("top"
       ,rownames(females)
       ,cex =0.8
       ,fill=color.names
       ,title="Eye Color"
       
       )






