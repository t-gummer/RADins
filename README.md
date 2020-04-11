
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwdSlash

<!-- badges: start -->

<!-- badges: end -->

## Overview

The `fwdSlash` package provides an RStudio add-in that replaces all the
backslashes (`\`) in text copied to the clipboard with forwardslashes
(`/`).

You can use this add-in to paste file paths from Windows File Explorer
into RStudio and have R recognise them right away. This is an
alternative to the usual (slow) workflow of doing a *find and replace*
(or worse, manually replacing all the backslashes with forward slashes).

The package also provides a selection of other add-ins that either read
or write to the clipboard, while performing some conversions on slashes.
For more see `help("paste_add-ins")` and `help("copy_add-ins")`.

## Installation

You can install the `fwdSlash` package from
[GitHub](https://github.com/t-gummer/fwdSlash) with:

``` r
# install.packages("devtools")  #In case you have not installed it.
devtools::install_github("t-gummer/fwdSlash")
```

Once you have done this, the add-ins will be available in RStudio for
use in all future R sessions.

## Workflow

It is recommended that you set the fwdSlash `Special paste (\ to /)`
add-in as a keyboard shortcut to allow for easy access. `Ctrl+Shift+V`
is recommended for it’s similarity to `Ctrl+V`.

  - [Keyboard
    Shortcuts](https://rstudio.github.io/rstudioaddins/#keyboard-shorcuts)
  - [Customizing Keyboard
    Shortcuts](https://support.rstudio.com/hc/en-us/articles/206382178-Customizing-Keyboard-Shortcuts)

<!-- There is a function in the fwdSlash package that allows you to easily change the RStudio keyboard shortcut _programmatically_ as an alternative to clicking through menus. -->

## Compatability

`fwdSlash` was built for use on a Windows operating system.

It also has the potential to work on Mac or Linux by vitue of the
[`clipr`](https://www.r-pkg.org/pkg/clipr) package. It is however less
useful on these operating systems than Windows due to the fact that
their file paths use forwardslashes.
