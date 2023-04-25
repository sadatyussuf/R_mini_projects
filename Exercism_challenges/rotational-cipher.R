
rotate <- function(text, key) {
  
  vector_text <- strsplit(text,"")[[1]]
  track_uppercase <- toupper(vector_text) == vector_text
  
  rotated_letters_positions <-(match(tolower(vector_text),letters)+ key - 1) %% 26 + 1
  
  rotatedVector <- letters[rotated_letters_positions]
  
  rotatedVector[is.na(rotatedVector)] <- vector_text[is.na(rotatedVector)]
  
  rotatedVector[track_uppercase] <- toupper(rotatedVector[track_uppercase])
  
  rotatedVector <- paste(rotatedVector, collapse = "")  

  return(rotatedVector)
  
  }