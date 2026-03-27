library(shinyjs)


### LOAD DATA ------------------------
# Load metadata
observeEvent(
    input$raw_amr,
    {
        d <- read_file(input$raw_amr$datapath, "AMR data")
        if (is.null(d)) {
            dataset$raw_amr <- NULL
            shinyjs::reset('raw_amr')
            return()
        }
        # shiny::showNotification('Successfully uploaded amr data file',
        #                         type = 'message', duration = 2)
        dataset$raw_amr <- d
    }
)
output$input_format <- shiny::renderUI({
    choices <- c("ebi", "ebi_web", "ebi_ftp", "ncbi", "vitek", "microscan", 
                 "sensititre", "whonet", "")
    shiny::selectInput(inputId = "input_format", 
                       label = "Please select an input format:", 
                       choices = choices,
                       selected = "")
})

# Final data
raw_amr <- shiny::reactive({
    shiny::req(dataset)
    # add any pre-processing logic and notifications here
    dataset$raw_amr
})


### MAIN  ------------------------------------------------
shiny::outputOptions(output, "input_format", suspendWhenHidden = FALSE)

### IMPOORT DATA -------------------------------------------------------
amr_data <- shiny::reactive({
    shiny::req(raw_amr(), input$input_format)
    print(input$input_format)
    # TODO add try/except handler
    tryCatch({
        import_pheno(raw_amr(), format = input$input_format)
        
    }, error = function(e) {
        shiny::showNotification(
            "Could not parse the data. Please ensure the file matches the selected format.",
            type = "error",
            duration = 10 # Disappears after 5 seconds
        )
        return(NULL)
    })
})

### IS DATA LOADED? -------------------------------------------------------
# check data loaded
data_loaded <- shiny::reactive({
    if (is.null(amr_data())){
        data_loaded <- FALSE
    } else {
        data_loaded <- TRUE
    }
    return(data_loaded)
})
# Is data loaded? - Boolean to UI
output$data_loaded <- shiny::reactive(data_loaded())
shiny::outputOptions(output, "data_loaded", suspendWhenHidden = FALSE)


# HIDE / SHOW TABS IF DATA LOADED / NON-EMPTY -------------------------------
shiny::observe({
    if ( ! data_loaded() ) {
        shiny::hideTab(inputId = "main_tabs", target = "AMR Data")
    } else {
        shiny::showTab(inputId = "main_tabs", target = "AMR Data")
    }
})

