
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RADins

<!-- badges: start -->

<!-- badges: end -->

*`RAD`ical R add-`ins`\!*

## Overview

The `RADins` package provides a number of add-ins that extend the
capabilities of RStudio. The motivation for this package is an add-in
that allows you to paste file paths into RStudio from a Windows machine.
This will usually mean replacing backslashes (`\`) with forward slashes
(`/`)—hence the name `RADins`—.

The package also includes others add-ins that perform other special
copy/pastes, as well as some add-ins for working with hard-coded
vectors.

<!-- * An add-in to copy a file path in R and convert it into a system (Windows) file path. -->

<!-- * An add-in to paste the hard-code for a vector based on the current selection. -->

<!-- * An add-in the evaluate the code currently selected in RStudio and replace it with a hard-coded vector. -->

<!-- * An add-in to evaluate the code currently selected in RStudio and put the output into the clipboard. -->

For more see `help("file_path_add-ins")`, `help("input_output_addins")`
and `help("vector_code_add-ins")`. Note that the paste add-ins will not
change the clipboard itself, they will simply insert text to the current
location leaving the clipboard untouched.

## Installation

You can install the `RADins` package from
[GitHub](https://github.com/t-gummer/RADins) with:

``` r
# install.packages("devtools")  #In case you have not installed it.
devtools::install_github("t-gummer/RADins")
```

Once you have done this, the add-ins will be available in RStudio for
use in all future R sessions.

## Included Add-ins

The `RADins` package contains the following add-ins:

|          Add-in Name           |   Underlying R Function   | Recommended Shortcut |                                                                                              Description                                                                                               |
| :----------------------------: | :-----------------------: | :------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Set default keyboard shortcuts | `set_shortcuts_default()` |        *none*        |                                                           Click on this add-in in RStudio to set the shortcuts for the other add-ins below.                                                            |
|    Special copy (file path)    |    `copy_file_path()`     |     `Ctrl+Alt+C`     |                                                             Copy a file path to the clipboard so that it will work as a Windows file path.                                                             |
|   Special paste (file path)    |    `paste_file_path()`    |    `Ctrl+Shift+V`    |                                           Paste a file path in the clipboard so that it will work as an R file path (this does *not* change the clipboard).                                            |
|  Special paste (vector code)   |   `paste_vector_code()`   |       `Ctrl+H`       |                              Pastes the current text in the clipboard as R code for a hard-coded vector using the `c()` function (this does *not* change the clipboard).                               |
|        Hard code vector        | `hard_code_vector_code()` |     `Ctrl+Alt+H`     |                                                         Evaluate the current selected code in RStudio and replace it with a hard-coded vector.                                                         |
|  Special copy (R evaluation)   |      `copy_r_eval()`      |       `Ctrl+G`       |  Evaluate currently selected code in RStudio and copy the output to the clipboard (one line per element of vectors). This can be thought of as reversing the “*Special paste (vector code)*” add-in.   |
| Set default keyboard shortcuts |       `view_obj()`        |    `Shift+Alt+V`     | View currently selected object (or code that will create an object) in the Viewer pane. This is a shortcut version of running the function `View()` or clicking on the object in the Environment pane. |
| Special copy (console output)  |  `copy_console_output()`  |     `Ctrl+Alt+2`     |                                                                             Copy current console output to the clipboard.                                                                              |
| Special paste (console output) | `paste_console_output()`  |     `Ctrl+Alt+1`     |                                                                      Paste current console output to the current cursor position                                                                       |
|  Special copy (console input)  |    `copy_last_call()`     |    `Shift+Alt+2`     |                                                                       Copy current R evaluation in the console to the clipboard.                                                                       |
| Special paste (console input)  |    `paste_last_call()`    |    `Shift+Alt+1`     |                                                               Paste current R evaluation in the console to the current cursor position.                                                                |

The decisions for the “recommended shortcuts” are based on both
availability (they do not overwrite any of the existing default ones)
and some attempt at logical conventions.
<!-- Rationalise each choice of shortcut below -->

## Workflow

It is recommended that you set the RADins `Special paste (file path)`
add-in as a keyboard shortcut to allow for easy access. `Ctrl+Shift+V`
is a good option for it’s similarity to `Ctrl+V`.

  - [Keyboard
    Shortcuts](https://rstudio.github.io/rstudioaddins/#keyboard-shorcuts)
  - [Customizing Keyboard
    Shortcuts](https://support.rstudio.com/hc/en-us/articles/206382178-Customizing-Keyboard-Shortcuts)

This workflow is much improved compared to the usual (slow) alternative,
which is of doing a *find and replace* (or worse, manually replacing all
the backslashes with forward slashes).

<!-- There is a function in the RADins package that allows you to easily change the RStudio keyboard shortcut _programmatically_ as an alternative to clicking through menus. -->

## Compatibility

`RADins` was built for use on a Windows operating system.

It also has the potential to work on Mac or Linux by virtue of the
[`clipr`](https://www.r-pkg.org/pkg/clipr) package. It is however less
useful on these operating systems than Windows due to the fact that
their file paths are generally do not require any modification to be
recognised in R.

## Similar packages in R

There are a number of other packages that provide useful tools for
accessing the clipboard. Some examples are listed below.

  - [`clipr`](https://www.r-pkg.org/pkg/clipr)
  - [`imageclipr`](https://github.com/Timag/imageclipr)
  - [`datapasta`](https://github.com/MilesMcBain/datapasta)

## Other solutions to the “backslash problem”

As mentioned [above](#Overview), the motivation for this package was to
solve the problem of pasting windows file paths (which happen to include
backslashes) into R. The package has evolved beyond that to include many
more add-ins but this was the original intention. Below are some other
ways of minimising this issue.

The need to copy file paths into R can be minimised or entirely removed
by making use of the following default infrastructure that already
exists in R and RStudio:

  - Using relative file paths (instead of absolute file path) prevents
    the need to copy full file paths. In most situations, you should be
    working with files in your [current working
    directory](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/getwd)
    anyway. Some other languages such as SAS do not support relative
    file paths, so some users may not be aware that they exist.
  - RStudio has tab auto-completion for the relative file paths of files
    in the current working directory if you hit tab after typing `"`.

Additionally,
[R 4.0.0](https://stat.ethz.ch/pipermail/r-announce/2020/000653.html)
has rendered the initial idea behind this package somewhat redundant
(although the package as a whole, still remains useful) by including new
syntax for so-called *raw character constants* (`r"..."`). This addition
now makes copying Windows file paths directly into R feasible as these
raw character constants will not require you to escape backslashes with
another backslash.
