# NOTE: ----
# The functions in this file are used to convert between R file paths and Windows file paths.

# CODE: ----

#' Convert between file paths
#'
#' @description Use these functions to convert between R file paths and system file paths. These function make the most sense on a Windows machine since R uses the same file paths as Unix-based systems (i.e. Mac and Linux).
#'
#' It will also try to convert relative paths to absolute paths if possible.
#'
#' @param path A file path in a form appropriate for R in \code{R_to_sys_path()} and in a form appropriate for the operating system in \code{sys_path_to_R()}.
#'
#' @name convert_file_path
#'
NULL

#' #export
#' @name convert_file_path
R_to_sys_path <- function(path){
  if(file.exists(path)){
    normalizePath(path, mustWork = TRUE)
  }else{
    path %>%
      path.expand %>%
      stringr::str_replace_all(pattern = "(/|\\\\\\\\)",replace = switch(Sys.info()[["sysname"]],"Windows" = "\\\\","/"))
  }
}

#' #export
#' @name convert_file_path
sys_path_to_R <- function(path){
  path %>%
    stringr::str_replace_all(pattern = "\\\\", replace = "/")
}


