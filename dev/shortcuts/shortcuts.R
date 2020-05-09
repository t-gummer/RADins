# Load packages----
library(rvest)
library(magrittr)
library(dplyr)
library(jsonlite)
library(stringr)
library(purrr)
library(tidyr)

# Import and tidy files----
# _Modify Keyboard shortcuts table----
## This HTML table was obtained by inspecting element on the Modify Keyboard
#   shortcuts dialogue box in RStudio and copying the appropriate code.

read_html("dev/shortcuts/shortcuts.txt") %>%
  html_table(fill = TRUE) -> RStudio_tbl

RStudio_tbl[[1]] %>%
  as_tibble() %>%
  filter(X3 %in% c("Scope","Workbench","Editor","R","C / C++",
                   "Package Development","R Markdown","Markdown",
                   "Sweave","Help","VCS")
         ) %>%
  select(X1,X2,X3) %>%
  set_colnames(.[1,]) %>%
  slice(-1) -> Rstudio_shortcuts

# Have lookup variables for later merge
Rstudio_shortcuts %<>%
  mutate(Fixed_name = str_to_upper(Name),Fixed_scope = str_to_upper(Scope))

# _Made up JSON file----
## The JSON files were created by  manually entering something resembling the
#   shortcut names into the GUI and then copying over the resultant JSON file.

rs_bindings <- read_json("dev/shortcuts/rstudio_bindings.json")
ed_bindings <- read_json("dev/shortcuts/editor_bindings.json")

rs_bindings_tbl <- tibble(ID = names(rs_bindings),
                          Spaced_name = unlist(rs_bindings),
                          JSON_Name = "rstudio_bindings")

ed_bindings_tbl <- tibble(ID = names(ed_bindings),
                          Spaced_name = unlist(ed_bindings),
                          JSON_Name = "editor_bindings")

bindings_tbl <- bind_rows(rs_bindings_tbl,ed_bindings_tbl)

bindings_tbl %<>%
  mutate(
    Fixed_name = Spaced_name %>%
      str_remove_all("\\s") %>%
      str_replace_all("Space"," ") %>%
      str_replace_all("Shift\\+9","(") %>%
      str_replace_all("Shift\\+0",")") %>%
      str_replace_all("Shift\\+;",":") %>%
      str_replace_all("Shift\\+=","+") %>%
      str_replace_all("Shift\\+-","_")
  )

# split out the | where there are multiple shortcuts
bindings_tbl %<>%
  mutate(
    Fixed_name = Fixed_name %>%
      map(~tibble(
        Fixed_name = str_split(.x, pattern = "\\|")[[1]]
      ) )
  ) %>%
  unnest(cols = Fixed_name)

# Split out scope and name
bindings_tbl %<>%
  separate(Fixed_name,c("Fixed_scope","Fixed_name"),"Shift\\+2",fill = "right") %>%
  filter(!is.na(Fixed_name))

# Merge the two datasets----

full_join(x = Rstudio_shortcuts, y = bindings_tbl, by =
            c("Fixed_name","Fixed_scope")
          ) %>%
    select(-Spaced_name,-Fixed_name,-Fixed_scope) -> shortcuts_merged

default_shortcuts <- shortcuts_merged %>%
  distinct

# Transform datasets----

## Since expandToLine (rstudio) and expandtoline (editors) differ in case,
#   they don't work so need to manually remove the ones that done work
default_shortcuts %<>%
  filter(!((ID == "expandtoline") & (Name == "Expand To Line"))) %>%
  filter(!((ID == "expandToLine") & (Name == "Expand to Line")))

# Add letter fields
default_shortcuts %<>%
  mutate(
    Ctrl = str_detect(Shortcut,"Ctrl\\+"),
    Shift = str_detect(Shortcut,"Shift\\+"),
    Alt = str_detect(Shortcut,"Alt\\+"),
    Letter = str_remove_all(Shortcut, "\\w+\\+")
  )

default_shortcuts %<>%
  arrange(Letter,Ctrl,Shift,Alt)

# Export the data to the package ----

usethis::use_data(default_shortcuts,internal = TRUE,overwrite = TRUE)

# Play around with the dataset ----
LETTERS %>%
  purrr::map(~dplyr::filter(default_shortcuts,Letter == .x) %>% dplyr::select(Letter,Name,Shortcut)) %>%
  set_names(LETTERS)

