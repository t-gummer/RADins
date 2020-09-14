# NOTE: ----
# Map the add-ins to shortcuts.

# CODE: ----

#' Set keyboard shortcuts
#'
#' @description Manipulated the JSON file to make the suggested keyboard shortcuts. Need to close and re-open RStudio (or start a new session) for them to take effect.
#'
#' @param addins Characer vector of underlying functions for addins. Need to be in the right form (e.g. \code{"RADins::copy_file_path"}).
#' @param shortcuts Characer vector of keyboard shortcuts for addins. Need to be in the right form (e.g. \code{"Ctrl+Shift+V"}).
#' @param file The name of the JSON file in the file path ``\code{~/.R/rstudio/keybindings/}'' you would like to change. This will be either "addins", "editor_bindings" or "rstudio_bindings" (partial matching permitted).
#'
#' @name set_keyboard_shortcuts
#'
#' @examples \dontrun{
#' #This is an example of changing shortcut thats helpful as it
#' # removes pasteLastYank as a shortcut that overwites
#' # Ctrl+Y for redo. This will fix frustrating default behaviour
#' # of RStudio.
#'
#' set_shortcuts("pasteLastYank","Ctrl+Shift+Y","rstudio_bindings")
#' }
#'
NULL

#' @name set_keyboard_shortcuts
#' @export
set_shortcuts <- function(addins, shortcuts, file = "addins"){
  file_name <- match.arg(arg = file,choices = c("addins","editor_bindings","rstudio_bindings"))
  json_path <- paste0("~/.R/rstudio/keybindings/",file_name,".json")

  if(file.exists(json_path)){
    addins.json <- jsonlite::read_json(path = json_path)
  }else {
    if(file.exists("~/.R/rstudio/keybindings/")){
      addins.json <- list()
    }else{
      stop("File path, '",normalizePath("~/.R/rstudio/keybindings/"),"' was not found.")
    }
  }
  for(ii in seq_along(shortcuts)){
    addins.json[[addins[ii]]] <- shortcuts[ii]
  }
  jsonlite::write_json(addins.json,path = json_path)
}



#' @name set_keyboard_shortcuts
set_shortcuts_default <- function(){
  # pkg <- "RADins"
  # addins <- c("copy_file_path","paste_file_path","paste_vector_code","hard_code_vector_code","copy_r_eval")
  # paste(pkg,addins,sep = "::")
  addins <- c(
    "RADins::copy_file_path",
    "RADins::paste_file_path",
    "RADins::paste_vector_code",
    "RADins::hard_code_vector_code",
    "RADins::copy_r_eval",
    "RADins::View_obj",
    "RADins::copy_console_output",
    "RADins::paste_console_output",
    "RADins::copy_last_call",
    "RADins::paste_last_call",
    "RADins::bundle_code",
    "RADins::fill_equals"
    )
  shortcuts <- c(
    "Ctrl+Alt+C",
    "Ctrl+Shift+V",
    "Ctrl+H",
    "Ctrl+Alt+H",
    "Ctrl+G", #available and next to H so it makes sense given its the reverse of Ctrl+H
    "Shift+Alt+V",
    "Ctrl+Alt+2",
    "Ctrl+Alt+1",
    "Shift+Alt+2",
    "Shift+Alt+1",
    "Ctrl+B",
    "Ctrl+Shift+X"
    )
  set_shortcuts(addins,shortcuts,"addins")
  rstudioapi::showDialog(title = "Shortcut change complete","RStudio shortcuts for <em>RADins</em> add-ins were changed to their default values.<p><strong>Close and re-open R Studio for this to take effect.</strong></p>")
}
