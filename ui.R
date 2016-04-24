library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Data Products Course Project"),
        sidebarPanel(h3('Change the value of the mean and standard deviation'),
                     sliderInput('mu','mean',value = 12.5,min = 5,max = 20,step = 0.1),
                     sliderInput('sd','Std',value = 1.5,min = 0.1,max = 3,step = 0.01)),
        mainPanel(h2('See how the Histogram and fitted normal curve change'),
                  plotOutput('newHist'))
))