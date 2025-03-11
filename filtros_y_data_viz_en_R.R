#DEFINIMOS EL DF CON EL OPERADOR DE ASIGNACIÓN Y USAMOS LA FUNCIÓN READ_CSV() PARA LEER EL ARCHIVO
bookings_df <- read_csv("hotel_bookings.csv", locale = locale(encoding = "Windows-1252"))

#NOS FAMILIARIZAMOS CON EL DF
head(hotel_bookings)
colnames(hotel_bookings)

#INSTALAMOS LOS PAQUETES NECESARIOS
install.packages("ggplot2")

#CARGAMOS LOS PAQUETES PREVIAMENTE INSTALADOS
library(ggplot2)
library(tidyverse)

#CREAMOS ALGUNOS GRÁFICOS O DIAGRAMAS
ggplot(data = bookings_df) + #de acá obtenemos los datos
  geom_point(mapping = aes(x = lead_time, y = children)) #acá indicamos el tipo de gráfico

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment) #usar la función facet_wrap() para crear un gráfico diferente para cada segmento del mercado

#Después de analizar todos los datos, tu clienta decide enviar la promoción a familias que realizan reservas de hoteles urbanos en línea. Este segmento es el de crecimiento más acelerado, y las familias tienden a gastar más en hoteles urbanos que otros tipos de huéspedes.
#Tu clienta te pregunta si puedes crear un gráfico que muestre la relación entre el tiempo de antelación de la reserva y los huéspedes que viajan con niños para las reservas en línea de los hoteles urbanos. Esto le dará una mejor idea del mejor momento para realizar la promoción.
#Divides en dos pasos: Filtrar los datos y Graficar los datos filtrados.

#VAMOS A FILTRAR DATOS ANTES DE HACER DATA VIZ
  #Opción 1
onlineta_city_hotels <- filter(bookings_df, 
                               (hotel=="City Hotel" &
                                  bookings_df$market_segment=="Online TA"))

View(onlineta_city_hotels) #vemos nuestro nuevo df

  #Opción 2 con pipes
onlineta_city_hotels_v2 <- bookings_df %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA") %>% 
  rename( #NOS DAMOS CUENTA QUE NECESITAMOS MODIFICAR EL DF PORQUE DOS COLUMNAS TIENEN UN NOMBRE QUE NO CORRESPONDE
    niños = `ni–os`,
    bebes = `bebŽs`)

View(onlineta_city_hotels_v2)

#AHORA USAMOS ALGUNO DE LOS NUEVOS DF PARA HACER UN GRÁFICO DE DISPERSIÓN
ggplot(data = onlineta_city_hotels_v2) +
  geom_point(mapping = aes(x = lead_time, y = niños))