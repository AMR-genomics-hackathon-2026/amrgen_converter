
source('global.R')

# Source individual ui files
source('src/ui/sidebar_ui.R') # sidebar_ui
source('src/ui/data_ui.R') # home_ui

# Page layout
shiny::fluidPage(
    theme = shinythemes::shinytheme("cerulean"),
    shiny::titlePanel(
        shiny::fluidRow(
            shiny::column(width = 9, p("AMRgen Converter"))
        ),
        windowTitle = "AMRgen Converter"
    ),
    shiny::tags$head(
        shiny::tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
        shiny::tags$style(
            shiny::HTML(".plot-box { overflow-y: scroll; height: 600px; }")
        ),
        shinyjs::useShinyjs(),  
    ),
    # sidebarLayout
    shiny::sidebarLayout(
        position = "left", 
        fluid = TRUE, 
        # load sidebar ui
        sidebar_ui, 
        # load ui for each tab in main panel
        shiny::mainPanel(shiny::tabsetPanel(
            id = "main_tabs",
            home_ui, 
        )) 
    ), # End sidebarLayout
    shiny::hr()
) # End fluidPage

