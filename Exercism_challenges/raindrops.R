raindrops <- function(number) {
  res <- ""
  if (number %% 3 == 0){
    res <- paste0(res,"Pling")
  }
  if (number %% 5 == 0){
    res <- paste0(res,"Plang")
  
  }
  if (number %% 7 == 0){
    res <- paste0(res,"Plong")
  
  }
  if (number %% 3 != 0 && number %% 5 != 0  && number %% 7 != 0){
  return(as.character(number))
  }
  return(res)
}
