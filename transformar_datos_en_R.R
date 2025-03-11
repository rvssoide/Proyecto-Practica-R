#CREAMOS LOS VECTORES
id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

#CREAMOS EL DF
employee <- data.frame(id, name, job_title)

#CHEQUEAMOS EL DF
print(employee)

#TRANSFORMAMOS DATOS
separate(employee, name,into=c('first_name', 'last_name'), sep=' ') #separamos los datos de la columna name en nombre y apellido, basándonos en ' ' como separador

unite(employee, 'name',first_name,last_name,sep=' ') #unimos dos columnas en una única, primero nombramos la nueva columna y luego indicamos cuáles queremos unir, por último indicamos qué va a separar los datos
