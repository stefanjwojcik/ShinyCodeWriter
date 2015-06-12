#RShiny Code Creator

#This is a file to create Shiny code for users. 

shinyServer(function(input, output, session) {
  
  # Create a random name for the log file
  logfilename <- paste0('logfile',
                        floor(runif(1, 1e+05, 1e+06 - 1)),
                        '.txt')
  
  
  # This observer adds an entry to the log file every time
  # input$n changes.
  obs <- observe({    
    cat(input$n, '\n', file = logfilename, append = TRUE)
  })
  
  
  # When the client ends the session, suspend the observer.
  # Otherwise, the observer could keep running after the client
  # ends the session.
  session$onSessionEnded(function() {
    obs$suspend()
    
    # Also clean up the log file for this example
    unlink(logfilename)
  })
  
  
 # output$click <- renderText({
#  })
  
  output$code_chunkglobal <- renderText({
    paste0(initialglobalcode)
  })
  
  output$code_chunkui <- renderText({
    
    if(input$click>=1){
      qtext <<- input$q1text 
      upuicode <- initialuicode
      upuicode <- gsub('Q1text', qtext, initialuicode) 
      writeLines(upuicode, "Your Shiny Code/ui.r")
      paste0("Updated!")
      }
        
    #paste0(upuicode)

  })
  
output$code_chunkserver <- renderText({
  paste0(
    
initialservercode)
})

############# UI CODE DROP
output$downloadui <- downloadHandler(
  
  # This function returns a string which tells the client
  # browser what name to use when saving the file.
  filename = function() { paste("ui", '.r', sep='') },
  
  # This function should write data to a file given to it by
  # the argument 'file'.
  content = function(file) {
    #upuicode <- readLines("Your Shiny Code/ui.r"),
    writeLines(readLines("Your Shiny Code/ui.r"), file)
  }
)
###########

############# GLOBAL CODE DROP
output$downloadglobal <- downloadHandler(
  
  # This function returns a string which tells the client
  # browser what name to use when saving the file.
  filename = function() { paste("global", '.r', sep='') },
  
  # This function should write data to a file given to it by
  # the argument 'file'.
  content = function(file) {
    #upuicode <- readLines("Your Shiny Code/ui.r"),
    writeLines(readLines("Your Shiny Code/global.r"), file)
  }
)
###########

############# SERVER CODE DROP
output$downloadserver <- downloadHandler(
  
  # This function returns a string which tells the client
  # browser what name to use when saving the file.
  filename = function() { paste("server", '.r', sep='') },
  
  # This function should write data to a file given to it by
  # the argument 'file'.
  content = function(file) {
    #upuicode <- readLines("Your Shiny Code/ui.r"),
    writeLines(readLines("Your Shiny Code/server.r"), file)
  }
)
###########

})
