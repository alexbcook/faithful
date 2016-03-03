## This Shiny application takes an input value (waiting time) from the user and then uses a linear regression model
## on the faithful dataset to generate a predicted duration for the next eruption.

## The UI is a simple numeric input box that allows the user to enter any value for waiting time, in minutes. A submit
## button is provided or the user can simply click enter.

## the main panel contains both the entered value in waiting time, plus the predicted eruption time, in minutes.

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Predict Eruption Duration of Old Faithful based on Waiting Time Between Eruptions"),
  sidebarPanel(
    h4('Directions: enter the number of minutes you have been waiting for Old Faithful to erupt and we will tell
      you the predicted duration of the next eruption. This is based on a linear model performed on the "faithful" dataset
      that comes with R.'),
    numericInput('input','Waiting Time (mins)',50),
    submitButton("Submit")
  ),
  mainPanel(
    h3('Results of prediction'),
    h4('You entered a waiting time in minutes of'),
    verbatimTextOutput('inputValue'),
    h4('Which resulted in a predicted eruption duration in minutes of'),
    verbatimTextOutput('prediction')
  )
))
