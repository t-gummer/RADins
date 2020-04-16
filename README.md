
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwdSlash

<!-- badges: start -->

<!-- badges: end -->

## Overview

The `fwdSlash` package provides a number of add-ins that extend the
capabilities of RStudio. The motivation for this package is an add-in
allows you to paste file paths into RStudio from a Windows machine. This
will usually mean replacing backslashes (`\`) with forwardslashes
(`/`)—hence the name `fwdSlash`—.

The package also includes others add-ins that perform other special
copy/pastes, as well as some add-ins for working with hard-coded
vectors.

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

## Included Add-ins

The `fwdSlash` package contains the following add-ins:

|          Add-in Name           |   Underlying R Function   | Recommended Shortcut |                                                                                      Description                                                                                      |
| :----------------------------: | :-----------------------: | :------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Set default keyboard shortcuts | `set_shortcuts_default()` |        *none*        |                                                   Click on this add-in in RStudio to set the shortcuts for the other add-ins below.                                                   |
|    Special copy (file path)    |    `copy_file_path()`     |     `Ctrl+Alt+C`     |                                                    Copy a file path to the clipboard so that it will work as a Windows file path.                                                     |
|   Special paste (file path)    |    `paste_file_path()`    |    `Ctrl+Shift+V`    |                                   Paste a file path in the clipboard so that it will work as an R file path (this does *not* change the clipboard).                                   |
|  Special paste (vector code)   |   `paste_vector_code()`   |       `Ctrl+H`       |                      Pastes the current text in the clipboard as R code for a hard-coded vector using the `c()` function (this does *not* change the clipboard).                      |
|        Hard code vector        | `hard_code_vector_code()` |     `Ctrl+Alt+H`     |                                               Evaluate the current selection in the clipboard and replace it with a hard-coded vector.                                                |
|  Special copy (R evaluation)   |      `copy_r_eval()`      |       `Ctrl+G`       | Evaluate the current selection and copy the output to the clipboard (one line per element of vectors). This can be thought of as reversing the “*Special paste (vector code)*” add-in |

The decisions for the “recommended shortcuts” are based on both
availability (they do not overwrite any of the existing default ones)
and some attempt at logical conventions.
<!-- Rationalise each choiceof shortcut below -->

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
