# Server logic
function(input, output, session) {
    dataset <- reactiveValues(amr_data = NULL)
    ### LOAD DATA ----------------
    source('src/server/data_server.R', local = TRUE)
    source('src/server/convert_server.R', local = TRUE)
}