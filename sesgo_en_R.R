#INSTALAMOS LOS PAQUETES NECESARIOS
install.packages("SimDesign")

#CARGAMOS LOS PAQUETES INSTALADOS PREVIAMENTE
library(SimDesign)
library(tidyverse)

#CREACIÓN DE DATOS
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicte_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, predicte_temp) #cuanto más cercano a cero menor sesgo tiene nuestro modelo

actual_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300)
bias(actual_sales, predicted_sales)