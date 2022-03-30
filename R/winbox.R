#' winbox
#'
#' @param session The session object.
#' @param inputId The id of the winbox.
#' @param title The title of the winbox.
#' @param root The root element to create the winbox in.
#' @param background The background colour of the winbox.
#' @param border_width The border width of the winbox (pixels).
#' @param width The width of the winbox (pixels).
#' @param height The height of the winbox (pixels).
#' @param x The x position of the winbox.
#' @param y The y position of the winbox.
#' @param max Whether the winbox is maximized.
#' @param splitscreen Whether the winbox can be docked splitscreen.
#' @param top The position from the top  (pixels).
#' @param right The positon from the right  (pixels).
#' @param bottom The position from the bottom  (pixels).
#' @param left The position from the left  (pixels).
#' @param html The innerHTML for the winbox.
#' @param ui The shiny ui to insert into the winbox.
#'
#' @export
#'
winbox <- function(session = shiny::getDefaultReactiveDomain(),
                   inputId,
                   root = "body",
                   title = NULL,
                   background = NULL,
                   border_width = NULL,
                   width = NULL,
                   height = NULL,
                   x = NULL,
                   y = NULL,
                   max = NULL,
                   splitscreen = NULL,
                   top = NULL,
                   right = NULL,
                   bottom = NULL,
                   left = NULL,
                   html = NULL,
                   ui = NULL) {


  message <- dropNulls(
    list(id = inputId,
         title = title,
         root = root,
         background = background,
         border = border_width,
         width = width,
         height = height,
         x = x,
         y = y,
         max = max,
         splitscreen = splitscreen,
         top = top,
         right = right,
         bottom = bottom,
         left = left,
         html = html)
  )

  session$sendCustomMessage("create-winbox", message)

  shiny::insertUI(selector = sprintf("#%s > .wb-body", inputId),
                  ui = ui,
                  immediate = T)

}

#' update_winbox
#'
#' @param id Box id.
#' @param action Action to trigger: \code{c("minimize", "maximize", "fullscreen", "close", "force_close", "update")}.
#' @param options If action is update, a list of new options to configure the box, such as
#' \code{list(title = "new title", color = "red",
#' width = "500px", height = "200px", x = "center", y = "center")}.
#' @param session Shiny session.
#'
#' @export
#'
update_winbox <- function(id,
                          action = c("minimize",
                                     "maximize",
                                     "fullscreen",
                                     "close",
                                     "force_close",
                                     "update"),
                          options = NULL,
                          session = shiny::getDefaultReactiveDomain()) {

  action <- match.arg(action)
  # for these, we take a list of options
  if (action == "update") {
    options <- dropNulls(options)
    message <- dropNulls(c(action = action, options = list(options)))
    session$sendInputMessage(id, message)
  } else {
    session$sendInputMessage(id, message = match.arg(action))
  }
}


