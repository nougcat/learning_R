library(dplyr)
daty <- read.csv(file = 'Data/Chicago/CrimeDate.csv')
opisy <- read.csv(file = 'Data/Chicago/CrimeDesc.csv')
lokacje <- read.csv(file = 'Data/Chicago/CrimeLocation.csv')

#1 - wybierz wszystkie wiersze tabeli opisy z kolumną primary_type - THEFT

opisy %>% 
  filter(primary_type == 'THEFT')


#2 - posortuj 100 pierwszych wierszy tabeli opisy względem primary_type oraz date malejąco

opisy %>% 
  arrange(primary_type) %>% 
  arrange(desc(date)) %>% 
  head(100)

#3 - wybierz wszystkie wiersze tabeli opisy, w ktorych dowolne pole zawiera wartość NA

opisy %>% 
  filter(is.na(description) | is.na(date) | is.nate(primary_type))


#4 - z tabeli lokacje wybierz 100 pierwszych wierszy kolumn year oraz primary_type

lokacje %>%
  head(100) %>% 
  select(year, primary_type)

#5a - przygotuj zestawienie (zliczenie) względem roku dla danych z zadania 4

lokacje %>%
  head(100) %>% 
  select(year, primary_type) %>% 
  count(year)

#5b - przygotuj zestawienie (zliczenie) względem typu dla danych z zadania 4

lokacje %>%
  head(100) %>% 
  select(year, primary_type) %>% 
  count(primary_type)

#6 - dodaj nową kolumnę do lokację, która połączy ze sobą kolumny szerokości i długości geograficznej w formacie (szer, dł)

lokacje <- 
  lokacje %>% 
  mutate(location = paste(latitude, ',' , longitude) )

#7 - podaj średnią liczbę przestępstw z podziale na lata/w podziale na miesiące (oba podziały)

daty %>%
  mutate(year_month = substring(date, 1, 7) ) %>%
  group_by(year_month) %>% 
  summarise(crime_count) %>%
  count(year_month) %>% 
  View()
  

#8 - zmien nazwe nowo utworzonej kolumny na inną

lokacje <- 
rename(lokacje, loc = location)

orders_details <- read.csv(file = "Northwind/order-details.csv", sep = "|")
orders <- read.csv(file = "Northwind/orders.csv", sep = "|")
products <- read.csv(file = "Northwind/products.csv", sep = "|")
customers <- read.csv(file = "Northwind/customers.csv", sep = "|")

#9
# (wskazówka, utworzyć wektor ID zamówień, które zawierają Chai; użyć %in% aby odfiltrować te, które zwierają się w tym wektorze)
# (inner_join, select, filter)
#znajdz ID zamowień, ktore zawierały produkt o nazwie Chang, ale nie zawierały produktu o nazwie Chai

orders %>% 
  inner_join(products, by = c('OrderID')) %>% 
  filter(ProductName == 'Chang') %>% 
  select(OrderID)


#10
# (inner_join, select, filter, substr, arrange, unique)
#znajdz wszystkie produkty (zaczynające się na literę 'G' lub 'g') zamowione przed klientow ze Szwecji
#podaj: nazwe produktów
#posortuj rosnąco po nazwie produktu

