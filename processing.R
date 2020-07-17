library(readxl)
library(dplyr)
library(tidyr)
astm<-read_excel("Remediation_WBS_Dictionary.xlsx",sheet=1)
astm<-astm[!is.na(astm$`2nd Level`),]
tasks<-c(3,17,34:36,38,43,44,54,58,64,64,77:79,91:93,135,137,144,174:178,182,184)
astm_1stlvl<-astm[astm$...1 %in% tasks,]
rates<-read_excel("Chevron 2019-2020 SOC.xlsx")



mdat<-matrix(0,nrow=nrow(astm_1stlvl)+1, ncol=nrow(rates),)
df<-data.frame(mdat)
colnames(df)<-rates$Position

t<-tibble(df)
t<-t %>%
  mutate(across(.cols= everything(), as.numeric))
t$category<-c("Rate",astm_1stlvl$`Environmental Management`)  


t<-t[,c(27,1:26)]

p<-t %>%
  pivot_longer(-category, names_to="Position")
p$Year<-2021

semi_annual_gwm<- c(0,	8,	0,	0,	0,	0,	0,	0,	174,	0,	0,	0,	0,	10,	0,	0,	136,0,0,0,0,0,0,0,15,0)
