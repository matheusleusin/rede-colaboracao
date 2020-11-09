library(bibliometrix)
library(openxlsx)
library(bibtex)
library(stringr) #for adjusting the AU format

rm(list=ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
Data1 <- read.csv("PoPCites2.csv", header = T)
Data2 <- read.csv("PoPCites1.csv", header = T)
#Data2 <- c("AU", "DE", "ID", "C1", "CR", "JI", "AB", "AR", "chemicals_cas", "coden", "RP", "DT", "DI", "BE", "FU", "BN", "SN", "SO", "LA", "TC", "PN", "PP", "PU", "PM", "DB", "sponsors", "TI", "url", "VL", "PY", "FX", "AU_UN", "AU1_UN", "AU_UN_NR", "SR_FULL", "SR")
#names(Data1) <- Data2
#rm(Data1)
Data4 <- rbind(Data1,Data2)
Data3 <- Data4[,c(2,24,11,12,13,19,6,5,3,7,15,4)]
names(Data3) <- c("AU", "AB", "DT","DI","SN","TC", "PU", "DB","TI", "url","VL","PY")
#dfinal <- rbind(Data2, Data3, deparse.level=)

Data3$AU <- gsub(", ", ";", str_trim(Data3$AU))
#Data3$AU <- make.names(1:nrow(Data3))
#apply a function to generate an unique number for every register from 1 to x in DI;
Data3$DI <- 1:nrow(Data3)
#Data3$DI <- make.names(1:nrow(Data3))

#Data3$DI <- sample(500000, size = nrow(Data3), replace = TRUE)
#df$observation <- 1:nrow(df) 
Data3$FX <- sample(5000, size = nrow(Data3), replace = TRUE)
Data3$ID <- sample(900000, size = nrow(Data3), replace = TRUE)
#Data3$DI <- Data3$url

Data4<- Data3[1:530,]
Data4<- Data3[560:696,]

#there is a problem with Sonja data between publications 530 and 556;

#Data3<-Data3[rowSums(is.na(Data3$DI)) != ncol(Data3$DI),]
length(unique(Data3$ID))

write.xlsx(Data3, 'Data3.xlsx')
write.xlsx(Data4, 'Data5.xlsx')



biblioshiny()

Data3$C1 <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$CR <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$JI <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$AR <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$chemicals_cas <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$coden <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$RP <- sample(900000, size = nrow(Data3), replace = TRUE)
Data3$DT <- sample(900000, size = nrow(Data3), replace = TRUE)


