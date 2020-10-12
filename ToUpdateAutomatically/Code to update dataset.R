#First, we load the libraries we will use:
library(bibliometrix) #for creating the networks
library(openxlsx) #for writing the merged file in a .xlsx format

#make the current folder the one where you've put this R code:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Now we load the data. We have 3 pieces of data, which include publications from 1982 to 2011, 2012 to 2018, and 2019 to 2021. The idea here is to update
#just the last file (named 'scopus - 2019 - 2021 (both included).bib') for getting the newest publications. Before doing that, we load the two files with
#the older publications:

base1 <- convert2df('scopus - 1982 - 2011 (both included).bib',
                    dbsource = 'scopus',
                    format = 'bibtex')
base2 <- convert2df('scopus - 2012 - 2018 (both included).bib',
                    dbsource = 'scopus',
                    format = 'bibtex')

#and now we load the most recent file. This file was downloaded in 9/10/2020. At the time, all three files together would result in 3,786 non-repeated
#publications (from a total of 3,960 publications presented in Scopus). To update that file, simply open the list of considered authors in Scopus, click on
#"All" to select all authors, and then on "Show documents". After some time, it will open a list of documents (probably more than 3,960 publications). Go down
#to the year panel (on the left side), select the years 2019, 2020, and 2021, and click on "Limit to". Then, the page will be updated. Click on "All", then 
#on the option next to it (might be download, or BitTeX export, or several other options, depending on what you chose the last time you downloaded something
#from Scopus). A box will open, select all fields, the BitTeX format, and click on "Export". After downloading it, rename it with the same name we are
#using in the code below (i.e. 'scopus - 2019 - 2021 (both included)'), and place it in the same folder where this R code is. Now, just run it and you should
#have an updated file.

base3_to_update <- convert2df('scopus - 2019 - 2021 (both included).bib',
                    dbsource = 'scopus',
                    format = 'bibtex')

#now, we merge all three files:
base_final <- mergeDbSources(base1, base2, base3_to_update, remove.duplicated = TRUE)

#and save them in a folder named 'Bibliometrix_file'
write.xlsx(base_final, 'Bibliometrix_file/base_final.xlsx')

#Open Bibliometrix with the code below, click on 'Data' in the page that will open, and then on 'Import or Load files'. On the new window, click on 'Please, choose what 
#to do', and then on 'Load bibliometrix file'. Click on 'Browse' and open the file we just created on the folder "Bibliometrix_file", named 'base_final'.
#Finally, click on "Start", and you are ready to make your analysis.
biblioshiny()

#additionally, you can get more information about Bibliometrix in: https://cran.r-project.org/web/packages/bibliometrix/vignettes/bibliometrix-vignette.html