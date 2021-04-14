cat("\014")  # cleans screen
rm(list=ls(all=TRUE))  # remove variables in working memory
setwd("C:/Users/dell/Downloads")  
# sets working directory
dir()
TableGeoLoc<-read.csv("GeolocationTable.csv",header=T)  # reads raw data

tab<-read.csv("olist_geolocation_dataset.csv",header=T)

a<-TableGeoLoc[791180,4]

a

t_1_data<-subset(TableGeoLoc, TableGeoLoc$geolocation_lat==-15.90035)

t_1_data

TableGeoLoc$geolocation_zip_code_prefix<-gsub("9", "5",TableGeoLoc[,1])

TableGeoLoc$geolocation_lat<-gsub("23", "5",TableGeoLoc[,3])

write.csv(TableGeoLoc,"sebastian_geo_loc_tranform.csv")