## plot2.R
## Creates a line graph of Global Active Power over time

plot2 <- function(data = NULL, to_png = TRUE) {
  ## load the data if not present
  if(is.null(data)) {
    source("./load_data.R")
    data <- load_data()
  }
  
  ## write to file if selected
  if(to_png) png(file = "plot2.png", width = 480, height = 480)
  
  ## Generate the plot
  with(data,
       plot( datetime,
             Global_active_power,
             type = "l",
             main = "",
             xlab = "",
             ylab = "Global Active Power (kilowatts)",
        )
    )
  
  ## Close file if selected
  if(to_png) dev.off()
  
}