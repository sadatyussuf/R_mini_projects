library(MASS)
library(ggplot2)


ggplot(Cars93,aes(x=Type)) +
  geom_bar()+
  labs(y="Frequency",title="Car Type and Frequency in Cars93")  