library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
      
      # Application title
      titlePanel("1974 Motor Trend Road Tests Data Explorer"),
      
      # Sidebar 
      sidebarLayout(
            sidebarPanel(
                  p("Use the options below to interactively explore the 1974 Motor Trends Road Tests data set via the graph on the right. "),
                  selectInput("x_var", "X Variable:",
                              c("Cylinders" = "cyl",
                                "MPG" = "mpg",
                                "Displacment" = "disp",
                                "Horsepower" = "hp",
                                "Rear axle ratio" = "drat",
                                "Weight (lb/1000)" = "wt",
                                "Quarter mile time" = "qsec",
                                "Carburetors" = "carb",
                                "Transmission" = "am",
                                "Gears" = "gear")),
                  selectInput("y_var", "Y Variable:",
                              c("MPG" = "mpg",
                                "Cylinders" = "cyl",
                                "Displacment" = "disp",
                                "Horsepower" = "hp",
                                "Rear axle ratio" = "drat",
                                "Weight (lb/1000)" = "wt",
                                "Quarter mile time" = "qsec",
                                "Carburetors" = "carb",
                                "Transmission" = "am",
                                "Gears" = "gear")),
                  selectInput("p_color", "Group by:",
                              c("None" = "none",
                                "Cylinders" = "cyl",
                                "Carburetors" = "carb",
                                "Transmission" = "am",
                                "Gears" = "gear")),
                  checkboxInput("zscores", "Use z-Scores", FALSE),
                  checkboxInput("trend","Add Regression Line(s)",FALSE)
            ),
            
            # Main Panel
            mainPanel(
                  plotOutput("scatterPlot",hover = hoverOpts(
                        id = "plot_hover")),
                  h3("Detailed Information"),
                  p("(Note: Hover over a data point in the graph to see the details.)"),
                  tableOutput("hover_info")
            )
      )
))