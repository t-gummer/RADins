#' Special paste add-ins
#'
#' Use these add-ins to paste the clipboard to the current cursor location with some adjustments to slashes (`\`, `\\` and  `/`). These add-ins do \strong{not} change the clipboard.
#'
#' @details See the table of correspondence between function names and clipboard patterns below.
#'    \tabular{rr}{
#'    \strong{Function} \tab \strong{Clipboard} \cr
#'    \code{b} \tab \\ \cr
#'    \code{bb} \tab \\\\ \cr
#'    \code{f} \tab / \cr
#'    }
#'
#' @note The word 'paste' here is not to be confused with the base R \code{\link{paste}} function for concatenation.
#'
#' @name paste_add-ins
NULL

#' @name paste_add-ins
#' @export
paste_b_to_f <- function(){
  replace_from_clipboard(pattern = "\\\\", replace = "/") %>%
    write_to_cursor()
}

#' @name paste_add-ins
#' @export
paste_bb_to_f <- function(){
  replace_from_clipboard(pattern = "\\\\\\\\", replace = "/") %>%
    write_to_cursor()
}

#' @name paste_add-ins
#' @export
paste_b_to_bb <- function(){
  replace_from_clipboard(pattern = "\\\\", replace = "\\\\\\\\") %>%
    write_to_cursor()
}
