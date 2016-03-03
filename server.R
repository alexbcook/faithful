## The Server.R file contains the generated linear regression model of eruption time vs waiting time from the faithful
## dataset in R. This is run only once, when the application is accessed, because the udnerlying model doesn't change.
## The server then takes the input entered by the user in UI.R, applies the predict function to that value, and then
## returns the predicted value for eruption time (along with returning the original entered value). The reactive function
## is used but isn't necessary here since this is a small calculation.

library(stats)
library(caret)
data(faithful)
mod<-lm(eruptions~waiting,data=faithful)


shinyServer(
  function(input,output){
    output$inputValue<-renderPrint({input$input})
    x<-reactive({round(predict(mod,data.frame(waiting=input$input)),2)})
    output$prediction<-renderPrint({x()})
  }
)
