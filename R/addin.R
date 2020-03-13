# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#

# hello <- function() {
#   print("Hello, world!")
# }

# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


fix_slash_addin <- function() {
  library(magrittr)
  readClipboard() %>%
    stringr::str_replace_all("\\\\","/") %>%
    rstudioapi::insertText()
}

