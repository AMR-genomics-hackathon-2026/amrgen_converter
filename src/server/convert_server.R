
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
    # add logic to handle export
})


