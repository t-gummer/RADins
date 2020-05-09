#' Copy/paste console input/output add-ins
#'
#' @description Add-ins that copy/paste the output of the last R evaluation sent to the console. Some attempt is made to adjust the output based on the object. When in doubt, the default \link[utils:capture.output]{capture output} is used.
#'
#' Add-ins that copy/paste the last R call will get the most recent R code, parse it (i.e. remove comments and potentially remove some of the unnecessary spacing).
#'
#' @param ... Arguments to pass to \code{\link[fwdSlash:dot-Last.call]{.Last.call()}}.
#'
#' @param obj An R object, default to the output of the last command sent to the R console.
#'
#' @name input_output_add-ins
#'
NULL

#' @name input_output_add-ins
paste_console_output <- function(obj = .Last.value){
    out <- console_output_method(obj)
    write_to_cursor(out)
}

#' @name input_output_add-ins
copy_console_output <- function(obj = .Last.value){
  out <- console_output_method(obj)
  set_clipboard(out)
}

#' @name input_output_add-ins
paste_last_call <- function(...){
  .Last.call(...) %>%
    write_to_cursor
}

#' @name input_output_add-ins
copy_last_call <- function(...){
  .Last.call(...) %>%
    set_clipboard
}
