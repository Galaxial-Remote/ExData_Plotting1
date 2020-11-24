## plot1.R
## Constructs Plot 1 according to the assignment

plot1 <- function(data = NULL, to_png = TRUE) {
  ## load the data if not present
  if(is.null(data)) {
    source("./load_data.R")
    data <- load_data()
  }
  
  ## Write to file if selected
  if(to_png) png(file = "plot1.png", width = 480, height = 480)
  
  ## Plot the histogram
  with(data,
       hist(Gobal_active_power,
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             ylab = "Frequency",
             col = "red",
             breaks = 16,
             axes = FALSE
        )
    )
  
  ## Customize the axes
  axis(side = 2, at = seq(0, 1200, 200))
  axis(side = 1, at = seq(0, 6, 2))
  
  ## Close file if selected
  if(to_png) dev.off()
}