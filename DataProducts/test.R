library(quantmod)

input1 <- "2014-11-10"
input2 <- "2014-11-14"

stockData <- getSymbols("^STI", src = "yahoo", #input$symb
           from = input1,
           to = input2,
           auto.assign = FALSE)
plot(stockData, stockData$STI.Close, type="n", main=heading) 
lines(stockData$STI.Close)
todayDate <- Sys.Date()
mean(stockData$STI.Close)
