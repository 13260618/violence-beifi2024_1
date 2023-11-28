
library(shiny)

function(input, output) { 
  # Generate histogram for Tab 1
  output$histogram_tab1 <- renderPlot({
    x <- rnorm(500, mean = 0, sd = 1)
    bins <- seq(min(x), max(x), length.out = input$bins_tab1 + 1)
    hist(x, breaks = bins, col = 'skyblue', border = 'black', xlab = 'Valores', main = 'Histograma - Tab 1')
  })
  
  # Generate histogram for Tab 2
  output$histogram_tab2 <- renderPlot({
    x <- rnorm(500, mean = 0, sd = 1)
    bins <- seq(min(x), max(x), length.out = input$bins_tab2 + 1)
    hist(x, breaks = bins, col = 'salmon', border = 'black', xlab = 'Valores', main = paste('Histograma - Tab 2',input$numb ))
  })
  
  
  output$text_output <- renderText({
    HTML("
    <p>Este es un bloque de texto en <em>formato markdown</em>.</p>
    <h1>Esto es un encabezado en Markdown</h1>
    <ul>
      <li>Esto es un punto en Markdown</li>
    </ul>
  ")
  })
  
}
