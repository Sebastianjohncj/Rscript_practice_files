cat("\014")  # cleans screen
rm(list=ls(all=TRUE))  # remove variables in working memory
setwd("C:/Users/dell/Downloads")

#-----------------------------------------
#Problem1

library(openintro)

starbucks

plot(starbucks$calories, starbucks$carb)

lm(starbucks$carb ~ starbucks$calories, data = starbucks)
starbucksmodel1 <-lm(starbucks$carb ~ starbucks$calories, data = starbucks)
summary(starbucksmodel1)

starbucks.res = resid(starbucksmodel1)
plot(starbucks$calories, starbucks.res, 
     ylab="Residuals", xlab="Calories", 
     main="Starbucks Calories Residuals") 
abline(0, 0)

#------------------------------------------
#Problem2

library(dplyr)

absenteeism
absent1 <- absenteeism %>%
  mutate(eth = ifelse(eth == "N", 1, 0),
         sex = ifelse(sex == "M", 1, 0),
         lrn= ifelse(lrn == "SL", 1, 0))

absent1


absent_mo1 <- lm(absent1$days ~ 
                   absent1$eth + absent1$sex + absent1$lrn, data = absent1)
summary(absent_mo1)

absent_res <- resid(absent_mo1)
plot(absent1$days, absent_res,ylab="Residuals",
     xlab="absent days",
     main="Residual plot of absent days")
abline(0, 0)

 
model1 <- lm(days ~ eth + sex + lrn, data = absent1)
p <- data_frame(eth = c(1,1,1,0,0),
                sex = c(0,1,0,1,0),
                lrn = c(0,0,1,1,0))

predict(model1, p, se.fit = TRUE)

#-----------------------------------------
#problem 3

orings
tail(orings,10)

orings2 <- NULL
for(i in 1:nrow(orings)){
  new <- data.frame(temp = orings$temp[i], # for each row in orings,
                    fail = rep(c(1,0), c(orings$damage[i], # create 6 new rows:
                                         6-orings$damage[i]))) # 1 for each launch
  orings2 <- rbind(orings2, new)
}
orings2

head(orings2)

log_model1 <- glm(fail ~ temp, data=orings2, family='binomial')
summary(log_model1)

pred_val<-predict.glm(log_model1, newdata = orings2 )
pred_val
plot(pred_val)
plot(orings2$temp,pred_val)











