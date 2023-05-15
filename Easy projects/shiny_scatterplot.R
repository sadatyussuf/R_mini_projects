library(datasets)
library(shiny)
library(tidyr)
library(tibble)

aq.no.missing = drop_na(airquality)


options = c(  "Ozone (parts per billion)" = "Ozone",
              "Solar (Langleys)" = "Solar.R",
              "Wind (MPH)" = "Wind",
              "Temperature (F)" = "Temp"
            )

df.lv = (data.frame(options))
df.lv = rownames_to_column(data.frame(options))
colnames(df.lv) = c('labels','value')

# df.options$labels[df.options$value=="Ozone"]

ui = fluidPage(
  selectInput('X',label = h3('X Variable'),choices =options),
  selectInput('Y',label = h3('Y Variable'),choices =options),
  plotOutput('scatter')
  
)


server = function(input,output){
  selection = reactive({
    aq.no.missing[,c(input$X,input$Y)]
  })
  
  
  observe({
  print(c(input$X,input$Y))
  print(head(selection()))
  })
  
  output$scatter = renderPlot({
    x_column = selection()[,1]
    y_column = selection()[,2]
    
    correlation = cor(x_column,y_column)
    regression = lm(y_column ~ x_column)
    intercept =  regression$coefficients[1]
    slope =  regression$coefficients[2]
    
    X_Label = df.lv$labels[df.lv$value==input$X]
    Y_Label = df.lv$labels[df.lv$value==input$Y]
    
    plot(x=x_column,y=y_column,
         xlab=X_Label,ylab=Y_Label,
         cex.axis = 1.5,cex.lab = 1.5,
         pch = 20, cex = 2,
         main = paste(Y_Label,"vs",X_Label,
                      "\n r =",round(correlation,3),
                      "Y' =",round(intercept,3),"+",
                      round(slope,3),"X"), cex.main=1.8
         )
    abline(intercept,slope)
  })
  
  
}

shinyApp(ui=ui, server = server)