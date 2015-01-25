library(shiny)

shinyServer(function(input,output){
  sp.data <- read.csv("sp.csv")
  sp.data$Date2 <- as.POSIXlt(sp.data$Date,format= "%m/%d/%Y")
  sp.data$perDel <- sp.data$perDel*100
   output$out.mean <- renderPrint({
     psx.StartDate <- as.POSIXlt(input$StartDate)
     psx.EndDate <- as.POSIXlt(input$EndDate)
     sp.subset <- sp.data[sp.data$Date2 >= psx.StartDate & sp.data$Date2 <= psx.EndDate,]     
     round(mean(sp.subset$perDel),3)
     })
   output$out.sd <- renderPrint({
     psx.StartDate <- as.POSIXlt(input$StartDate)
     psx.EndDate <- as.POSIXlt(input$EndDate)
     sp.subset <- sp.data[sp.data$Date2 >= psx.StartDate & sp.data$Date2 <= psx.EndDate,]     
     round(sd(sp.subset$perDel),3)
     })  
  output$dispPlot <- renderPlot({
    psx.StartDate <- as.POSIXlt(input$StartDate)
    psx.EndDate <- as.POSIXlt(input$EndDate)
    sp.subset <- sp.data[sp.data$Date2 >= psx.StartDate & sp.data$Date2 <= psx.EndDate,]
    bins <- input$bins
    hist(sp.subset$perDel,breaks=bins,main="Returns Histogram",xlab="Percentage Daily Return")
  })  
  }
)

