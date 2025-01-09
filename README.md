This project aims to analyze and forecast the number of visitors to the UK based on historical data. The data is used to create a linear regression model, which is then utilized to predict the number of visitors for the upcoming years (2024-2030). The results are visualized with actual and predicted visitor numbers.

Project Overview
The dataset contains the number of visitors to the UK over several years. The project leverages R and the tidyverse package to analyze the data, build a predictive model, and visualize the results.

Key steps of the project:

Data Loading and Cleaning: The data is imported from an Excel file, cleaned, and transformed into a suitable format.
Exploratory Data Analysis: Basic summary statistics and a correlation analysis are conducted on the data.
Linear Regression Modeling: A simple linear regression model is fitted to predict the number of visitors based on the year.
Forecasting: The model is used to predict the number of visitors for future years (2024-2030).
Visualization: A line plot is created to visualize both the actual and predicted visitor numbers over time.
Prerequisites
To run this project, you'll need the following R packages installed:

tidyverse: For data manipulation and visualization.
readxl: For reading Excel files.
You can install these packages using the following commands:

r
复制代码
install.packages("tidyverse")
install.packages("readxl")
Installation
Clone this repository to your local machine:

bash
复制代码
git clone https://github.com/yourusername/OS-visits-to-UK.git
Open the R script or RStudio project in your local environment.

Ensure that the ott.xlsx file is located in the specified directory (or modify the file path in the script).

Usage
Load the necessary libraries:

r
复制代码
library(tidyverse)
library(readxl)
Read the data:

r
复制代码
ott <- read_excel("path/to/ott.xlsx")
Clean and transform the data:

r
复制代码
data <- ott[7:50, 1:2]
colnames(data) <- c("year", "visitors:Thousands")
Convert data types:

r
复制代码
data$year <- as.numeric(data$year)
data$`visitors:Thousands` <- as.numeric(data$`visitors:Thousands`)
Build the linear regression model:

r
复制代码
model <- lm(`visitors:Thousands` ~ year, data = data)
Make predictions for future years (2024-2030):

r
复制代码
future_years <- data.frame(year = 2024:2030)
predictions <- predict(model, newdata = future_years)
Combine the actual and predicted data:

r
复制代码
forecast_data <- data.frame(year = 2024:2030, predicted_visitors = predictions)
combined_data <- rbind(data, forecast_data)
Visualize the results:

r
复制代码
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
