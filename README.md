This project aims to analyze and forecast the number of visitors to the UK based on historical data. The data is used to create a linear regression model, which is then utilized to predict the number of visitors for the upcoming years (2024-2030). The results are visualized with actual and predicted visitor numbers.


To run this project, you'll need the following R packages installed:
tidyverse: For data manipulation and visualization.
readxl: For reading Excel files.

You can install these packages using the following commands:
install.packages("tidyverse")
install.packages("readxl")

Load the necessary libraries:
library(tidyverse)
library(readxl)

Read the data:
ott <- read_excel("path/to/ott.xlsx")

Clean and transform the data:
data <- ott[7:50, 1:2]
colnames(data) <- c("year", "visitors:Thousands")

Convert data types:
data$year <- as.numeric(data$year)
data$`visitors:Thousands` <- as.numeric(data$`visitors:Thousands`)

Build the linear regression model:
model <- lm(`visitors:Thousands` ~ year, data = data)

Make predictions for future years (2024-2030):
future_years <- data.frame(year = 2024:2030)
predictions <- predict(model, newdata = future_years)

Combine the actual and predicted data:
forecast_data <- data.frame(year = 2024:2030, predicted_visitors = predictions)
combined_data <- rbind(data, forecast_data)

Visualize the results:
ggplot(combined_data, aes(x = year, y = `visitors:Thousands`)) +
  geom_line(color = "blue") + 
  geom_point(aes(color = ifelse(year >= 2024, "Predicted", "Actual")), size = 2) + 
  scale_color_manual(values = c("Actual" = "black", "Predicted" = "red")) + 
  labs(
    x = "Year", 
    y = "Visitors (Thousands)", 
    title = "OS Visits to UK: Actual and Predicted Visitors (Thousands)",
    caption = "Predictions for 2024-2030 based on historical data"
  )
