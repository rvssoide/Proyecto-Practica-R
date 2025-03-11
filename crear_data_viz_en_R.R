#CARGAMOS LOS PAQUETES PREVIAMENTE INSTALADOS
library(ggplot2)
library(palmerpenguins)

#EXAMINAMOS EL DATAFRAME
data(penguins)
View(penguins)

#supongamos que queremos modelar la relación entre masa corporal y longitud de aletas en las tres especies de pingüino
#ambas variables son cuantitativas, una forma correcta es hacerlo a través de un scatterplot

ggplot(data = penguins)+geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))

#DESCRIPCIÓN DEL CÓDIGO ANTERIOR
#ggplot(data=penguins) para especificar el df a utilizar
# + usamos este símbolo para sumar una capa nueva al diagrama
#geom_point() elegimos una figura geom, en este caso puntos para hacer el diagrama de dispersión
#(mapping=aes(x=flipper_length_mm, y=body_mass_g)) el argumento de mapeo siempre va acompañado de la función aes() para especificar qué variables aplicar al eje X e Y

#En este caso, el diagrama muestra una relación positiva entre las dos variables. Es decir, cuanto más grande es el pingüino, más larga es la aleta.

#OTRO EJEMPLO
ggplot(data=penguins)+geom_point(mapping = aes(x=bill_length_mm, y=bill_depth_mm))

#AGREGAMOS NUEVAS DIMENSIONES ESTÉTICAS AL GRÁFICO
#puede ser como un parámetro dentro de la función aes() y asignamos una variables para cada dimensión estética
#o puede ser como un parámetro dentro de la función geom_pint() y no asignamos ninguna variables sino que la dimensión estética pasa a ser algo general del gráfico
ggplot(data = penguins)+geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g,color=species,shape=species),color="blue")

#HACEMOS DOS GRÁFICOS EN UNO
ggplot(data = penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g, linetype = species))+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))

#UTILIZAMOS OTRO DF LLAMADO DIAMONDS PARA HACER UN BAR CHART
data("diamonds")
View(diamonds)

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, color=cut, fill=cut)) #R automáticamente cuenta cuántas veces aparece cada valor X en los datos y lo muestra en el eje Y

#FUNCIONES DE FACETA
ggplot(data = penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color=species))+
  facet_wrap(~species) #esto permite crear un diagrama separado para cada especie, acá facetamos por una sola variable

ggplot(data = penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color=species))+
  facet_grid(sex~species) #esto permite crear un diagrama separado para cada especie, acá facetamos por dos variables