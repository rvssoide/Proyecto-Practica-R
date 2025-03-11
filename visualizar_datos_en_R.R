#INSTALAMOS LOS PAQUETES NECESARIOS
install.packages("Tmisc")
install.packages("datasauRus")

#CARGAMOS LOS PAQUETES PREVIAMENTE INSTALADOS
library(Tmisc)
library(tidyverse)
library(datasauRus)

#UTILIZAMOS EL DATASET
data(quartet)

#VISUALIZAMOS EL DATASET
View(quartet) #la V mayúscula nos permite abrirlo en una pestaña nueva

#EMPEZAMOS CON EL ANÁLISIS: MEDIA Y DESVIACIÓN ESTÁNDAR DE LOS CUATRO DATASETS
quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),sd(x),mean(y),sd(y),cor(x,y))

#VISUALIZACIÓN DE DATOS
ggplot(quartet,aes(x,y)) + geom_point() + geom_smooth(method=lm,se=FALSE) + facet_wrap(~set)

ggplot(datasaurus_dozen,aes(x=x, y=y, colour=dataset))+geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(~dataset,ncol=3)