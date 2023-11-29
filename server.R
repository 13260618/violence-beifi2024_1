 

library(shiny)

function(input, output) { 
  # 
  # Generar histograma para la pestaña Tab 1
  output$histogram <- renderPlotly({
    x <- rnorm(500, mean = 0, sd = 1)
    
    # Verificar que input$bins_tab1 no sea NULL o NA
    if (!is.null(input$bins_tab1) && !is.na(input$bins_tab1) && input$bins_tab1 > 0) {
      bins <- seq(min(x), max(x), length.out = input$bins_tab1 + 1)
      plot_ly(x = x, type = "histogram", histnorm = "probability", 
              autobinx = FALSE, xbins = list(start = min(bins), end = max(bins), size = (max(bins)-min(bins))/input$bins_tab1)) %>%
        layout(title = "Histograma - Tab 1",
               xaxis = list(title = "Valores"),
               yaxis = list(title = "Frecuencia"))
    } else {
      plot_ly(x = NULL, type = "scatter", mode = "markers") %>%
        layout(title = "Datos insuficientes para el histograma")
    }
  })
  # 
  # output$text_output <- renderText({
  #   HTML("
  #   <p>Este es un bloque de texto en <em>formato markdown</em>.</p>
  #   <h1>Esto es un encabezado en Markdown</h1>
  #   <ul>
  #     <li>Esto es un punto en Markdown</li>
  #   </ul>
  # ")
  # })
}
