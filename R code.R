library(tidyverse)
library(readxl)
ott <- read_excel("C:/Users/123/ott/ott.xlsx")
View(ott)
str(ott)
data <- ott[7:50,1:2]
colnames(data) <- c("year", "visitors:Thousands")
head(data)
summary(data)
class(data$year)
class(data$`visitors:Thousands`)
data$year <- as.numeric(data$year)
data$`visitors:Thousands` <- as.numeric(data$`visitors:Thousands`)
summary(data$`visitors:Thousands`)
cor(data$year, data$`visitors:Thousands`)
plot(data,type="l", col="blue", xlab="year", ylab="the number of visitors:Thousands", main="OS visits to UK:All visits Thousands-NSA") 
model <- lm(`visitors:Thousands` ~ year, data = data)
summary(model)
future_years <- data.frame(year = 2024:2030)
predictions <- predict(model, newdata = future_years)
forecast_data <- data.frame(year = 2024:2030, predicted_visitors = predictions)
print(forecast_data)
colnames(forecast_data) <- c("year", `visitors:Thousands`)
combined_data <- rbind(data, forecast_data)
view(combined_data)
ggplot(combined_data, aes(x = year, y =`visitors:Thousands`)) +
  geom_line(color = "blue") + 
  geom_point(aes(color = ifelse(year >= 2024, "Predicted", "Actual")), size = 2) + 
  scale_color_manual(values = c("Actual" = "black", "Predicted" = "red")) + 
  labs(
    x = "Year", 
    y = "Visitors (Thousands)", 
    title = "OS Visits to UK: Actual and Predicted Visitors (Thousands)",
    caption = "Predictions for 2024-2030 based on historical data"
  ) 