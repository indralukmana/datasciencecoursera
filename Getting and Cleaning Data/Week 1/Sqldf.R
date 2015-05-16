library(gsubfn)
library(proto)
library(RSQLite)
library(DBI)
library(sqldf)

# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="acs.csv")

acs <- read.csv("acs.csv", header=T, sep=",")
a <- sqldf("select * from acs where AGEP < 50")
b <- sqldf("select * from acs")
c <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
d <- sqldf("select pwgtp1 from acs where AGEP < 50")