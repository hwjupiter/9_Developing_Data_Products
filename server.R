
# Define server logic required for the simple countdown timer
shinyServer(function(input, output, session) {
   
    # define the reactive values
    activeTimer <- reactiveVal(FALSE)     # a boolean to monitor whether the timer is running or not
    timerVal <- reactiveVal(0)            # an integer whaich is the time to be counted down to zero
    
    output$timeleft01 <- renderText({
      #paste("Time left: ", timerVal())
      #paste("Time left: ", period_to_seconds(hours(timerVal_H()) + minutes(timerVal_M()) + seconds(timerVal_S())))
    })
    
    # this is the output text to the user so they can see how much time is left
    output$timeleft02 <- renderText({
      paste("Time left: ", seconds_to_period(timerVal()))
    })
    
    # observer to count the timer value down to zero - where the actual function runs
    observe({
      invalidateLater(1000, session)
      isolate({
        if(activeTimer())     # check if the timer is active (count down value does not equal zero)
        {
          timerVal(timerVal()-1)     # subtract one from the count down value
          if(timerVal()<1)           # check if the timer value is zero
          {
            # when the timer is no longer active - zero has been reached - display a popup to inform the user
            activeTimer(FALSE)
            showModal(modalDialog(
              title = "Countdown Complete",
              "Your cooking is done!  :-)"
            ))
          }
          }
      })
    })
    
    # observers for actionbuttons - define what happens when the buttons are pressed
    observeEvent(input$start, {activeTimer(TRUE)})
    observeEvent(input$stop, {activeTimer(FALSE)})
    observeEvent(input$reset, {timerVal(period_to_seconds(hours(input$hrs) + minutes(input$mns) + seconds(input$scs)))})
})

