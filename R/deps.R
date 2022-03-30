#' use_winbox
#'
#' Use in UI to add dependencies for winbox to work
#'
#' @export
#'
#' @examples use_winbox()
use_winbox <- function() {
  winbox_deps <- list(
    htmltools::htmlDependency(
      name = "winbox",
      version = "0.2.1",
      src = c(file = "winbox-0.2.1"),
      stylesheet = "winbox.min.css",
      script = list(src = "webpack.js", type = "module"),
      package = "winboxr"
    ),
    htmltools::htmlDependency(
      name = "winboxr",
      version = "0.1.0",
      src = c(file = "winboxr"),
      stylesheet = "winboxr.css",
      script = "winboxr.js",
      package = "winboxr"
    )
  )

  htmltools::tagList(winbox_deps)

}
