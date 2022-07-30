library(ggplot2)
library(dplyr)


data <- as.data.frame(iris)

data %>% 
  ggplot(mapping = aes(x = Species, y = Sepal.Length)) +
  geom_col()


data %>% 
  ggplot(mapping = aes(x = Sepal.Length))+
  geom_histogram() +
  ggtitle('histogram Sepal length', subtitle = 'frog')


data %>% 
  ggplot(mapping = aes(x = Sepal.Length))+
  geom_histogram(binwidth = 1.75) +
  labs(title = 'histogram Sepal length',
       subtitle = 'frog',
       x = 'długość płatka',
       y = 'liczność')


# graph can be an object
wykres <- 
  data %>% 
    ggplot(mapping = aes(x = Sepal.Length))+
    geom_histogram(binwidth = 1.75)

# you can format an object and modify it
wykres +
  labs(title = 'histogram Sepal length',
       subtitle = 'frog',
       x = 'długość płatka',
       y = 'liczność')

#
data %>% 
  ggplot(mapping = aes(x = Sepal.Length, fill = Species)) +
  geom_density(adjust = 3/4)

#
data %>% 
  ggplot(mapping = aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(alpha = 0.4)

#
data %>% 
  ggplot(mapping = aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(alpha = 1)

#
data %>% 
  ggplot(mapping = aes(x = Sepal.Length, Color = Species)) +
  geom_boxplot(alpha = 1, outliner.color = "black", outlier.shape = 'star')

#
data %>% 
  ggplot(mapping = aes(x = Sepal.Length, y=Sepal.Width, fill = Species)) +
  geom_violin(alpha = 0.5)

#
data %>% 
  ggplot(mapping = aes(x = Sepal.Length, fill = Species)) +
  geom_density(adjust = 3/4,alpha = 0.5) +
  scale_fill_brewer(palette ='PiYG')

data %>% 
  ggplot(mapping = aes(x = Sepal.Length, Color = Species)) +
  geom_density(adjust = 3/4,alpha = 0.5) +
  scale_fill_manual('green', 'yellow', 'blue')
