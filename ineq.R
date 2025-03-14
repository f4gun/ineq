# install and load necessary packages 
install.packages("ineq")
install.packages("dplyr")

library(ineq)
library(dplyr)

# import CSV and extract data of the countries you want 
# skip 2 lines to get the correct headings 
ineq_data <- read.csv("C:\\Users\\lenovo\\Downloads\\ineq\\GCIPrawdata.csv", skip=2)
selected_data <- ineq_data %>%
  filter(Country %in% c("United States", "India", "Germany", "United Kingdom") &
           Year %in% c(1980, 2014))

# select Germany 1980 and extract only decile data from columns
dec_germany80 <- as.numeric(selected_data[1,3:12])

# assuming population of 10, we can find total income
TI_germany80 <- 10*selected_data[1, "Mean.Income"]

# find the income share of each decile and then use cumsum function
Income_share_germany80 <- dec_germany80/TI_germany80
CI_share_germany80 <- cumsum(Income_share_germany80)
print(CI_share_germany80)

# repeat the same for Germany 2014 
dec_germany14 <- as.numeric(selected_data[2,3:12])
TI_germany14 <- 10*selected_data[2,"Mean.Income"]

Income_share_germany14 <- dec_germany14/TI_germany14
CI_share_germany14 <- cumsum(Income_share_germany14)
print(CI_share_germany14)

# repeat the same for India 1980
dec_india80 <- as.numeric(selected_data[3,3:12])
TI_india80 <- 10*selected_data[3,"Mean.Income"]

Income_share_india80 <- dec_india80/TI_india80
CI_share_india80 <- cumsum(Income_share_india80)
print(CI_share_india80)

# repeat the same for India 2014 
dec_india14 <- as.numeric(selected_data[4,3:12])
TI_india14 <- 10*selected_data[4,"Mean.Income"]

Income_share_india14 <- dec_india14/TI_india14
CI_share_india14 <- cumsum(Income_share_india14)
print(CI_share_india14)

# repeat the same for the United Kingdom 1980
dec_UK80 <- as.numeric(selected_data[5,3:12])
TI_UK80 <- 10*selected_data[5,"Mean.Income"]

Income_share_UK80 <- dec_UK80/TI_UK80
CI_share_UK80 <- cumsum(Income_share_UK80)
print(CI_share_UK80)

# repeat the same for the United Kingdom 2014 
dec_UK14 <- as.numeric(selected_data[6,3:12])
TI_UK14 <- 10*selected_data[6,"Mean.Income"]

Income_share_UK14 <- dec_UK14/TI_UK14
CI_share_UK14 <- cumsum(Income_share_UK14)
print(CI_share_UK14)

# repeat the same for the United States 1980 
dec_US80 <- as.numeric(selected_data[7,3:12])
TI_US80 <- 10*selected_data[7,"Mean.Income"]

Income_share_US80 <- dec_US80/TI_US80
CI_share_US80 <- cumsum(Income_share_US80)
print(CI_share_US80)

# repeat the same for the United States 2014
dec_US14 <- as.numeric(selected_data[8,3:12])
TI_US14 <- 10*selected_data[8,"Mean.Income"]

Income_share_US14 <- dec_US14/TI_US14
CI_share_US14 <- cumsum(Income_share_US14)
print(CI_share_US14)

# compute Lorenz Curves for All Countries in 1980
Lc_germany80 <- Lc(CI_share_germany80, n = rep(1, length(CI_share_germany80)))
Lc_india80 <- Lc(CI_share_india80, n = rep(1, length(CI_share_india80)))
Lc_UK80 <- Lc(CI_share_UK80, n = rep(1, length(CI_share_UK80)))
Lc_US80 <- Lc(CI_share_US80, n = rep(1, length(CI_share_US80)))

# plot the first Lorenz curve (Germany 1980)
plot(Lc_germany80, col = "#61B33B", lwd = 2, main = "Lorenz Curves (1980)",
     xlab = "Cumulative Population Share", ylab = "Cumulative Income Share")

# add Lorenz curves for other countries
lines(Lc_india80, col = "#E26F8F", lwd = 2)
lines(Lc_UK80, col = "#FFFF00", lwd = 2)
lines(Lc_US80, col = "#3AC0DA", lwd = 2)

# add a line of perfect equality
abline(0, 1, col = "black", lty = 2)

# add a legend
legend("topleft", legend = c("Line of Equality", "Germany", "India", "UK", "US"),
       col = c("black", "#61B33B", "#E26F8F", "#FFFF00", "#3AC0DA"), lwd = 2)

# clear the plot history and start afresh for 2014
# compute Lorenz Curves for all Countries in 2014
Lc_germany14 <- Lc(CI_share_germany14, n = rep(1, length(CI_share_germany14)))
Lc_india14 <- Lc(CI_share_india14, n = rep(1, length(CI_share_india14)))
Lc_UK14 <- Lc(CI_share_UK14, n = rep(1, length(CI_share_UK14)))
Lc_US14 <- Lc(CI_share_US14, n = rep(1, length(CI_share_US14)))

# repeat the same steps for plotting
plot(Lc_germany14, col = "#61B33B", lwd = 2, main = "Lorenz Curves (2014)",
     xlab = "Cumulative Population Share", ylab = "Cumulative Income Share")
lines(Lc_india14, col = "#E26F8F", lwd = 2)
lines(Lc_UK14, col = "#FFFF00", lwd = 2)
lines(Lc_US14, col = "#3AC0DA", lwd = 2)
abline(0, 1, col = "black", lty = 2)
legend("topleft", legend = c("Line of Equality", "Germany", "India", "UK", "US"),
       col = c("black", "#61B33B", "#E26F8F", "#FFFF00", "#3AC0DA"), lwd = 2)

# now let's graph data country wise
plot(Lc_germany14, col = "#61B33B", lwd = 2, main = "Lorenz Curves Germany",
     xlab = "Cumulative Population Share", ylab = "Cumulative Income Share")

# use a transparency (or a lighter color) for the older curve
lines(Lc_germany80, col = alpha("#61B33B", alpha = 0.4), lwd = 2) 

# add a legend
legend("topleft", legend = c("Line of Equality", "2014", "1980"),
       col = c("black", "#61B33B", alpha("#61B33B", alpha = 0.4)), lwd = 2)

# repeat for India
plot(Lc_india14, col = "#E26F8F", lwd = 2, main = "Lorenz Curves India",
     xlab = "Cumulative Population Share", ylab = "Cumulative Income Share")

lines(Lc_india80, col = alpha("#E26F8F", alpha = 0.4), lwd = 2) 

legend("topleft", legend = c("Line of Equality", "2014", "1980"),
       col = c("black", "#E26F8F", alpha("#E26F8F", alpha = 0.4)), lwd = 2)

# repeat for the UK 
plot(Lc_UK14, col = "#F5B227", lwd = 2, main = "Lorenz Curves United Kingdom",
     xlab = "Cumulative Population Share", ylab = "Cumulative Income Share")

lines(Lc_germany80, col = "#FFFF00", lwd = 2) 

legend("topleft", legend = c("Line of Equality", "2014", "1980"),
       col = c("black", "#F5B227", "#FFFF00"), lwd = 2)

# repeat for the US 
plot(Lc_US14, col = "#3AC0DA", lwd = 2, main = "Lorenz Curves USA",
     xlab = "Cumulative Population Share", ylab = "Cumulative Income Share")

lines(Lc_US80, col = alpha("#3AC0DA", alpha = 0.4), lwd = 2) 

legend("topleft", legend = c("Line of Equality", "2014", "1980"),
       col = c("black", "#3AC0DA", alpha("#3AC0DA", alpha = 0.4)), lwd = 2)

# calculating Gini coefficient in a loop
ineq_data$Gini <- 0

# let's find the number of rows
nor <- nrow(ineq_data)
for (i in seq(1,nor)) {
  # go to Row I to get the decile data 
  dec_i <- unlist(ineq_data[i,3:12])
  ineq_data$Gini[i] <- Gini(dec_i)
}

summary(ineq_data$Gini)
# we can see that average Gini coefficient is 0.46, maximum is 0.738
# and minimum value is 0.179

# plotting time series of Gini coefficient for Germany, India, UK, US
selected_data2 <- ineq_data %>%
  filter(Country %in% c("United States", "India", "Germany", "United Kingdom"))

# plot using ggplot 
# time on the horizontal x-axis and gini coefficient on the y-axis

ggplot(selected_data2, 
       aes(x = Year, y = Gini, colour = Country)) + 
  geom_line(size = 1) + 
  theme_bw() + 
  ylab("Gini") + 
  ggtitle("Gini coefficents for selected countries")

