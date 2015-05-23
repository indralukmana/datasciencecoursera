#https://data.baltimorecity.gov/Culture-Arts/Restaurants/k5ry-ef3g?


#create folder for storing the dataset
if(!file.exists("./data")){
  dir.create("./data")
}

#download the dataset with csv format
if(!file.exists("./data/restaurants.csv")){
  fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl, destfile="./data/restaurants.csv")
  restData <-read.csv("./data/restaurants.csv")
}

#Creating sequences with number from 1 to 10 skip by two numbers
s1 <- seq(1, 10, by=2)
print(s1)

#creating sequence with number from 1 to 10 as many as three count
s2 <- seq(1, 10, length=3)
print(s2)

#creating index number for values in vector where the values are: 1, 3, 8, 25, 100
x <- c(1,3,8,25,100)
print(seq(along = x))

#Subsetting variable get the data where the neighborhood are "Roland Park" and "Homeland"
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
print(table(restData$nearMe))

#Creating binary variables ???
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
zipTable <- table(restData$zipWrong, restData$zipCode < 0)
print(zipTable)

#creating categorical variables
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
zipTableGroups <- table(restData$zipGroups)
print(zipTableGroups)
zipTableGroupsT <- table(restData$zipGroups, restData$zipCode)
print(zipTableGroupsT)

#Cutting the data of zip into 4 (four) groups of data by their quantiles
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
tableCut <- table(restData$zipGroups)
print(tableCut)

#create factor (category) of variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

print(class(restData$zcf))

#levels of factor variables
yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac = factor(yesno, levels=c("yes","no"))
print(relevel(yesnofac, ref="yes"))
print(as.numeric(yesnofac))

#Cutting the data of zip into 4 (four) groups of data by their quantiles
# library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
tableCut <- table(restData$zipGroups)
print(tableCut)


#Using mutate function
library(plyr)
restData2 = mutate(restData, zipGroups=cut2(zipCode, g=4))
tableMut <- table(restData2$zipGroups)
print(tableMut)