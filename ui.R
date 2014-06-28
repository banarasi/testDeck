# ui.R

shinyUI(fluidPage(
  titlePanel("Predict Child height for given Parent's Height"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select the Parent height to estimate Child Height using Galton's Data"),
      sliderInput("parent", 
                  label = "Parent height",
                  min = 64, max = 73, value = 68),
      br(),
      br(),
      br(),
      
      helpText("Note: This is simple application which will use the famous Galton's data to estimate the child's height using Linear Model")
    ),
    
    mainPanel(plotOutput("map"))
  )
))
