

library(shiny)
library(plotly)


#hombres y mujeres en mex 2021
tot = 126014024 
m = 51.2
h = 48.8
#mujeres mas y menos de 15  
m15 = m*0.771
mno15 = m - m15

function(input, output) { 
  # 
  # Generar histograma para la pestaña Tab 1 
  lista_graficos <- list(
    plot_ly(x = c("Mujeres", "Hombres", "Psicológica", "Física", "Sexual", "Discri"), 
            y = c(60, 40, NA, NA, NA,NA),
            type = 'bar', 
            name = "Población total",
            marker = list(color = 'rgba(162, 51, 255, 0.5)')
    ) %>%
      add_trace(y = c( 20, 30,50,45,NA, NA ),
                name = "Violencia en mujeres",
                marker = list(color = '#a68df4')
      ) %>%
      layout(title = 'Distribución porcentual de mujeres en México (2021)',
             plot_bgcolor='#ffffff', 
             xaxis = list(zerolinecolor = '#888',
                          zerolinewidth = 1, 
                          gridcolor = '#ddd'), 
             yaxis = list(zerolinecolor = '#888',
                          zerolinewidth = 1, 
                          gridcolor = '#ddd')
      )
  )
  
  
  
  output$plot_01 <- renderPlotly({
    lista_graficos[[1]]
    
    
    
    # if (input$button_1 == 1) {
    #   lista_graficos[[1]]
    # } else if (input$button_2 ==2) {
    #   lista_graficos[[2]]
    # } else {
    #   lista_graficos[[1]]  # Muestra el primer gráfico por defecto al iniciar
    # }
    
    
    
    # fig <-  plot_ly(x = c("Mujeres","Hombres"), y = c(m,h), type = 'bar') %>%
    #   layout(title = 'Proporción de mujeres en México (2021)',
    #          plot_bgcolor='#e5ecf6', 
    #          xaxis = list( 
    #            zerolinecolor = '#ffff', 
    #            zerolinewidth = 2, 
    #            gridcolor = 'ffff'), 
    #          yaxis = list( 
    #            zerolinecolor = '#ffff', 
    #            zerolinewidth = 2, 
    #            gridcolor = 'ffff'))
    # 
    # fig
    
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




 






