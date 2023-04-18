parse_phone_number <- function(number_string) {
  res <- gsub("[^0-9]",'',number_string)
  if (substr(res, 1, 1) == "1") {
    # Remove the first character
    res <- substring(res, 2)
  }
    # Return NULL, if the first (1st) or the fourth (4th) character is less then 2 or if the string length is less than 10
  if (substr(res, 1, 1) < "2" | substr(res, 4, 4) < "2" | nchar(res) != 10) {
    return(NULL)
  }
   return(res)
}