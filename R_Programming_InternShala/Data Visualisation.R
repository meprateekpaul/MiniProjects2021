# Scatterplots 

# simple scatterplot
x <- 1:10
y <- c(-1,2,5,4,-9,-15,5,22,-30,0)
plot(x,y)

library(datasets)

# add labels, real data
plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)

# clear graphics
graphics.off()

# Line charts 

# simple line chart
x <- 1:100
y <- log(x)
plot(x,y,type = "l")

# add labels
plot(x,y,
     type = "l",
     xlab = "x",
     ylab = "log(x)",
     main = "log function",
     lwd = 3,
     col = "brown3")

# multiple lines 
z <- log10(x)
w <- log(x, base = 20)

plot(x,y,
     type = "l",
     xlab = "x",
     ylab = "f(x)",
     main = "log functions",
     lwd = 3,
     col = "brown3",
     ylim = c(0,5))
lines(x,z,
      lwd = 3,
      col = "deepskyblue")
lines(x,w,
      lwd = 3,
      col = "purple")
abline(h = 5,
       lwd = 1,
       col = "black",
       lty = 3)

# add legend
plot(x,y,
     type = "l",
     xlab = "x",
     ylab = "f(x)",
     main = "log functions",
     lwd = 3,
     col = "brown3",
     ylim = c(0,5))
lines(x,z,
      lwd = 3,
      col = "deepskyblue")
lines(x,w,
      lwd = 3,
      col = "purple")
abline(h = 5,
       lwd = 1,
       col = "black",
       lty = 3)
legend("topleft", 
       col = c("brown3", "deepskyblue", "purple"),
       lty = c(1,1,1), lwd = c(3,3,3),
       legend = c("log", "log10", "log20"))


# Code challenge
# Module 5: Data Visualisation in R
# Line chart

# Solution:

# We would like to create a simple line chart showing how f(x) is depended of x in a square root function.

# Use R to execute the steps given below:
# 1) Generate vector "x" as a sequence between 0 and 100 with a step size 0.25 (hint use seq() function).
x <- seq(from = 0, to = 100, by = .25)

# 2) Calculate vector "y" as a square root of "x" (hint: use function sqrt())
y <- sqrt(x)

# 3) Now plot the square root function as a line chart. Inside plot() consider the following:
#   - on x axis use "x" vector
#   - on y axis use "y" vector
#   - use line not points for drawing
#   - line width should be 2
#   - line color should be "blue"
#   - on x axis label write "x"
#   - on y axis label write "f(x)"
#   - for the title of the plot write "Square root function"
plot(x = x, 
     y = y, 
     type = "l", 
     lwd = 2, 
     col = "blue", 
     xlab = "x", 
     ylab = "f(x)", 
     main = "Square root function")


# Histograms & density plots

# simple histogram

set.seed("1234")
x <- runif(n = 1000, min = 0, max = 50)  # generate some random numbers
hist(x)

# add colors and labels
x <- rnorm(n = 1000, mean = 0, sd = 1)
hist(x = x,
     main = "Normal distribution N(0,1)",
     col = "deepskyblue2",
     border = "red",
     breaks = 30, 
     freq = F)

# draw density plot
d <- density(x)
plot(d, 
     main = "Density plot", 
     frame = F, 
     col = "brown1", 
     lwd = 2)

# combine histogram and density plot
hist(x = x,
     main = "Normal distribution N(0,1)",
     col = "deepskyblue2",
     border = "black",
     breaks = 30, 
     freq = F)
lines(d, 
      col = "brown1", 
      lwd = 2)

graphics.off()

# Code challenge
# Module 5: Data Visualisation in R
# Histogram

# Solution:

# Instructions:

# First run the code below to generate values ("x") from selected Gaussian distribution.
x <- rnorm(n = 1000, mean = 0, sd = 1) 

# Use R to execute the steps given below:
# 1) Visualize the distribution of variable "x" using histogram plot.
# 2) When drawing histogram consider the following:
#   - number of bins or breaks should be 60
#   - bin color should be "red"
#   - border color of bins should be "black"
#   - on x axis label write "x"
#   - on y axis label write "Frequency"
#   - for the title of the plot write "Gaussian distribution - histogram"
hist(x = x, 
     breaks = 60, 
     col = "red", 
     border = "black", 
     xlab = "x", 
     ylab = "Frequency", 
     main = "Gaussian distribution - histogram")

# Box plots

# simple box plot
x <- rnorm(n = 1000, mean = 10, sd = 5)
boxplot(x)

# add real data, labels
boxplot(formula = mpg~cyl,
        data = mtcars,
        main = "Box plot",
        xlab = "Number of cylinders (cyl)",
        ylab = "Miles per gallon (mpg)")

# Bar charts

# simple bar chart
counts <- table(mtcars$cyl)
barplot(counts)

# create stacked bar chart
counts <- table(mtcars$vs, mtcars$cyl)
barplot(counts, 
        main="Car distribution by cylinders and VS",
        xlab="Number of cylinders", 
        ylab = "Frequency",
        col=c("deepskyblue","brown1"),
        legend = rownames(counts))

# create grouped bar chart
barplot(counts, 
        main="Car distribution by cylinders and VS",
        xlab="Number of cylinders", 
        ylab = "Frequency",
        col=c("deepskyblue","brown1"),
        legend = rownames(counts),
        beside = TRUE)
# Code challenge
# Module 5: Data Visualisation in R
# Bar chart

# Solution:


# Instructions:

# For this exercise we will use the built in "mtcars" dataset. We would like to show how
# the number of cylinders in a car is related to the engine type. 
# ("cyl" - number of cylinders, "vs" - engine type)

# First run the code below, and prepare data for drawing a bar chart.
data <- mtcars[, c("cyl", "vs")]                  # use only relevant columns
data[which(data["vs"] == 0), "vs"] <- "V-shapped" # recode vs variable value 0
data[which(data["vs"] == 1), "vs"] <- "straight"  # recode vs variable value 1
counts <- table(data$cyl, data$vs)                # create count for the bar chart

# Use R to execute the steps given below:
# 1) Create a bar chart using "counts" object.
# 2) When drawing bar chart consider the following:
#   - we would like to create a grouped bar chart
#   - on x axis label write "Engine type"
#   - on y axis label write "Number of cylinders"
#   - for the title of the plot write "Engine type VS Cylinders - bar chart"
barplot(counts, 
        main = "Engine type VS Cylinders - bar chart",
        xlab = "Engine type", 
        ylab = "Number of cylinders",
        beside = TRUE)

# Graphical parameters

# par() function
par()

par.default <- par() # save default parameters


# alter plotting simbols pch
par(pch = 8)

# scatterplot
x <- 1:10
y <- c(-1,2,5,4,-9,-15,5,22,-30,0)
plot(x,y)

plot(x,y,pch = 20)


# alter text and symbol size
par(cex = 2)

plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone")

par(cex = 2, cex.axis = 0.5, cex.lab = 0.75, cex.main = 0.8)


# Altering lines
par(par.default) # reset to default parameters

x <- 0:10
plot(x = x, y = rep(1,11), type = "l", lty = 1, lwd = 2, ylim = c(0,7), xlim = c(0,10))
abline(h = 2, lty = 2, lwd = 2)
abline(h = 3, lty = 3, lwd = 2)
abline(h = 4, lty = 4, lwd = 2)
abline(h = 5, lty = 5, lwd = 2)
abline(h = 6, lty = 6, lwd = 2)

# Colors

# The same "white" color
x1 <- 1
y1 <- 1
x2 <- 5
y2 <- 5
x3 <- 10
y3 <- 10

colors() # vector of colors

plot(x1,y1, pch = 21, cex = 3, col = "black", bg = "white", xlim = c(-20,20), ylim = c(-20,20))
points(x2,y2, pch = 21, cex = 3, col = "black", bg = "#ffffff")
points(x3,y3, pch = 21, cex = 3, col = "black", bg = colors()[1])

# alter colors of labels
par(col = "red", col.axis = "green", col.lab = "yellow", col.main = "black", fg = "gray87", bg = "gray50")

plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)


# Fonts
par(par.default)
par(font = 1, font.axis = 3, font.lab = 5, font.main = 2, ps = 20, family = "sans")
plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)

# Margins
par(mar = c(0,0,0,0))
par(mar = c(2,0,0,2))
par(mar = c(2,2,2,2))
par(mar = c(5,5,5,5))

plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)

# Code challenge
# Module 6: Data Visualisation in R
# Graphical parameters

# Solution:

# Instructions:

# The code below creates a scatterplot similar as we have seen in the videos
# before. Your job is only to alter the par() function to get the desired output:
# 1) Increase relative text and symbol size to 3 (hint: cex parameter)
# 2) Change plot margins, margins should be 4 inches on all 4 sides
#    bottom, left, top, right (hint: use mar parameter)

par.default <- par() # save default parameters

par(cex = 2, mar = c(4,4,4,4)) # you need to change this part !!!!

plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)

par(par.default) # reset graphical parameters

# Multi-plots

# Subplots

# Grid 3X1 mfrow
par(mfrow = c(3,1))
plot(airquality$Wind, airquality$Ozone, xlab = "", ylab = "", main = "Fig1")
plot(airquality$Ozone, airquality$Wind, xlab = "", ylab = "", main = "Fig2")
hist(airquality$Wind, xlab = "", ylab = "", main = "Fig3")


# Grid 2X2 mfrow
par(mfrow = c(2,2))
plot(airquality$Wind, airquality$Ozone, xlab = "", ylab = "", main = "Fig1")
plot(airquality$Ozone, airquality$Wind, xlab = "", ylab = "", main = "Fig2")
hist(airquality$Wind, xlab = "", ylab = "", main = "Fig3")
hist(airquality$Ozone, xlab = "", ylab = "", main = "Fig4")

# Grid 2X2 mfcol
par(mfrow = c(1,1))
par(mfcol = c(2,2))
plot(airquality$Wind, airquality$Ozone, xlab = "", ylab = "", main = "Fig1")
plot(airquality$Ozone, airquality$Wind, xlab = "", ylab = "", main = "Fig2")
hist(airquality$Wind, xlab = "", ylab = "", main = "Fig3")
hist(airquality$Ozone, xlab = "", ylab = "", main = "Fig4")


# Save figure

# save figure in png format
png("figure1.png")
plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)
dev.off()

png("figure2.png",
    width = 1024, 
    height = 800, 
    units = "px")
plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)
dev.off()

# save figure in pdf format
pdf("figure3.pdf", 
    width = 11.7, 
    height = 8.3)
plot(x = airquality$Wind,
     y = airquality$Ozone,
     col = "blue",
     main = "Ozone VS Wind",
     xlab = "Wind",
     ylab = "Ozone",
     pch = 16)
dev.off()


# save multiplot
pdf("figure4.pdf", 
    width = 11.7, 
    height = 8.3)
par(mfcol = c(2,2))
plot(airquality$Wind, airquality$Ozone, xlab = "", ylab = "", main = "Fig1")
plot(airquality$Ozone, airquality$Wind, xlab = "", ylab = "", main = "Fig2")
hist(airquality$Wind, xlab = "", ylab = "", main = "Fig3")
hist(airquality$Ozone, xlab = "", ylab = "", main = "Fig4")
dev.off()

# Code challenge
# Module 6: Data Visualisation in R
# Multi-plots

# Solution:

# Instructions:

# The code below creates 4 different plots similar as we have seen in the videos
# before. The plots are drawn in a 4 rows by 1 column grid.
# Your job is only to alter the par() function to draw
# plots in a 2 rows and 2 columns grid (2 plots in the first row
# and 2 plots in the second row)

par.default <- par() # save default parameters

par(mfrow = c(2,2)) # you need to change this part !!!!

plot(airquality$Wind, airquality$Ozone, xlab = "", ylab = "", main = "Fig1")
plot(airquality$Ozone, airquality$Wind, xlab = "", ylab = "", main = "Fig2")
hist(airquality$Wind, xlab = "", ylab = "", main = "Fig3")
hist(airquality$Ozone, xlab = "", ylab = "", main = "Fig4")

par(par.default) # reset graphical parameters

years <- 1:10
revenue <- years*2000*(1-runif(n=1,min=0,max=0.5))
plot(years,
     revenue,
     type = "l")
