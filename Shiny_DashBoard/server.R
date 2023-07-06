library(shiny)
library(shinydashboard)
library(ggplot2)
library(lattice)

# Sample data for plot 1
data1 <- data.frame(x = 1:11, y = c(3,4, 5, 9, 6, 8, 4, 2, 7, 1, 3))

# Sample data for plot 2
data2 <- data.frame(x = 1:11, y = c(2,3, 6, 5, 8, 4, 3, 9, 1, 7, 3))

# Sample data for density plot 1
data3 <- rnorm(1000, mean = 0, sd = 1)

# Sample data for density plot 2
data4 <- rnorm(1000, mean = 2, sd = 1)

# Sample data for bar chart plot 1
data5 <- data.frame(Category = c("A", "B", "C", "D"), Value = c(10, 20, 15, 5))

# Sample data for bar chart plot 2
data6 <- data.frame(Category = c("X", "Y", "Z"), Value = c(8, 12, 18))



shinyServer(function(input,output){
  
  output$histogram <- renderPlot({
    hist(faithful$eruptions,breaks = input$bins)
  })
  
  output$plot1 <- renderPlot({
    # Create plot 1 using ggplot2
    p1 <- ggplot(data1, aes(x = x, y = y)) +
      geom_point(color = "black") +
      labs(x = "X1", y = "Y1") +
      ggtitle("GG Plot 1")
    
    # Render the plot
    print(p1)
  })
  
  output$plot2 <- renderPlot({
    # Create plot 2 using ggplot2
    p2 <- ggplot(data2, aes(x = x, y = y)) +
      geom_point(color = "blue") +
      labs(x = "X2", y = "Y2") +
      ggtitle("GG Plot 2")
    
    # Render the plot
    print(p2)
  })
  
  # Render plot 1
  output$plot3 <- renderPlot({
    # Create plot 1 using xyplot from lattice package
    p3 <- xyplot(y ~ x, data = data1, type = c("p"), col = "black",
                 xlab = "X1", ylab = "Y1", main = "XY Plot")
    
    # Render the plot
    print(p3)
  })
  
  # Render plot 2
  output$plot4 <- renderPlot({
    # Create plot 2 using xyplot from lattice package
    p4 <- xyplot(y ~ x, data = data2, type = c("p"), col = "black",
                 xlab = "X2", ylab = "Y2", main = "XY Plot")
    
    # Render the plot
    print(p4)
  })
  # Render density plot 1
  output$plot5 <- renderPlot({
    # Create density plot 1 using ggplot2
    p5 <- ggplot(data.frame(x = data3), aes(x = x)) +
      geom_density(color = "black", fill = "white") +
      labs(x = "X", y = "Density", title = "Density Plot 1")
    
    # Render the plot
    print(p5)
  })
  
  # Render density plot 2
  output$plot6 <- renderPlot({
    # Create density plot 2 using ggplot2
    p6 <- ggplot(data.frame(x = data4), aes(x = x)) +
      geom_density(color = "black", fill = "white") +
      labs(x = "X", y = "Density", title = "Density Plot 2")
    
    # Render the plot
    print(p6)
  })
  
  # Render bar chart plot 1
  output$plot7 <- renderPlot({
    # Create bar chart plot 1 using ggplot2
    p7 <- ggplot(data5, aes(x = Category, y = Value, fill = Category)) +
      geom_bar(stat = "identity", color = "black") +
      labs(x = "Category", y = "Value", title = "Bar Chart Plot 1") +
      theme_bw() +
      theme(legend.position = "none")
    
    # Render the plot
    print(p7)
  })
  
  # Render bar chart plot 2
  output$plot8 <- renderPlot({
    # Create bar chart plot 2 using ggplot2
    p8 <- ggplot(data6, aes(x = Category, y = Value, fill = Category)) +
      geom_bar(stat = "identity", color = "black") +
      labs(x = "Category", y = "Value", title = "Bar Chart Plot 2") +
      theme_bw() +
      theme(legend.position = "none")
    
    # Render the plot
    print(p8)
  })
  
  output$tb <- renderTable({
    Sys.sleep(3) # system sleeping for 3 seconds for demo purpose
    iris[1:5,]
  })
  
  
  
})