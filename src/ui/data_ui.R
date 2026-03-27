library(shiny)
library(shinycssloaders)
library(DT)

home_ui <- shiny::tabPanel(
    title = "AMR Data",
    shiny::conditionalPanel(
        condition = "output.data_loaded == true",
        h4("Data preview", align = "left", style = "margin-top: 10px"),
        shiny::fluidRow(
            shiny::column(
                width = 12,
                div(
                    align = "center",
                    DT::dataTableOutput(outputId = "amr_data_table")
                ),
            )
        ),
    ),
    br(), br(), br(), br(),
    shiny::conditionalPanel( 
        condition = "output.data_loaded == true",
        shiny::fluidRow( # Export data
            shiny::column(
                width=12,
                shiny::actionButton(inputId = "export_data", 
                                    label = "Export data", 
                                    class = 'my-button pry-button')
            ),
        ),
    )
)
