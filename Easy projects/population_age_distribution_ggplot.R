library(datasets)
library(tidyverse)

Country.Pop.15.75 <- subset(LifeCycleSavings,select = c("pop15","pop75"))
head(Country.Pop.15.75)


Country.Pop.15.75 <- rownames_to_column(Country.Pop.15.75, var = "Country")


Country.Pop.15.75.long <- gather(Country.Pop.15.75, key = "Percent", value = "Value", pop15:pop75)

# Country.Pop.15.75.long <- head(Country.Pop.15.75.long)


ggplot(Country.Pop.15.75.long,aes(x=Country,y=Value,fill=Percent))  +
   geom_bar(stat = "identity", position = "dodge")  +
   
  scale_fill_manual(labels = c("Under 15", "Over 75"),, values = c("blue", "red")) +
  
  # scale_fill_grey(labels = c("Under 15", "Over 75")) +
  theme_minimal()

