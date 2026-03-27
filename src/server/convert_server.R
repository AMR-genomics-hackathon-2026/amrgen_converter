
### PREVIEW TABLE -------------------------------------------------------
output$amr_data_table <- DT::renderDataTable({
    shiny::req(amr_data())
    caption_html <-  htmltools::HTML("<b>Preview converted data</b>")
    DT::datatable(amr_data(), 
                  # caption = knitr::asis_output(caption_html),
                  options = list(autoWidth = TRUE, pageLength = 5, scrollX = TRUE, 
                                 scrollY = TRUE, rownames = FALSE,
                                 columnDefs = list(list(className = 'dt-head-center',
                                                        className = 'dt-center', targets = "_all")
                                 )
                  )
    )
})


shiny::observeEvent(input$export_data,{
    shiny::req(amr_data(), input$export_data)
    # apply filters
    for (filter_col in input$filter_data_columns){
        input_id <- paste0("filter_data_options_", filter_col)
        filter_values <- input[[input_id]]
        final_data$metadata <- filter_data(final_data$metadata, filter_col, filter_values)
    }
})


