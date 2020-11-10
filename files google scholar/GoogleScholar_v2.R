library(bibliometrix)
library(openxlsx)
library(bibtex)
library(stringr) #for adjusting the AU format
library(dplyr) #to make upper cases
rm(list=ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#first, let teach the code to identify all csv files that are in our folder:
temp = list.files(pattern="*.csv")
total <- length(temp)
list_of_names <- make.names(gsub("*.csv$", "", temp))

#now we create a function for generating the name of the files we will merge later
query <- ''
for (i in 1:length(list_of_names)){
  
  if (i < length(list_of_names)) {
    
    query <- glue::glue(query, list_of_names[i], ', ')
    
  } else {
    
    query <- glue::glue(query, list_of_names[i], '')
    
  }
  
}
#test the query to see if it outputs the names of all our files
query

#now we read all files
for (i in 1:total) assign(make.names(gsub("*.csv$", "", temp[i])), read.csv(temp[i], header = T, encoding = "UTF-8"))

#now, run the query constructed before, and manually copy the results and paste inside the "rbind()" part below:
#so, first run query:
query
#and now copy the results from the command and paste below:
Data_merged <- rbind(PoPCites1, PoPCites2)

#now we select the columns we want:
Data_merged <- Data_merged[,c(2,24,11,12,13,19,6,5,3,7,15,4)]
#and give proper names in the bibliometrix format
names(Data_merged) <- c("AU", "AB", "DT","DI","SN","TC", "PU", "DB","TI", "url","VL","PY")
#make all the text in capital letters, which is the standard for the bibliometrix format
Data_merged <- mutate_each(Data_merged, funs(toupper))
#replace commas with ";", which is also the standard for the bibliometrix format
Data_merged$AU <- gsub(", ", ";", str_trim(Data_merged$AU))

#finally, we save the data and open the file with the same name in bibliometrix
write.xlsx(Data_merged, 'Data_merged.xlsx')

biblioshiny()


