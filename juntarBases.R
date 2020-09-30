library(bibliometrix)
library(openxlsx)

base1 <- convert2df('scopus(1).bib',
                    dbsource = 'scopus',
                    format = 'bibtex')
base2 <- convert2df('scopus(2).bib',
                    dbsource = 'scopus',
                    format = 'bibtex')

base_final <- mergeDbSources(base1, base2, remove.duplicated = TRUE)

write.xlsx(base_final, 'base_final.xlsx')

biblioshiny()

library("readxl") #for reading the xlsx files
base_final<-read_excel("base_final.xlsx")

#testing additional bib file:
csl_all_publications <- convert2df('csl_all_publications.bib',
                                   dbsource = 'scopus',
                                   format = 'bibtex')
#needs additional filtering