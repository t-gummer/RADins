
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwdSlash

<!-- badges: start -->

<!-- badges: end -->

## Overview

The `fwdSlash` package provides an RStudio add-in that replaces all
backslashes (`\`) in text copied to the clipboard to forwardslashes
(`/`).

You can use this to paste file paths from Windows File Explorer into
RStudio and have them work as files straight away. Use them immediately
without having to do a *find and replace* (or worse, manually replace
all the backslashes with forward slashes).

## Installation

You can install the fwdSlash (and it’s associated add-in) from
[GitHub](https://github.com/t-gummer/fwdSlash) with:

``` r
# install.packages("devtools")  #In case you have not installed it.
devtools::install_github("t-gummer/fwdSlash")
```

## Workflow

It is recommended that you set the fwdSlash add-in as a keyboard
shortcut to allow for easy access. `Ctrl+Shift+V` is recommended (note
it’s similarity to `Ctrl+V`).

  - [Keyboard
    Shortcuts](https://rstudio.github.io/rstudioaddins/#keyboard-shorcuts)
  - [Customizing Keyboard
    Shortcuts](https://support.rstudio.com/hc/en-us/articles/206382178-Customizing-Keyboard-Shortcuts)

There is a function in the fwdSlash package that allows you to easily
change the RStudio keyboard shortcut *programmatically*.

## Compatability

While the add-in designed with Windows in mind, this packages was also
designed with the potential to work on other operating systems by vitue
of the [`clipr`](https://github.com/mdlincoln/clipr) package. Its
utility on Mac and Linux is reduced due the fact that their file paths
use forwardslashes and by default which makes then already compatable
with R.
