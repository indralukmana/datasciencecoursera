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

#showing the first three rows of data that existed in the csv dataset
head(restData, n=3)

#showing the last three rows of data 
tail(restData, n=3)

#make summary of data
summary(restData)

#technical details of data
# str(restData)

#get the quantiles of quantitative variables
quantile(restData$councilDistrict, na.rm=TRUE)

#get the quantiles of quantitative variables for certain probabilities = 50,75,90
quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9), na.rm=TRUE)

#make data table
table(restData$zipCode, useNA="ifany")

#make data table with certain variable
table(restData$councilDistrict, restData$zipCode)

#Checking missing values, with sums and logical any
sum(is.na(restData$councilDistrict)) 
any(is.na(restData$councilDistrict))

#check all data according to logic
all(restData$zipCode > 0)

#Sums of rows and columns
colSums(is.na(restData))

#check all data according to logic
all(colSums(is.na(restData))==0)

#values with specific characteristics, creating table where the zipcode is "21212"
table(restData$zipCode %in% c("21212"))

#values with specific characteristics, creating table where the zipcode is "21212" or "21213"
table(restData$zipCode %in% c("21212","21213"))

#get the data from the dataset
restData[restData$zipCode %in% c("21212","21213"),]


#######################
#cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~., data=warpbreaks)
xt

ftable(xt)
############################
#size data from
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")