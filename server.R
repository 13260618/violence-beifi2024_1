 

library(shiny)
#hombres y mujeres en mex 2021
m = 65500000
h = 128000000 - m
#mujeres mas y menos de 15  
m15 = m*0.771
mno15 = m - m15

function(input, output) { 
  # 
  # Generar histograma para la pestaña Tab 1
  output$histogram <- renderPlotly({
    x <- rnorm(500, mean = 0, sd = 1)
    
      if (!is.null(input$bins_tab1) && !is.na(input$bins_tab1) && input$bins_tab1 > 0) {
      bins <- seq(min(x), max(x), length.out = input$bins_tab1 + 1)
      plot_ly(x = x, type = "histogram", histnorm = "probability", 
              autobinx = FALSE,
              xbins = list(start = min(bins),
                           end = max(bins), 
                           size = (max(bins)-min(bins))/input$bins_tab1)) %>%
        layout(title = "Histograma - Tab 1",
               xaxis = list(title = "Valores"),
               yaxis = list(title = "Frecuencia"))
    } else {
      plot_ly(x = NULL, type = "scatter", mode = "markers") %>%
        layout(title = "Datos insuficientes para el histograma")
    }
  })
  
  output$text_output <- renderText({
    if (input$caso == "Porcentaje de mujeres en el país (2021)") {
      # Lógica para la interpretación del primer caso
      return("Aquí va la interpretación del primer caso...")
    } else if (input$caso == "Encuestas de violencia 2016 vs 2021") {
      # Lógica para la interpretación del segundo caso
      return("Aquí va la interpretación del segundo caso...")
    } else {
      return(NULL)
    }
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
