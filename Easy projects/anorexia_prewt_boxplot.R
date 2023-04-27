library(MASS)
library(ggplot2)

head(anorexia)

ggplot(anorexia,aes(x=Treat,y=Prewt)) +
  geom_boxplot() +
  geom_point() +
  labs(x="Treament",y="Preweight (Ibs)") +
  scale_x_discrete(labels=c("Cognitive Behavioral Therapy","Control","Family Treatment"))
