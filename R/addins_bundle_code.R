# This is addin will bundle the current selected code in RStudio into a .R file

# CODE: ----

#' Bundle selected code add-in
#'
#' @description This add-in will bundle the selected R code into a file you choose.
#'
#' A file dialogue box prompting you to select the output file. When it is saved, the file will pop up.
#'
#' @name bundle_addin

bundle_code <- function(){
  try(
    filename <- rstudioapi::selectFile(
      caption = "Select/ create file to output code to",
      label = "Bundle &Code",
      existing = FALSE),
    silent = TRUE)

  if(exists("filename")){
    filename %<>%
      stringr::str_remove(".*/") %>%
      stringr::str_detect("\\.") %>%
      dplyr::if_else(true = "",".R") %>%
      paste0(filename,.)

    get_selected_text() %>%
      writeLines(con = filename)

    file.edit(filename)
  }else{
    NULL
  }
}
