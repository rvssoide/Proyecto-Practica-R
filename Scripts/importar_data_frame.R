library(readr)
bookings_df <- read_csv("hotel_bookings.csv", locale = locale(encoding = "Windows-1252"))

head(bookings_df)

str(bookings_df)

colnames(bookings_df)

new_df <- select(bookings_df, "adr", "adultos")

mutate(new_df, total=adr/adultos)
