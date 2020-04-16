# NOTE: ----
# Map the add-ins to shortcuts.

# CODE: ----

#' Set keyboard shortcuts
#'
#' @description Manipulated the JSON file to make the suggested keyboard shortcuts. Need to close and re-open RStudio (or start a new session) for them to take effect.
#'
#' @param addins Characer vector of underlying functions for addins. Need to be in the right form (e.g. \code{"fwdSlash::copy_file_path"}).
#' @param shortcuts Characer vector of keyboard shortcuts for addins. Need to be in the right form (e.g. \code{"Ctrl+Shift+V"}).
#'
#'
#' @name set_keyboard_shortcuts
NULL

#' @name set_keyboard_shortcuts
#' @export
set_shortcuts <- function(addins, shortcuts){
  json_path <- "~/.R/rstudio/keybindings/addins.json"
  if(file.exists(json_path)){
    addins.json <- jsonlite::read_json(path = json_path)
  }else{
    addins.json <- list()
  }
  for(ii in seq_along(shortcuts)){
    addins.json[[addins[ii]]] <- shortcuts[ii]
  }
  jsonlite::write_json(addins.json,path = "~/.R/rstudio/keybindings/addins.json")
  rstudioapi::showDialog(title = "Clipboard unavailable","Add-in shortcuts changed using <em>fwdSlash</em>.<p><strong>Close and re-open R Studio for this to take effect.</strong></p>")
}

#' @name set_keyboard_shortcuts
set_shortcuts_default <- function(){
  # pkg <- "fwdSlash"
  # addins <- c("copy_file_path","paste_file_path","paste_vector_code","hard_code_vector_code","copy_r_eval")
  # paste(pkg,addins,sep = "::")
  addins <- c(
    "fwdSlash::copy_file_path",
    "fwdSlash::paste_file_path",
    "fwdSlash::paste_vector_code",
    "fwdSlash::hard_code_vector_code",
    "fwdSlash::copy_r_eval"
    )
  shortcuts <- c(
    "Ctrl+Alt+C",
    "Ctrl+Shift+V",
    "Ctrl+H",
    "Ctrl+Alt+H",
    "Ctrl+G" #available and next to H so it makes sense given its the reverse of Ctrl+H
    )
  set_shortcuts(addins,shortcuts)
}

