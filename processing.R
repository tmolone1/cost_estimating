library(readxl)
library(dplyr)
library(tidyr)
astm<-read_excel("Remediation_WBS_Dictionary.xlsx",sheet=1)
astm<-astm[!is.na(astm$`2nd Level`),]
astm_1stlvl<-astm[astm$`2nd Level`==0,]
rates<-read_excel("Chevron 2019-2020 SOC.xlsx")



mdat<-matrix(0,nrow=nrow(astm_1stlvl)+1, ncol=nrow(rates),)
df<-data.frame(mdat)
colnames(df)<-rates$Position
df$category<-c("Rate",astm_1stlvl$`Environmental Management`)  
df[1,]<-c(rates$Rate,"Rate")

t<-as_tibble(df)
t<-t[,c(27,1:26)]

p<-t %>%
  pivot_longer(-category, names_to="Position")
p$Year<-2021

semi_annual_gwm<- c(0,	8,	0,	0,	0,	0,	0,	0,	174,	0,	0,	0,	0,	10,	0,	0,	136,0,0,0,0,0,0,0,15,0)
