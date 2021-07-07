my_split <- function(text,pattern,fixed = TRUE,elem){
  s_txt <- unlist(strsplit(text,pattern,fixed = fixed))
  return(s_txt[elem])
}


import_files <- function(x){
  
  file_path <- paste0(path,x)
  file_name <- my_split(x,".",elem = 1)
  
  if (grepl("csv",x)) {
    imported_file <- readr::read_csv(file_path)
    assign(file_name,imported_file,envir = .GlobalEnv)
  } else if (grepl("xlsx",x)) {
    imported_file <- readxl::read_excel(file_path)
    assign(file_name,imported_file,envir = .GlobalEnv)
  } else {
    imported_file <- "this file is of a different extension"
    assign(file_name,imported_file,envir = .GlobalEnv)
  }
}