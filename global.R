suppressPackageStartupMessages({
    library(tidyverse)
    library(AMRgen)
    library(shiny)
    library(shinythemes)
    library(shinydashboard)
    library(shinycssloaders)
    library(shinyjs)
})

### SHINY APP OPTIONS ----------------------------------------------
# Max file upload size
options(shiny.maxRequestSize = 100*1024^2)  # 100 MB
# Spinner options
options(spinner.type = 5, spinner.color = "#2a77be")


### LOAD FUNCTIONS ------------------------------------------------
purrr::map(fs::dir_ls('src/functions/', glob = "*.R"), source)