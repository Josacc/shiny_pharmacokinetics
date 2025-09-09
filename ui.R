
theme <- bs_theme(
  primary   = '#fdc500',
  secondary = '#fdc500',
  success   = '#fdc500',
  bootswatch = 'darkly'

)


page_navbar(

  title = "Pharmacokinetics",
  theme = theme,
  navbar_options = navbar_options(theme = 'dark'),

  sidebar = sidebar(
    title = h4(p(strong("Bioavailability of drugs"))),
    open = NA,

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

  nav_panel(
    title = 'Panel 1',
    card(
      plotOutput(outputId = "grafica"),
      verbatimTextOutput(outputId = "maximo")
    )
  ),

  nav_panel(
    title = 'Panel 2'

  )



)
