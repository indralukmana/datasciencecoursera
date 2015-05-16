# file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
# file.destination <- "data.for"
# 
# download.file(file.url,file.destination)

# data <- read.fwf("data.for",skip=4, header=T,  widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4))
getdata <- read.fwf('data.for', skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(getdata$V4)