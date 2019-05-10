
# load the necessary libraries
library(shiny)
library(lubridate)

# Define UI for my small timer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("My Kitchen Timer"),
  
  sidebarLayout(
    # set up the sidepanel layouts and define what the user will see and be interacting with
    sidebarPanel(helpText("Enter your desired cooking time:"),     # a message to the user
                 # these are numerical input boxes for the user to enter a specific time
                 numericInput('hrs', 'Hours:', value = 0, min = 0, max = 10, step = 1),
                 numericInput('mns', 'Minutes:', value = 0, min = 0, max = 60, step = 1),
                 numericInput('scs','Seconds:',value=0,min=0,max=60,step=1)
    ),
    # set up the main panel layouts and define what the user will see there 
    mainPanel(img(src = "cake01.png", height = 200, width = 180),     # a cake picture for decoration
              # action buttons for the user to press and output text that the user can read
              actionButton('start','Start'),
              actionButton('stop','Stop'),
              actionButton('reset','Reset'),
              h3(textOutput('timeleft01')),
              h3(textOutput('timeleft02')),
              helpText("Press the Reset button to set the timer,
                       the Start button to start the countdown and
                       the Stop button to stop the countdown")
    )
  )
)
)
