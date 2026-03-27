library(shiny)
library(shinyWidgets)

sidebar_ui <- shiny::sidebarPanel(
    width = 3,
    shiny::fluidRow( # Select data
        shiny::column(
            12, align = "left",
            shiny::column(
                width = 12, shiny::uiOutput("input_format")),
            shiny::conditionalPanel(
                condition = "input.input_format != ''",
                shiny::column(
                    width = 12,
                    shiny::fileInput(
                        inputId = "raw_amr", 
                        label = "Upload AMR data (tsv/csv)")
                ),
            ),
        )
    ),
    br(), br(),
)