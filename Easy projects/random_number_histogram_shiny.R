library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = 'number',
    label = 'Select the number',
    value = 500, min = 25,max = 1000
  ),
  plotOutput("hist"),
  textOutput('mean'),
  textOutput('median'),
  textOutput('sd')
)


server <- function(input,output){
  histdata <- reactive({runif(input$number,min=0,max=1)})
output$hist <- renderPlot({hist(histdata(),
                           xlab="Value",
                           main=paste(input$number,"random values betwen 0 and 1")
                          )}
                        )

output$mean <-renderText({paste("Mean = ",round(mean(histdata()),3))})
output$median <-renderText({paste("Median = ",round(median(histdata()),3))})
output$sd <- renderText({paste("SD = ",round(sd(histdata()),3))})
}

shinyApp(ui=ui,server=server)
