shinyUI(fluidPage(
  titlePanel("ShinyNetSurvey CodeWriter"),
  fluidRow(
    column(3, wellPanel(
      actionButton("click", "Update Code"),
      textOutput("code_chunkui"),
      textInput("q1text", "Network Question 1 Text", ""),
      br(),
      textInput("q1title", "Network Question 1 Title", ""),
      br(),
      textInput("q2text", "Network Question 2 Text", ""),
      br(),
      textInput("q2title", "Network Question 2 Title", ""),
      br(),
      textInput("q3text", "Network Question 3 Text", ""),
      br(),
      textInput("q3title", "Network Question 3 Title", ""),
      br(),
      textInput("q4text", "Network Question 4 Text", ""),
      br(),
      textInput("q4title", "Network Question 4 Title", "")
    )
    ),
    column(4,
           #verbatimTextOutput("code_chunkglobal"),
           h3("global.r"),
           img(src="global.png", height=337 , width=1231),
           br(),
           p("Your global.r code is now available for download."),
           downloadButton('downloadglobal', 'Download'),
           br(),
           
           h3("server.r"),
           #verbatimTextOutput("code_chunkserver"),
           img(src="server.png", height=483 , width=1227),
           br(),
           p("Your server.r code is now available for download"),
           downloadButton('downloadserver', 'Download'),
           
           h3("ui.r"),
           #verbatimTextOutput("code_chunkui"),
           img(src="ui.png", height=481 , width=1195),
           br(),
           p("Your ui.r code is now available for download."),
           downloadButton('downloadui', 'Download')
    )
    #column(3,
    #       verbatimTextOutput("code_chunkserver"),
    #       br(),
    #       br(),
    #       p("Your server.r code is above.")
    #),
    
  )
))
