cat("\014")  # cleans screen

rm(list=ls(all=TRUE))  # remove variables in working memory
setwd("C:/Users/dell/Downloads")


datafra<-read.csv("case_study_data_cs.csv")

summary(datafra)

datafra$calls

hist(datafra$pageviews)
hist(datafra$calls)

t_1_data<-subset(datafra, datafra$treatment==1)
t_1_data
t_2_data<-subset(datafra, datafra$treatment==2)
t_2_data
t_u_data<-subset(datafra, datafra$treatment==0)
t_u_data


t.test(t_1_data$reservations,t_2_data$reservations)
t.test(t_1_data$calls,t_2_data$calls)
t.test(t_u_data$reservations,t_2_data$reservations)


#Based on the comparison of mean from 2 sample t-test of all 3 groups 
#we can infer that treatment type 2 with an alternative algorithm 
# has the most number of conversions

#team members
#Deepthy #Sebastian #joseph #ines #doaa
#---------------------------------------------------------------------

#ANOVA

treatment<-(datafra$treatment)
reservation<-(datafra$reservations)
new_dat<-data.frame(treatment,reservation)

new_dat2<-subset(new_dat, new_dat$reservation <=200)

mydat<- stack(new_dat2)
mydat

n_results<-aov(treatment~reservation,mydat)
n_results

an_results<-aov(datafra$reservations ~datafra$treatment)
summary(an_results)

summary(n_results)

anova(lm(treatment~reservation,mydat))

#---------------------------------------------------------------------

#shapiro test 

shapiro.test()
#--------------------------------------------------------------------

#assignment8 

abc<-summary(datafra)
abc


aggregate(datafra$pageviews,list(datafra$restaurant_type,datafra$treatment),mean)
aggregate(datafra$reservations,list(datafra$restaurant_type,datafra$treatment),mean)
aggregate(datafra$calls,list(datafra$restaurant_type,datafra$treatment),mean)

aggregate(datafra$reservations,list(datafra$treatment),mean)
summary(aov(datafra$reservations~datafra$treatment+datafra$restaurant_type))
TukeyHSD(aov(datafra$reservations~as.factor(datafra$treatment)+datafra$restaurant_type))




