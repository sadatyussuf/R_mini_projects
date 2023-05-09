

library(shiny)
library(ggplot2)

ui = fluidPage(
  sliderInput(
    inputId = 'number',
    label = 'Select a number',
    value = 500, min = 0, max = 1000
  ),
  sliderInput(
    inputId = 'binwidth',
    label = 'Select a binwidth',
    value = 0.05, min = 0.01, max = 0.10
  ),
  plotOutput('hist'),
  textOutput("mean"),
  textOutput("median"),
  textOutput("sd"),
)

server = function(input,output){
  histdata = reactive({runif(input$number,min = 0,max = 1)})
  
  output$hist = renderPlot({
    
  df = data.frame(histdata())
  colnames(df) = c('Values')
  
  ggplot(df,aes(x=Values)) +
    geom_histogram(binwidth=input$binwidth,color='black',fill='grey80') +
    labs(y="Frequency",title = paste(input$number,"random values from 0 to 1 with binwidth 
=",input$binwidth))
    
  })
  
output$mean = renderText({paste("Mean = ",round(mean(histdata()),3))})
output$median = renderText({paste("Median = ",round(median(histdata()),3))})
output$sd = renderText({paste("SD = ",round(sd(histdata()),3))})
}

shinyApp(ui = ui, server = server)
