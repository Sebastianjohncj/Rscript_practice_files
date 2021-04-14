cat("\014")  # cleans screen
rm(list=ls(all=TRUE))  # remove variables in working memory

setwd("C:/Users/dell/Downloads/") 
# sets working directory
dir()
library(readxl)
instagram<-read_excel("fashion data on Instagram xl.xlsx",2)

instagram

summary(instagram)

aggregate(sort(instagram$Followers),list(instagram$BrandName),mean)

summary(lm(instagram$Likes~instagram$Followers)) 

summary(as.factor(instagram$Hashtags))
read_excel("fashion data on Instagram.xlsx",2)
