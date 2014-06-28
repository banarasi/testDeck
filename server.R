#install.packages(c("maps", "mapproj"))
require(UsingR)
require(ggplot2)

data(galton)
fit1<-lm(child~parent,galton)
newd<-data.frame(70)
names(newd)<-c("parent")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      newd[1]<-input$parent
      y<-predict(fit1,newdata=newd)
      ggplot(galton,aes(parent,child))+geom_point()+geom_smooth(method="glm",col="steelblue")+
        geom_point(aes_string(x=newd[1],y=y), color="red",shape=8,size=5)+
        labs(title=paste("Estimated Child Height :",y))
    })
  }
)