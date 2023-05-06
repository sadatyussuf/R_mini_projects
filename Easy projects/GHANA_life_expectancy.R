setwd("D:/datasets")


library(conflicted)
library(tidyverse)
library(stringr)
library(ggplot2)

life_expect <- read.csv('API_SP.DYN.LE00.IN_DS2_en_csv_v2_5358385/API_SP.DYN.LE00.IN_DS2_en_csv_v2_5358385.csv',header = TRUE)
countries_continents2 <- read.csv('continents-according-to-our-world-in-data.csv')

colnames(life_expect)[2] <-"Code"

life_expect <- life_expect %>% 
  gather(key="Year",value ='Life.Expectancy',X1960:X2021) %>%
  mutate(Year=str_remove(Year,'X')) %>%
  mutate(Year=as.Date(Year,format='%Y'))  %>%
  left_join(countries_continents2,by='Code') %>% 
  dplyr::filter(!is.na(Continent))%>%
  dplyr::filter(!is.na(Life.Expectancy)) %>%
  subset(select = c('Country','Code',"Continent","Year","Life.Expectancy"))


GH_life_expect <- life_expect  %>%
  plotly::filter(Country =="Ghana")


ggplot(GH_life_expect,aes(x=Year,y=Life.Expectancy)) +
  geom_point(color='blue') +
  geom_line(color='red') +
  labs(title = "Ghana's life expectancy from 1960 to 2022",
       x= 'Year',
       y=' Life Expectency') +
  theme_grey(base_size = 15)

summary(GH_life_expect$Life.Expectancy)

