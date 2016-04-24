library(shiny)
set.seed(1234)
shinyServer(
        function(input,output){
                mu=reactive({input$mu})
                sdev=reactive({input$sd})
                g<-reactive({rnorm(1000,mu(),sdev())})
                output$newHist<-renderPlot({h<-hist(g(), breaks=10, density=10, xlim=c(0,25),ylim=c(0,400),
                                                    col="gray", xlab="random data", main="Histogram")
                xfit<-seq(min(g()),max(g()),length=40) 
                yfit<-dnorm(xfit,mean=mean(g()),sd=sd(g())) 
                yfit <- yfit*diff(h$mids[1:2])*length(g()) 
                lines(xfit, yfit, col="black", lwd=2)
                })
                
        }
)