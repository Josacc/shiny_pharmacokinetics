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
library(mosaic)
library(mosaicCalc)

function(input, output, session) {

  observeEvent(input$info_button_pharmacokinetics, {
    show_alert(
      session = session,
      title   = "",
      text    = tags$div(
        tags$h3("Information",
                style = "color: #0076C8; font-weight: bold; text-align: center"),
        tags$br(),
        tags$br(),
        style = "text-align: justify;
        margin-left:  auto;
        margin-right: auto;",
        tags$b('Pharmacokinetics', style = "font-weight: bold"),
        tags$br(),
        tags$br(),
        'The Bateman function is commonly used to study the dynamics of drugs
          administered extravasally in a single-compartment model.',
        tags$br(),
        'By selecting the rate of absorption from the extravascular site of
          drug administration, selecting the rate of elimination of the drug by
          whatever mechanism occurs, and selecting the concentration of the drug
          at the initial time',
        tags$b(
          'we can determine the maximum bioavailability and maximum
            concentration using the Bateman curve.',
          style = "font-weight: bold"
        )
      ),
      html  = TRUE,
      width = "55%"
    )
  })

  output$grafica <- renderPlot({
    bateman <- makeFun(
      c_inicial * k * (exp(-lamda * t) - exp(-k * t)) / k - lamda ~ t,
      c_inicial = input$c_inicial,
      k         = input$k,
      lamda     = input$lamda
    )
    plotFun(
      bateman(t) ~ t,
      xlim = range(0 , 24) ,
      main = "Bateman curve" ,
      xlab = "Time (hrs)" ,
      ylab = "Concentration (mg)"
    )
  })

  output$maximo <- renderPrint({
    bateman <- makeFun(
      c_inicial * k * (exp(-lamda * t) - exp(-k * t)) / k - lamda ~ t,
      c_inicial = input$c_inicial,
      k         = input$k,
      lamda     = input$lamda
    )

    t_max <- round((log(input$k) - log(input$lamda))/(input$k - input$lamda), 2)

    c(
      paste0("Time of maximum bioavailability: ", t_max, " hrs"),
      paste0("Maximum concentration: ", round(bateman(t_max), 2), " mg")
    )

  })
}
