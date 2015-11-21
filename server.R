library(shiny)
library(ggplot2)

mtc <- mtcars
mtc$model <- row.names(mtc)
rownames(mtc) <- NULL
mtc$cyl <- factor(mtc$cyl)
mtc$am <- factor(mtc$am)
mtc$gear <- factor(mtc$gear)
mtc$carb <- factor(mtc$carb)

getZscores <- function(unscaled){
      scaled <- apply(unscaled[,c("mpg","disp","hp","drat","wt","qsec")],2,function(z)scale(z))
      scaled <- data.frame(scaled,unscaled[,c("cyl","am","gear","carb","model")])
}

mtcZ <- getZscores(mtc)

##server function
shinyServer(function(input, output) {

      
      output$scatterPlot <- renderPlot({
           
             x <- input$x_var
             y <- input$y_var
             p <- input$p_color
             t <- input$trend
                  
             if(input$zscores){
                   carsData <- mtcZ
             } else {carsData <- mtc}
             
            ##build a scatter plot based on input values
            #select data
            sp <- ggplot(carsData,aes_string(x,y))
            #add colors
            if(p!="none") sp <- sp+geom_point(aes_string(colour=p)) else sp <- sp+geom_point(colour="cornflowerblue")
            #add trend line
            if(t && p!="none") sp+geom_smooth(aes_string(group=p,colour=p),method="lm") else if (t && p=="none") sp+geom_smooth(aes(group=1),method="lm") else sp
            
      })
      output$hover_info <- renderTable({
            ##get hover values from the correct data set 
            if(input$zscores){
                  hoverP <- nearPoints(mtcZ,input$plot_hover,maxpoints = 1)[,c("model",input$x_var,input$y_var)]
            } else {
                  hoverP <- nearPoints(mtc,input$plot_hover,maxpoints = 1)[,c("model",input$x_var,input$y_var)]
            }
            ##deal with no hover state (get rid of warnings from empty table)
            if(length(hoverP$model)==0) rbind(hoverP,c("No Hover"))else hoverP
      })
})

