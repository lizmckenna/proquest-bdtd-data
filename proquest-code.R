setwd("/Users/elizabethmckenna/Dropbox/GSM")
rm(list=ls())

#proquest only permits 1,000 downloads at a time, so the data is saved in three separate csvs:

pq1=read.csv("/Users/elizabethmckenna/Dropbox/GSM/proquest-1.csv",header=TRUE,row.names=1,check.names=FALSE)
pq2=read.csv("/Users/elizabethmckenna/Dropbox/GSM/proquest-2.csv",header=TRUE,row.names=1,check.names=FALSE)
pq3=read.csv("/Users/elizabethmckenna/Dropbox/GSM/proquest-3.csv",header=TRUE,row.names=1,check.names=FALSE)

#for some reason there was an empty 28th variable in the first two csvs.
#removing here so that i can use rbind to combine them into a data frame:

pq1 <-pq1[-7]
pq2 <- pq2[-7] 
pq_all <- rbind(pq1, pq2, pq3)

#pretty much the only thing i can think to do now (before the data is coded) is a histogram

library(ggplot2)
count <- ggplot(pq_all, aes(x = pq_all$pubdate)) +
  geom_histogram(aes(fill = ..count..), binwidth = 1) +
  scale_x_continuous(name = "Year",
                     breaks = seq(2000, 2017),
                     limits=c(2004, 2018)) +
  scale_y_continuous(name = "Count") +
  ggtitle("Frequency histogram of dissertations on global social movements") +
  scale_fill_gradient("Count", low = "blue", high = "red")
count
