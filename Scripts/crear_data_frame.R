names <- c("Nicolás", "Victoria", "Guadalupe", "Gregorio", "Franco")
age <- c(27, 25, 27, 26, 26)

people <- data.frame(names, age)
head(people)
str(people)
glimpse(people)
colnames(people)

mutate(people, age_in_20 = age + 20)
