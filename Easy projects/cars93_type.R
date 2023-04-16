library(MASS)

head(Cars93[1:3])

table(Cars93$Type)

barplot(table(Cars93$Type)
        ,ylim = c(0,25)
        ,xlab = "Type"
        ,ylab = "Frequency"
        ,axis.lty = "solid"
        ,space = .5
        )


