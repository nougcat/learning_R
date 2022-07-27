library(dplyr)
data <- as.data.frame(starwars)

head(data)
dim(data)
names(data)
summarise(data)
tail(data)
str(data)

data[41:45, 7:9]
data[41, 7]
data[,1]
data['name', 'height']

data$name
data[data$birth_year > 10, 1:3]

# wymiary
dim(data)
# typy zmiennych
str(data)

# unikalnych wart zmiennej planeta
unique(na.omit(data$homeworld))

#średni wzrost postaci z Tatooine
mean(na.omit(data$height[data$homeworld == 'Tatooine']))


for (i in 1:10){
  print(i)
}

if(3>2){
  print("yes")
}
