# server.R

# StockVis relies heavily on two functions from the quantmod package:
# It usesgetSymbols to download financial data straight into R from websites like Yahoo finance and the Federal Reserve Bank of St. Louis.
# It uses chartSeries to display prices in an attractive chart.

#Reference: http://shiny.rstudio.com/tutorial/lesson6/

library(quantmod)
#source("helpers.R")

shinyServer(function(input, output) {
  
  Date <- reactive({
    getSymbols("^STI", src = "yahoo", #input$symb 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  
  output$plot <- renderPlot({
    chartSeries(Date(), theme = chartTheme("white"), 
                type = "line",  TA = NULL) #log.scale = input$log,
  })
  
  output$stockAverage <- renderText({
    stockData <- Date()
    mean(stockData$STI.Close)
  })
  
}
)

#shiny::runApp(displayMode = 'showcase')
# render function  creates
# renderImage	      images (saved as a link to a source file)
# renderPlot	      plots
# renderPrint	      any printed output
# renderTable	      data frame, matrix, other table like structures
# renderText	      character strings
# renderUI	        a Shiny tag object or HTML
