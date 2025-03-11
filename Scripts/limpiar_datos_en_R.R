#INSTALAMOS LOS PAQUETES QUE VAMOS A UTILIZAR
install.packages("tidyverse") 
install.packages("janitor")
install.packages("skimr")

#CARGAMOS LOS PAQUETES PREVIAMENTE INSTALADOS
library(tidyverse)
library(janitor)
library(skimr)

#ESTOS DOS PASOS ANTERIORES LOS PODEMOS HACER EN LA CONSOLA SI QUEREMOS UTILIZARLOS SOLO EN ESTA SESIÓN

#DEFINIMOS EL DF CON EL OPERADOR DE ASIGNACIÓN Y USAMOS LA FUNCIÓN READ_CSV() PARA LEER EL ARCHIVO
bookings_df <- read_csv("hotel_bookings.csv", locale = locale(encoding = "Windows-1252"))

#EXPLORAMOS LOS DATOS
head(bookings_df) #obtenemos las primeras filas del df 
str(bookings_df) #obtenemos la estrucutra del df
glimpse(bookings_df) #obtenemos la estructura del df más detallado y en horizontal
colnames(bookings_df) #obtenemos los nombres de las columnas que componen el df
skim_without_charts(bookings_df) #obtenemos un resumen completo del df

#LIMPIAMOS LOS DATOS
trimmed_df <- bookings_df %>% #creamos un nuevo vector con algunas variables del df original y usamos pipes para que el code sea más legible
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel) #renombramos la columna hotel por hotel_type para mayor claridad

head(trimmed_df) #nos aseguramos que el nuevo df se haya creado


example_df <- bookings_df %>% #definimos un nuevo df
  select(arrival_date_year, arrival_date_month) %>% #seleccionamos las variables que necesitamos
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ") #unimos las columnas de mes y año

head(example_df) #chequeamos que haya funcionado


example_2_df <- bookings_df %>% #definimos otro df
  rename(
    niños = `ni–os`,
    bebes = `bebŽs`
  ) %>% #renombramos algunas columnas para mayor claridad
  mutate(guests = adultos + niños + bebes) #sumamos 3 columnas para generar una única con la cantidad de personas hospedadas

head(example_2_df$guests) #chequeamos que haya funcionado, luego del $ agregamos la columna que queremos observar


#CALCULAMOS ESTADÍSTICAS DE RESUMEN
example_3_df <- bookings_df %>% #definimos el último df para esta actividad y usamos summarize para calcular
  summarize(number_canceled = sum(is_canceled), #número total de reservas canceladas
            average_lead_time = mean(lead_time)) #tiempo promedio de antelación de las reservas
  
  head(example_3_df) #vemos qué valores arrojan las nuevas columnas
  

#GENERAMOS DATA VIZ
ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))
