## plot4.R
## Scribe the 4 plots in a 2x2 matrix

plot4 <- function(data = NULL, to_png = TRUE) {
  if(is.null(data)) {
    source("./load_data.R")
    data <- load_data()
  }
  
  ## Write to file if selected
  if(to_png) png(file = "plot4.png", width = 480, height = 480)
  
  ## Create a 2x2 matrix for 4 graphs
  par(mfrow = c(2,2))
  
  ## Plot the first graph
  with(data,
       plot(datetime,
            Global_active_power,
            type = "l",
            xlab = "",
            ylab = "Global Active Power"
            )
       )
  
  ## Plot the second graph
  with(data,
       plot(datetime,
            Voltage,
            type = "l",
            )
       )
  
  ## Plot the third graph from file
  source("./plot3.R")
  plot3(data, FALSE)
  
  ## Plot the fourth graph
  with(data,
       plot(datetime,
            Global_reactive_power,
            type = "l"
            )
       )
  
  ## Close the file if selected
  if(to_png) dev.off()
  
}