hw1 = read.csv("hw1_data.csv")
nrow(hw1)
hw1[152:153,]
hw1[,"Ozone"]
summary(hw1)
hot = subset(hw1, Ozone > 31 && Temp > 90)
summary(hot)
june = subset(hw1, Month == 6)
summary(june)
may = subset(hw1, Month == 5)

summary(may)
