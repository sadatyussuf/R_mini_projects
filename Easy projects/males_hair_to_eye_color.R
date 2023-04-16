library(MASS)

head(HairEyeColor)

males <- t(HairEyeColor[,,1])

color.names = c("brown","blue","#C9C789","green")
head(males)


barplot(males
        ,beside = T
        ,ylim = c(0,60)
        ,col = color.names
        ,xlab = "Hair Color"
        ,ylab="Frequency of Eye Color"
        ,axis.lty="solid"
        )

legend(x="top"
       ,rownames(males)
       ,cex = 0.8
       ,fill = color.names
       ,title = "Eye Color"
       )
