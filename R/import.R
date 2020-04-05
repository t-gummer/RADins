xx <- jsonlite::read_json("C:/Users/tim.gummer/Documents/.R/rstudio/keybindings/addins.json")

xx <- list()
xx[["fwdSlash::paste_b_to_f"]] <- "Ctrl+Shift+V"
xx[["fwdSlash::copy_f_to_b"]] <- "Ctrl+Alt+C"
jsonlite::write_json(xx,"C:/Users/tim.gummer/Documents/.R/rstudio/keybindings/addins.json")

# Turn into function that does the following:
# Take the argument fo the shortcut (defaults to "Ctrl+Shift+V")
# Doe some basic checks to validate if its a real shortcuts (regex or something)
# Reads the shortcuts JSON file (it may not exist so may have to potentially create it)
# Use the path from the home directory,~ (look up if it could possibly change)
# Checks if the shortcut already exists in the JSON file,
#  both "fwdSlash::fix_slash_addin" and "Ctrl+Shift+V" (or whatever shortcut is chosen)
# if it already does exist either exist or prompt the user to see if they want to overwrite it
#  potentially search shortcuts from the default list as well (if this is easy)
# changes the list element of the read JSON file
# writes to the JSON file again
#  probably need to restart R to get it to work so potentially prompt the user or have an optional argument that will do this

# if create more addins, then rename the package to "nifty" (idea from Tom Marshall)
# not available on github

