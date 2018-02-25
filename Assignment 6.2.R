#1. Import the Titanic Dataset from the link Titanic Data Set. 

TitanicData <- read.csv("C:/Users/Mymaster/Desktop/Adhishree/Data Analytics/Assignments_Questions/TitanicData.txt", header=FALSE)
View(TitanicData)#Perform the following:
Titanic <- TitanicData
dim(Titanic)
install.packages("reshape")
View(TitanicData)
library(reshape)
Titanic = rename (Titanic, c(V1 = "PassengerId",
                             V2 = "Survived",
                             V3 = "Pclass",
                             V4 = "Name",
                             V5 = "Sex",
                             V6 = "Age",
                             V7 = "SinSP",
                             V8 = "Parch",
                             V9 = "Ticket",
                             V10 = "Fare",
                             V11 = "Cabin",
                             V12 = "Embarked"))
View(Titanic)
str(Titanic)
Titanic$Pclass <- as.factor(Titanic$Pclass)
Titanic$Name <- as.character(Titanic$Name)
str(Titanic)
#a. Is there any difference in fares by different class of tickets?
anova_test <- aov(Fare~Pclass , data = Titanic)
summary(anova_test)
There is a difference in fares by different class of tickets.
#Note - Show a boxplot displaying the distribution of fares by class 
boxplot(Fare~Pclass, data = Titanic, main = "Distribution of fares by class" , xlab ="Pclass", ylab = "Fares" , col = heat.colors(5), names.arg = c ("Class 1", "Class 2" , "Class 3") )
#b. Is there any association with Passenger class and gender? 
chisq_test <- chisq.test(Titanic$Pclass , Titanic$Sex)
chisq_test
There is association between Passenger class and gender.
#Note - Show a stacked bar chart 
count<-table(Titanic$Sex, Titanic$Pclass)
count
stack_barchart <- barplot(count, main = "Distribution of Classes by gender", xlab = "Classes" , ylab = "No of males and females", col = c("Blue", "Red"), legend = c("Female","Male"), names.arg = c ("Class 1" , "Class 2" , "Class 3"))

