
#utils::savehistory doesnt work for some reason

#' Output the current \code{.Rhistory}
#'
#' @description This is a utility function written specifically for use in the \code{\link[fwdSlash]{.Last.call}()} function.
#'
#'
get_call_history <- function(){
  f1 <- tempfile()
  try(savehistory(f1), silent = TRUE)
  try(rawhist <- readLines(f1), silent = TRUE)
  unlink(f1)
  if(exists('rawhist'))return(rawhist) else return(NULL)
}

#' Get the last call in the .Rhistory
#'
#' @description \link[base:parse]{Parses} the .Rhistory and gets the nth most recent call. Similar to \code{\link[base:Last.value]{.Last.value}} but for calls.
#'
#' @param n an \link{integer} of length 1 representing how far back in the list of calls to go.
#' @param rawhist a \link{character} vector representing the R call history.
#'
.Last.call <- function(n=1, rawhist = get_call_history()) {
  if(!is.null(rawhist)) {
      rawhist <- rawhist
      cmds <- expression()
      n.lines <- max(abs(n+1))
      while( length(cmds) < max(abs(n+1)) ) {
        lines <- utils::tail( rawhist, n=n.lines )
        try( cmds <- parse( text=lines ), silent=TRUE )
        n.lines <- n.lines + 1
        if( n.lines > length(rawhist) ) break
      }
        return(rev(as.character(cmds))[n])
    # }
  }
    return(invisible(NULL))
}

#' Format console output
#'
#' @description Utility function for changing objects to a format that can then be pasted using special copy and paste add-ins for console output.
#'
#' @param obj An R object to be changed formatted according to its class. It will default to \link[utils:capture.output]{the default caupture output} for that class.
#'
console_output_method <- function(obj){
  out <- {
    if(is.vector(obj)){
      obj %>%
        paste(names(.),.,sep = "\t") %>%
        stringr::str_trim("left")
    }else{
      utils::capture.output(obj)
    }
  }
  return(out)
}

