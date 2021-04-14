cat("\014")  # cleans screen
rm(list=ls(all=TRUE))  # remove variables in working memory
setwd("C:/Users/dell/Downloads") 

ipl_data

summary(ipl_data)

MODEL1 <- lm(`Sold Price(US$)` ~ `Base Price(US$)` + `RUNS-S` + WKTS + INDIA + L25, data=ipl_data)

summary(MODEL1)

names(ipl_data)[names(ipl_data)=="Sold Price(US$)"]<-"SoldPrice"


MODEL2 <- lm(`SoldPrice` ~ `Base Price(US$)` + `RUNS-S` + `ODI-WKTS` + INDIA + L25 + `SR -B` + `BOW*WK-O`+`BOW*WK-I`, data=ipl_data)

summary(MODEL2)
