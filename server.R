library(shiny)
library(ggplot2)
library(Cairo)   # For nicer ggplot2 output when deployed on Linux

# Define server logic for random distribution application
shinyServer(function(input, output) {
  # PLOT 1 for user A0066
  # start of interactive plot for unique urls vs time for user
  # For storing which rows have been excluded
  #READ in all CSV files
  A0046_unique_urls_java <- read.csv("~/tabsets/A0046_unique_urls_java.csv")
  A0046_unique_urls <- read.csv("~/tabsets/A0046_unique_urls.csv")
  A0066_month_activity <- read.csv("~/tabsets/A0066_month_activity.csv")
  result <- read.csv("~/tabsets/result.csv",row.names=1)
  vals1 <- reactiveValues(
    keeprows = rep(TRUE, nrow(A0066_month_activity))
  )
  
  output$plot1 <- renderPlot({
    # Plot the kept and excluded points as two separate data sets
    keep    <- A0066_month_activity[ vals1$keeprows, , drop = FALSE]
    exclude <- A0066_month_activity[!vals1$keeprows, , drop = FALSE]
    
    p1<-ggplot(keep, aes(timestamp,count)) + geom_point() +
      geom_smooth(method = lm, fullrange = TRUE, color = "black") +
      geom_point(data = exclude, fill = NA, color = "black", alpha = 0.25) 
     # coord_cartesian(xlim = c(1440880000, 1443210000), ylim = c(0,20))
    p1 + scale_x_continuous(name="User activity between 29 Aug 2015 - 26 Sept 2015", limits=c(1440880000, 1443210000)) +
      scale_y_continuous(name="Frequency of unique URLs", limits=c(0,18))
  })
  
  # Toggle points that are clicked
  observeEvent(input$plot1_click, {
    res <- nearPoints(A0066_month_activity, input$plot1_click, allRows = TRUE)
    
    vals1$keeprows <- xor(vals1$keeprows, res$selected_)
  })
  
  # Toggle points that are brushed, when button is clicked
  observeEvent(input$exclude_toggle1, {
    res <- brushedPoints(A0066_month_activity, input$plot1_brush, allRows = TRUE)
    
    vals1$keeprows <- xor(vals1$keeprows, res$selected_)
  })
  
  # Reset all points
  observeEvent(input$exclude_reset1, {
    vals1$keeprows <- rep(TRUE, nrow(A0066_month_activity))
  })
  ########################################################################
  ## Plot 2 for user A0046
  # For storing which rows have been excluded
  vals2 <- reactiveValues(
    keeprows = rep(TRUE, nrow(A0046_unique_urls))
  )
  
  output$plot2 <- renderPlot({
    # Plot the kept and excluded points as two separate data sets
    keep    <- A0046_unique_urls[ vals2$keeprows, , drop = FALSE]
    exclude <- A0046_unique_urls[!vals2$keeprows, , drop = FALSE]
    
    p2<-ggplot(keep, aes(timestamp, count)) + geom_point() +
      geom_smooth(method = lm, fullrange = TRUE, color = "black") +
      geom_point(data = exclude, fill = NA, color = "black", alpha = 0.25) 
      #coord_cartesian(xlim = c(1440880000, 1443210000), ylim = c(0,20))
    p2 + scale_x_continuous(name="User activity between 28 Aug 2015 - 23 Sept 2015", limits=c(1440880000, 1443210000)) +
      scale_y_continuous(name="Frequency of unique URLs", limits=c(0,18))
  })
  
  # Toggle points that are clicked
  observeEvent(input$plot2_click, {
    res <- nearPoints(A0046_unique_urls, input$plot2_click, allRows = TRUE)
    
    vals2$keeprows <- xor(vals2$keeprows, res$selected_)
  })
  
  # Toggle points that are brushed, when button is clicked
  observeEvent(input$exclude_toggle2, {
    res <- brushedPoints(A0046_unique_urls, input$plot2_brush, allRows = TRUE)
    
    vals2$keeprows <- xor(vals2$keeprows, res$selected_)
  })
  
  # Reset all points
  observeEvent(input$exclude_reset2, {
    vals2$keeprows <- rep(TRUE, nrow(A0046_unique_urls))
  })
  ########################################################################
  ## Plot 3 for user A0046 for java
  # For storing which rows have been excluded
  vals3 <- reactiveValues(
    keeprows = rep(TRUE, nrow(A0046_unique_urls_java))
  )
  
  output$plot3 <- renderPlot({
    # Plot the kept and excluded points as two separate data sets
    keep    <- A0046_unique_urls_java[ vals3$keeprows, , drop = FALSE]
    exclude <- A0046_unique_urls_java[!vals3$keeprows, , drop = FALSE]
    
    p<-ggplot(keep, aes(timestamp, count)) + geom_point() +
      geom_smooth(method = lm, fullrange = TRUE, color = "black") +
      geom_point(data = exclude, fill = NA, color = "black", alpha = 0.25)
      #coord_cartesian(xlim = c(1443040000, 1444670000), ylim = c(0,18))
    p + scale_x_continuous(name="User activity between 23 Sept 2015 - 12 Oct 2015", limits=c(1443040000, 1444670000)) +
      scale_y_continuous(name="Frequency of unique URLs", limits=c(0,18))
  })
  
  # Toggle points that are clicked
  observeEvent(input$plot3_click, {
    res <- nearPoints(A0046_unique_urls_java, input$plot3_click, allRows = TRUE)
    
    vals3$keeprows <- xor(vals3$keeprows, res$selected_)
  })
  
  # Toggle points that are brushed, when button is clicked
  observeEvent(input$exclude_toggle3, {
    res <- brushedPoints(A0046_unique_urls_java, input$plot3_brush, allRows = TRUE)
    
    vals3$keeprows <- xor(vals3$keeprows, res$selected_)
  })
  
  # Reset all points
  observeEvent(input$exclude_reset3, {
    vals3$keeprows <- rep(TRUE, nrow(A0046_unique_urls_java))
  })
  ###########################################################################
  ## HEATMAP plot
  output$plot4 <- renderPlot({
    mtscaled <- as.matrix(scale(result))
    heatmap(mtscaled,
            col = heat.colors(200, alpha=0.5),
            Colv=F, scale="none")
  })
  
})