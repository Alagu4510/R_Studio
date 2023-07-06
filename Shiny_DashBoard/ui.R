library(shiny)
library(shinydashboard)
library(fontawesome)
library(ggplot2)
library(lattice)
library(shinycssloaders)



ui <- shinyUI(
  dashboardPage(
    dashboardHeader(title = "Graph Charts"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Histogram", tabName = "histogramdashboard", icon = icon("dashboard")),
        menuItem("GG Plot", tabName = "bwplotdashboard", icon = icon("dashboard")),
        menuItem("XY Plot", tabName = "xyplotdashboard", icon = icon("dashboard")),
        menuItem("Density Plot", tabName = "densityplotdashboard", icon = icon("dashboard")),
        menuItem("Barchart", tabName = "barchartdashboard", icon = icon("dashboard"))
      )
    ),
    dashboardBody(
      
      tabItems(
        tabItem(tabName = "histogramdashboard",
                fluidRow(
                  box(withSpinner(plotOutput("histogram"))),
                  box(sliderInput("bins", "Number of Breaks", 1, 100, 50))
                )
        ),
        tabItem(tabName = "bwplotdashboard",
                fluidRow(
                  box(withSpinner(plotOutput("plot1"))),
                  box(withSpinner(plotOutput("plot2")))
                )
        ),
        tabItem(tabName = "xyplotdashboard",
                fluidRow(
                  box(withSpinner(plotOutput("plot3"))),
                  box(withSpinner(plotOutput("plot4")))
                )
        ),
        tabItem(tabName = "densityplotdashboard",
                fluidRow(
                  box(withSpinner(plotOutput("plot5"))),
                  box(withSpinner(plotOutput("plot6")))
                )
        ),
        tabItem(tabName = "barchartdashboard",
                fluidRow(
                  box(withSpinner(plotOutput("plot7"))),
                  box(withSpinner(plotOutput("plot8")))
                )
        )
      )
    )
  )
)

server <- function(input, output) {
  # Server logic for generating the plots
  
  # Example server logic for histogram plot
  output$histogram <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the histogram plot
      hist(rnorm(200), breaks = input$bins, main = "Histogram")
    })
  })
  
  # Example server logic for ggplot plots
  output$plot1 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the ggplot plot 1
      ggplot(data = mpg, aes(x = class)) + geom_bar() + theme_minimal()
    })
  })
  
  output$plot2 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the ggplot plot 2
      ggplot(data = iris, aes(x = Species, y = Sepal.Width)) + geom_boxplot() + theme_minimal()
    })
  })
  
  # Example server logic for xyplot plots
  output$plot3 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the xyplot plot 1
      xyplot(Sepal.Length ~ Sepal.Width, data = iris, groups = Species, auto.key = TRUE)
    })
  })
  
  output$plot4 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the xyplot plot 2
      xyplot(Petal.Length ~ Petal.Width, data = iris, groups = Species, auto.key = TRUE)
    })
  })
  
  # Example server logic for density plots
  output$plot5 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the density plot 1
      densityPlot(data = iris, x = "Sepal.Length", groups = Species, auto.key = TRUE)
    })
  })
  
  output$plot6 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the density plot 2
      densityPlot(data = iris, x = "Petal.Length", groups = Species, auto.key = TRUE)
    })
  })
  
  # Example server logic for bar chart plots
  output$plot7 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the bar chart plot 1
      barplot(table(iris$Species), main = "Bar Chart 1")
    })
  })
  
  output$plot8 <- renderPlot({
    # Show the loading spinner before fetching data
    withSpinner({
      # Simulating some time-consuming operation
      Sys.sleep(1)
      
      # Generate the bar chart plot 2
      barplot(table(iris$Petal.Width), main = "Bar Chart 2")
    })
  })
}

shinyApp(ui, server)
