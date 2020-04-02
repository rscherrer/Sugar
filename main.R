rm(list = ls())
data <- read.csv("sugar.csv", header = TRUE, na.strings = "<NA>")
head(data)
data$date <- as.Date(data$date)
numeric_cols <- c("gbef", "carb", "ins", "gaft")
data[numeric_cols] <- sapply(data[numeric_cols], function(x) as.numeric(as.character(x)))

head(data)

data$delta <- with(data, gaft - gbef)
data$ratio <- with(data, ins / carb)

library(tidyverse)
ggplot(data[grep("03-20", data$date),], aes(x = ratio, y = delta, color = meal)) + geom_point()
