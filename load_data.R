## load_data.R
## Pull the Electric Power Consumption data from the UC Irvine Machine Learning 
## Repository, limited to the time-frame specified by the project guidelines:
## 2007-02-01 through 2007-02-02
## Converts strings to datetime and numeric formats

load_data <- function() {
  ## Variables required to capture and filter the data
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  file_name <- "household_power_consumption.txt"
  
  ## Create a temporary file to download the compressed data
  temp <- tempfile()
  
  ## Download the data and store it in the temporary file
  download.file(url, temp)
  
  ## Unzip the data
  data <- read.table(unz(temp, file_name), header = TRUE, sep = ";")
  
  ## Unlink the temporary file
  unlink(temp)
  
  ## Subset by date
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
  
  ## Format dates 
  data$datetime <- with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
  
  ## Format Numerics
  data[,3:9] <- sapply(data[, 3:9], as.numeric)
  
  ## Select relevant columns, with datetime as column #1
  data <- data[, c(10, 3:9)]
  
  ## Return data
  data
}