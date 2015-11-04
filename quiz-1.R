## Setup 
install.packages(c("jpeg","jsonlite","data.table","httr"))
install.packages("xlsx")
library(xlsx)

install.packages("XML")
library(XML)

install.packages("data.table")
library(data.table)

## Question 1
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destfile <- "housing_2006.csv"
download.file(file.url, destfile = destfile, method = "curl")

list.files()


housing.table <- read.csv(destfile
                          , header = TRUE
                          , sep = ",")

str(housing.table)
summary(housing.table)
names(housing.table)

## Question 1
q1 <- sum(housing.table$VAL == 24, na.rm = TRUE)
print(q1)

## Question 3
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
destfile <- "gas.xlsx"
download.file(file.url, destfile = destfile, method = "curl")
list.files()


dat
q3 <- sum(dat$Zip*dat$Ext,na.rm=T)
print(q3)

# Question 4
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
destfile <- "rest.xml"
download.file(file.url, destfile = destfile, method = "curl")
list.files()

doc <- xmlTreeParse(destfile, useInternalNodes =TRUE)
rootNode <- xmlRoot(doc)

zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
q4 <- sum(zips == 21231)
print(q4)

# Question 5

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
destFile <- "uscomm.csv"
download.file(dataUrl, destfile = destFile, method = "curl")

DT <- fread(destFile)
DT
str(DT)


q5 <- DT[,mean(pwgtp15),by=SEX]




