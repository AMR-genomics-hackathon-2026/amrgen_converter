
# Determine file format and read data
read_file <- function(fp, input_name) {
    if (file.info(fp)$size < 1) {
        showNotification(
            paste('Input', input_name, 'file does not contain any data'),
            type='error',
            duration=NULL
        )
        return(NULL)
    }
    if (grepl('.csv$', fp)) {
        d <- readr::read_csv(fp, show_col_types=FALSE)
    } else if (grepl('.tsv$', fp)) {
        d <- readr::read_tsv(fp, show_col_types=FALSE)
    } else {
        showNotification(
            paste('Input', input_name, 'file must be in tsv or csv format and have the correct extension'),
            type='error', duration=NULL
        )
        return(NULL)
    }
    # Require some data, any data
    if (nrow(d) < 1) {
        showNotification(
            paste('Input', input_name, 'file did not have any rows'),
            type='error',
            duration=NULL
        )
        return(NULL)
    }
    if (ncol(d) < 1) {
        showNotification(
            paste('Input', input_name, 'file did not have any columns'),
            type='error',
            duration=NULL
        )
        return(NULL)
    }
    return(d)
}