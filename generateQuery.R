dois <- read.table('dois.txt', stringsAsFactors = FALSE)

query <- ''

for (i in 1:nrow(dois)){
  
  if (i < nrow(dois)) {
    
    query <- glue::glue(query, 'DOI(', dois[i,1], ') OR ')
    
  } else {
    
    query <- glue::glue(query, 'DOI(', dois[i,1], ')')
    
  }
  
}

query
