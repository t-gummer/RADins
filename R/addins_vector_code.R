# NOTE: ----
# These add-ins will create code used to produce code vectors in R. They can be thought of a way of making hard-coded
#   values.

# CODE: ----

#' Vector code add-ins
#'
#' @description Use \code{paste_vector_code()} to paste the clipboard to the current cursor location with a conversion to the R code for \link[base:c]{creating a vector}. Note that it does \strong{not} change the clipboard.
#'
#' Use \code{hard_code_vector_code()} to execute the code at the current cursor location and convert the result to the R code for \link[base:c]{creating a vector}.
#'
#' Both of these add-ins can be used to ``hard-code'' vectors.
#'
#' \code{copy_r_eval()} is meant to do the reverse of \code{paste_vector_code()} by evaluating selected R code and copying the output to the clipboard. Note that this is done without sending the evaluation to the console.
#'
#' @param text Either the \link[clipr:read_clip]{clipboard}, \link[rstudioapi:getActiveDocumentContext]{current text selection} or a \link{character}.
#'
#' @note The word ``paste'' here is not to be confused with the base R \code{\link{paste}} function, which is for concatenation.
#'
#'     The usage here is the more general use meaning of ``paste'', as in placing the current copied item (i.e. in the clipboard) to the cursor position.
#' @name vector_code_add-ins
NULL

#' @name vector_code_add-ins
paste_vector_code <- function(text = get_clipboard()){
  # Ctrl+H
  text %>%
    strsplit("\t") %>% #this step deals with horizonal arrays (specifies with tabs), it will do them row by row if rectangular
    unlist %>%
    to_vector_code() %>%
    write_to_cursor()
}

#' @name vector_code_add-ins
hard_code_vector_code <- function(text = get_selected_text()){
  # Ctrl+Alt+H
  parse(text = text) %>%
    eval %>%
    to_vector_code() %>%
    write_to_cursor()
}

#' @name vector_code_add-ins
  copy_r_eval <- function(text = get_selected_text()){
  parse(text = text) %>%
    eval %>%
    set_clipboard()
}


#' Add-in for viewing objects
#'
#' @description This add-in will \link[utils:View]{view} the result of the current selected code. This could be either the name of an object or some code that when run will output an object.
#'
#' @param text The currently selected R Code.
#'
View_obj <- function(text = get_selected_text()){
# Add-in for viewing the current selected object.
  try(selection <- parse(text = text),silent = TRUE)
  if(text == "" | stringr::str_detect(text,"View_obj\\(\\)")){
    # If there is no selection, or the selection contains this function itself (which would cause infinite recursion)
    #  there will be no return.
    return(invisible(NULL))
  }else if(exists("selection")){
    View_title <- if(exists(text)) text else "fwdSlash_View"
    View(eval(selection),title = View_title)
  }else{
    rstudioapi::showDialog("Failed",paste0("The selected text, ",text," cannot be coherced into an object."))
  }
}
