## plot3.R
## Creates a line graph of submetering 1,2 & 3 over time
source("./scripts/load_data.R")

plot3 <- function(data = NULL, to_png = TRUE) {
  ## load the data if not present
  if(is.null(data)) {
    source("./load_data.R")
    data <- load_data()
  }
  
  ## Write to file if selected
  if(to_png) png(file = "plot3.png", width = 480, height = 480)
  
  ## Generate the first plot
  with( data,
        plot(datetime,
             Sub_metering_1,
             type = "l",
             main = "",
             xlab = "",
             ylab = "Energy sub metering",
        )
  )
  
  ## Add two more submetering data lines
  with(data, lines(datetime, Sub_metering_2, type = "l", col = "red"))
  with(data, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
  
  ## Generate the legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
  
  ## Close the file if selected
  if(to_png) dev.off()
}