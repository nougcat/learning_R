# data from
# https://ourworldindata.org/nuclear-energy
library(dplyr)
library(ggplot2)
library(sf)
library(tidyverse)
library("rnaturalearth")
library("rnaturalearthdata")

energia <- read.csv(file ='nuclear-energy-generation.csv')

energia <- 
  energia %>% 
  filter(Year == '2020') %>% 
  filter(Code != '') %>%
  filter(Code != 'OWID_WRL')


world <- ne_countries(scale = "medium", returnclass = "sf")


world <- 
  world %>% 
  rename(Code = gu_a3)

names(world)


# joining data


world <- 
  world %>% 
    inner_join(energia, by = "Code")

# map
ggplot(data = world) +
  geom_sf(aes(fill = TWh)) +
  ggtitle("Produkcja energii nuklearnej", subtitle = 'dane z 2020 roku' )+
  scale_fill_gradient2(low = ('#DCDCDC'), high = ('#006400'), na.value= ('#DCDCDC'))

# japan
japan <- read.csv(file ='nuclear-energy-generation.csv')

japan <- 
  japan %>% 
    filter(Entity == 'Japan')

japan %>% 
  ggplot(mapping = aes(x = Year, y = TWh)) +
  geom_point() +
  geom_smooth() +
  scale_y_continuous(limits = c(0,NA))

