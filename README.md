
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwdSlash

<!-- badges: start -->

<!-- badges: end -->

## Overview

The `fwdSlash` package provides a number of RStudio add-ins that mainly
focus on copying and pasting content into RStudio. The motivation for
this package is an add-in allows you to paste file paths into RStudio
from a Windows machine. This will usually mean replacing backslashes
(`\`) with forwardslashes (`/`)—hence the name `fwdSlash`—.

The package also includes others add-ins that mainly perform other
special copy/paste tasks.

<!-- * An add-in to copy a file path in R and convert it into a system (Windows) file path. -->

<!-- * An add-in to paste the hard-code for a vector based on the current selection. -->

<!-- * An add-in the evaluate the code currenlty selected in RStudio and replace it with a hard-coded vector. -->

<!-- * An add-in to evaluate the code currenlty selected in RStudio and put the output into the clipboard. -->

For more see `help("file_path_add-ins")` and
`help("vector_code_add-ins")`. Note that the paste add-ins will not
change the clipboard itself, they will simply insert text to the current
location leaving the clipboard untouched.

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

It is recommended that you set the fwdSlash `Special paste (file path)`
add-in as a keyboard shortcut to allow for easy access. `Ctrl+Shift+V`
is a good option for it’s similarity to `Ctrl+V`.

  - [Keyboard
    Shortcuts](https://rstudio.github.io/rstudioaddins/#keyboard-shorcuts)
  - [Customizing Keyboard
    Shortcuts](https://support.rstudio.com/hc/en-us/articles/206382178-Customizing-Keyboard-Shortcuts)

This workflow is much improved compared to the usual (slow) alternative,
which is of doing a *find and replace* (or worse, manually replacing all
the backslashes with forward slashes).

<!-- There is a function in the fwdSlash package that allows you to easily change the RStudio keyboard shortcut _programmatically_ as an alternative to clicking through menus. -->

## Compatability

`fwdSlash` was built for use on a Windows operating system.

It also has the potential to work on Mac or Linux by vitue of the
[`clipr`](https://www.r-pkg.org/pkg/clipr) package. It is however less
useful on these operating systems than Windows due to the fact that
their file paths are generally do not require any modification to be
recognised in R.

## Similar packages

There are a number of other packages that provide useful tools for
accessing the keyboard. Some examples are listed below.

  - [`clipr`](https://www.r-pkg.org/pkg/clipr)
  - [`imageclipr`](https://github.com/Timag/imageclipr)
