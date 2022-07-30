library(dplyr)

pokemon <- read.csv(file = 'Data/Pokemon/df_pokemon.csv')
types <- read.csv(file = 'Data/Pokemon/df_types.csv')

## bazowy R
pokemon[pokemon$Rarity == 'Baby',]

## dplyr
pokemon %>%
  filter(Rarity == "Baby" & Generation == 2)

pokemon %>%
  filter(Rarity == "Baby" | Generation == 2)


pokemon %>%
  select(Rarity, Generation)

# every column except for ...
pokemon %>% 
  select(-Rarity, -Generation)

pokemon %>% 
  select(1:4) %>% 
  filter(Variant == 'Mega')

pokemon %>% 
  select(1:4) %>% 
  filter(Variant == 'Mega') %>% 
  arrange(Species)

pokemon %>% 
  select(1:4) %>% 
  filter(Variant == 'Mega') %>% 
  arrange(desc(Species))

pokemon %>% 
  top_n(1, Species)
          

pokemon %>% 
  mutate(AD_ratio = Attack/Defense) %>% 
  View()

pokemon %>% 
  summarise(average_attack = mean(Attack, na.rm=TRUE))

pokemon %>% 
  summarise(mean_attack = median(Attack, na.rm=TRUE))

pokemon %>% 
  summarise(min_attack = min(Attack, na.rm=TRUE))

pokemon %>% 
  summarise(sum_attack = sum(Attack, na.rm=TRUE))

# odchylenie standardowe
pokemon %>% 
  summarise(sd_attack = sd(Attack, na.rm=TRUE))

# kwantyl
pokemon %>% 
  summarise(quant_attack = quantile(Attack, 0.9, na.rm=TRUE))


pokemon %>% 
  group_by(Variant) %>% 
  summarise(mean_attack = mean(Attack, na.rm=TRUE)) %>% 
  arrange(mean_attack) %>% 
  summarise(min_avg_attack = min(mean_attack, na.rm = TRUE))

pokemon %>% 
  group_by(Generation, Rarity) %>% 
  summarise(mean_attack = mean(Attack, na.rm=TRUE))


pokemon <- 
  pokemon %>% 
  mutate(Type1 = tolower(Type1))

inner_join(x = pokemon, y = types, by = c('Type1' = 'Name')) %>% 
  rename(TypeGeneration = Generation.y, PokemonGeneration = Generation.x) %>% 
  View()

  