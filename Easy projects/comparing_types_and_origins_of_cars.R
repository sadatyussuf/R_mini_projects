library(datasets)

# Selecting Only the Type and Origin from the dataset
Type.Origin <- subset(Cars93,select = c("Type","Origin"))

# Retrieving the frequency of the car Types
counts_matrix <- table(Type.Origin)

tranpose_matrix <- t(counts_matrix)

color.names <- c('black','grey')

barplot(tranpose_matrix
        ,beside = T
        ,col=color.names
        ,ylab = "Frequency"
        ,xlab = "Type of Cars93"
        ,axis.lty =1
        )

legend("topright"
       ,rownames(tranpose_matrix)
       ,cex = 0.7
       
       ,fill = color.names
       ,title = "Origin of the Cars"
      
)

