

library(shiny)
library(plotly)


# Definición de datos
tot <- 126014024 
m <- 51.2
h <- 48.8
mh.df <- data.frame(
  x = c('Mujeres', 'Hombres'),
  y = c(m, h),
  text = c("128 M","60 M")
)

order_categories <- c("Discriminación", "Física", "Psicológica", "Sexual", "Hombres", "Mujeres")

tipo_viole.df <- data.frame(
  x = factor(c("Psicológica", "Física", "Sexual", "Discriminación"), 
             levels = order_categories[1:4]),
  y = c(51.6, 49.7, 34.7, 27.4),
  text = c("68.8 M", "30 M", "15 M", "12 M")
)

# Definición de la app Shiny
 
  server = function(input, output) { 
    output$plot_01 <- renderPlotly({
      mh.plt <- plot_ly(mh.df, 
                        x = ~x, 
                        y = ~y,
                        type = 'bar',
                        name = 'Población total',
                        text = ~text,
                        marker = list(color = 'purple', 
                                      opacity = 0.5)
                        
                        )
      
      tipo_viole.plt <- mh.plt %>% add_trace(data = tipo_viole.df, 
                                             x = ~x, 
                                             y = ~y,
                                             type = 'bar', 
                                             name = 'Tipos de violencia',
                                             text = ~text,
                                             marker = list(color = 'red',
                                                           opacity = 0.5))
      
      mh.plt <- tipo_viole.plt %>% layout(
        title = 'Distribución porcentual de mujeres violentadas',
        xaxis = list(title = ' ', 
                     categoryorder = "array", 
                     categoryarray = order_categories),
        yaxis = list(title = 'Porcentaje')
      )
      
      # Mostrar el gráfico combinado
      mh.plt
    })
  
  
  
  
  
  output$text_01 <- renderText({
    if (input$caso == "Porcentaje de mujeres en el país (2021)") {
      HTML("
    De acuerdo a las dos encuestas del INEGI realizadas en los años 2016 y 2021,
    las mujeres mayores a 15 años son víctimas de violencia de género en un 70.1%, 
    es decir de un total de 65.5 millones de mujeres a dicha fecha aproximadamente 
    46 millones.
    ")
    }
    else if (input$caso == "Encuestas de violencia 2016 vs 2021") {
      HTML("
      La violencia psicológica es la más afecta a las mujeres ya  que está
         presente en 51.6%,  seguida de la violencia sexual (49.7 %), la 
         violencia física (34.7 %) y la violencia económica, patrimonial y/o
         discriminación (27.4 %).
  ")
    }
    else {
      return(NULL)
    }
  })
}


