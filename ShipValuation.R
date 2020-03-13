#Load the data 
data <- read.csv(file.choose())
names(data)
summary(data)
data$Vessel <- NULL # Removing character for our analysis
cor(data)

#Based on Correlation Analysis removing variables which are not needed for the predict model
data$SaleDate <-NULL
data$YearBuilt <- NULL

# Creating a lm predict Model 
model <- lm(Price~., data = data, method ="qr")
summary(model)
datanew <- data.frame(Age.at.Sale = c(11), DWT = c(172), Capesize = c(12479))
predict(model,newdata = datanew) #Predicted price of the Bet-Performer 

# COnfidence Interval 
predict(model,newdata = datanew , interval = "confidence")



#The above Model is a simple Multiple Linear Regression Model #
