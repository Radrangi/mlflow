#' @importFrom utils browseURL
mlflow_view_url <- function(url) {
  getOption("page_viewer", browseURL)(url)

  invisible(url)
}

#' MLflow User Interface
#'
#' Launches MLflow user interface.
#'
#' @examples
#' \dontrun{
#' library(mlflow)
#' mlflow_install()
#'
#' # launch mlflow ui locally
#' mlflow_ui()
#'
#' # launch mlflow ui for existing mlflow server
#' mlflow_set_tracking_uri("http://tracking-server:5000")
#' mlflow_ui()
#' }
#'
#' @param x An `mlflow_client` object.
#' @param ... Optional arguments passed to `mlflow_server()` when `x` is a path to a file store.
#' @export
mlflow_ui <- function(x, ...) {
  UseMethod("mlflow_ui")
}

#' @export
mlflow_ui.mlflow_client <- function(x, ...) {
  mlflow_view_url(x$server_url)
}

#' @export
mlflow_ui.NULL <- function(x, ...) {
  client <- mlflow_client()
  mlflow_ui(client)
}
