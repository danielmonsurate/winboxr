% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/winbox.R
\name{winbox}
\alias{winbox}
\title{winbox}
\usage{
winbox(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  class = NULL,
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
  ui = NULL
)
}
\arguments{
\item{session}{The session object.}

\item{inputId}{The id of the winbox.}

\item{class}{The class of the winbox for themes.}

\item{root}{The root element to create the winbox in.}

\item{title}{The title of the winbox.}

\item{background}{The background colour of the winbox.}

\item{border_width}{The border width of the winbox (pixels).}

\item{width}{The width of the winbox (pixels).}

\item{height}{The height of the winbox (pixels).}

\item{x}{The x position of the winbox.}

\item{y}{The y position of the winbox.}

\item{max}{Whether the winbox is maximized.}

\item{splitscreen}{Whether the winbox can be docked splitscreen.}

\item{top}{The position from the top  (pixels).}

\item{right}{The positon from the right  (pixels).}

\item{bottom}{The position from the bottom  (pixels).}

\item{left}{The position from the left  (pixels).}

\item{html}{The innerHTML for the winbox.}

\item{ui}{The shiny ui to insert into the winbox.}
}
\description{
winbox
}
