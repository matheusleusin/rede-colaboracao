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

#needs additional filtering
#files per author:
author1 <- convert2df('authors/a (1).bib',
                    dbsource = 'scopus',
                    format = 'bibtex')

author2 <- convert2df('authors/a (2).bib',
                      dbsource = 'scopus',
                      format = 'bibtex')

author3 <- convert2df('authors/a (3).bib',
                      dbsource = 'scopus',
                      format = 'bibtex')

author4 <- convert2df('authors/a (4).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author5 <- convert2df('authors/a (5).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author6 <- convert2df('authors/a (6).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author7 <- convert2df('authors/a (7).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author8 <- convert2df('authors/a (8).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author9 <- convert2df('authors/a (9).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author10 <- convert2df('authors/a (10).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author11 <- convert2df('authors/a (11).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author12 <- convert2df('authors/a (12).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author13 <- convert2df('authors/a (13).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author14 <- convert2df('authors/a (14).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author15 <- convert2df('authors/a (15).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author16 <- convert2df('authors/a (16).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author17 <- convert2df('authors/a (17).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author18 <- convert2df('authors/a (18).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author19 <- convert2df('authors/a (19).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author20 <- convert2df('authors/a (20).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author21 <- convert2df('authors/a (21).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author22 <- convert2df('authors/a (22).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author23 <- convert2df('authors/a (23).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author24 <- convert2df('authors/a (24).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author25 <- convert2df('authors/a (25).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author26 <- convert2df('authors/a (26).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author27 <- convert2df('authors/a (27).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author28 <- convert2df('authors/a (28).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author29 <- convert2df('authors/a (29).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author30 <- convert2df('authors/a (30).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author31 <- convert2df('authors/a (31).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author32 <- convert2df('authors/a (32).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

author33 <- convert2df('authors/a (33).bib',
                     dbsource = 'scopus',
                     format = 'bibtex')

base_authors <- mergeDbSources(author1, author2, author3, author4, author5, author6, author7, author8, author9, author10, author11, author12, author13, 
                             author14, author15, author16, author17, author18, author19, author20, author21, author22, author23, author24, author25, 
                             author26, author27, author28, author29, author30, author31, author32, author33, remove.duplicated = TRUE)

rm(author1, author2, author3, author4, author5, author6, author7, author8, author9, author10, author11, author12, author13, 
                               author14, author15, author16, author17, author18, author19, author20, author21, author22, author23, author24, author25, 
                               author26, author27, author28, author29, author30, author31, author32, author33)

write.xlsx(base_authors, 'base_authors.xlsx')
#Still need filtering for institutions and harmonization of University of Bremen writing;
biblioshiny()
