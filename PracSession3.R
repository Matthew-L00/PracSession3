managers_data <- read.csv("managers.csv")

managers_data[1:3,]
managers_data[1:3,1:3]
managers_data[c(1,3),1:3]
managers_data[c(1,5),1:3]

managers_data[c(1,3,5),c(2,4)]

str(managers_data)

managers_data <- subset(managers_data, select = -X)
managers_data

managers_data <- subset(managers_data, select = -Age)
managers_data

managers_data <- data.frame(managers_data, Age)
managers_data

managers_data$AgeCat[managers_data$Age >= 45] <- "Elder"
managers_data$AgeCat[managers_data$Age <= 25] <- "Young"
managers_data$AgeCat[managers_data$Age >= 26 & managers_data$Age <= 44] <- "Middle Aged"
managers_data$AgeCat[is.na(managers_data$Age)] <- "Elder"

managers_data$AgeCat <- factor(managers_data$AgeCat, ordered=TRUE, levels = c("Young", "Middle Aged", "Elder"))
#If this doesn't work then do

AgeCat <- factor(managers_data$AgeCat, ordered=TRUE, levels = c("Young", "Middle Aged", "Elder"))
managers_data$AgeCat <- AgeCat

str(managers_data)

summary_col <- managers_data$Q1 + managers_data$Q2 + managers_data$Q3 + managers_data$Q4 + managers_data$Q5
summary_col

managers_data <- data.frame(managers_data, summary_col)
managers_data$summary_col <- summary_col
managers_data

mean_value<-rowMeans(managers_data[5:9])
mean_value
managers_data <- data.frame(managers_data, mean_value)
managers_data
names(managers_data)[12] <- "Mean Value"
names(managers_data)[11] <- "Answer Total"

managers_data <- subset(managers_data, select = -mean_value)
