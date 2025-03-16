library(shiny)
library(tidyverse)
library(readxl)
library(plotly)
library(scales)
library(DT)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)
library(shinyFeedback)


fluidPage(
  titlePanel("Pharmacokinetics"),
  fluidRow(
    column(
      width = 3,
      h4(
        p(strong("Bioavailability of drugs")),
        style = "color: #3c8dbc"
      )
    ),
    column(
      width = 1,
      actionBttn(
        inputId = "info_button_pharmacokinetics",
        label   = "",
        icon    = icon("info-circle"),
        style   = "jelly"
      )
    )
  ),
  br(),
  sidebarLayout(
    sidebarPanel(
      width = 5,
      sliderInput(
        inputId = "lamda",
        label   = "Rate of elimination:",
        min     = 0,
        max     = 1,
        step    = 0.1,
        value   = 0.3,
        animate = TRUE
      ) ,
      sliderInput(
        inputId = "k",
        label   = "Rate of absorption:",
        min     = 0,
        max     = 1,
        step    = 0.1,
        value   = 0.8,
        animate = TRUE
      ) ,
      sliderInput(
        inputId = "c_inicial",
        label   = "Initial concentration:",
        min     = 0,
        max     = 20,
        step    = 1,
        value   = 10,
        animate = TRUE
      )
    ),
    mainPanel(
      width = 7,
      plotOutput(outputId = "grafica"),
      verbatimTextOutput(outputId = "maximo")
    )
  )
)
