word_count <- function(input) {
  hashmap <- list()

# substitute all puntuation with empty space
input <- gsub("[[:punct:]]", "", input)
  
# Trim all excess white space, convert the words to lowercase 
# and split it by the remaining white space
input <- unlist(strsplit(tolower(trimws(input)), "\\s+"))

  for (i in 1:length(input)) {
    if (input[i] %in% names(hashmap)){
      hashmap[[input[i]]] <- hashmap[[input[i]]] + 1
    }else{
      hashmap[[input[i]]] <- 1
    }

}
  return(hashmap)
}
