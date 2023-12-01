library(shiny)
library(plotly)
library(readxl)

# setwd("C:/Users/ibrr9/Documents/Mechanics/BEIFI/app")
# Definición de datos

tot <- 126014024 
m <- 51.2
h <- 48.8
mh.df <- data.frame(
  x = c('Mujeres', 'Hombres'),
  y = c(m, h),
  text = c("64.52M","61.49 M")
)
 
df.21_16 <- read_excel("Libro1.xlsx")

order_categories <- c("Discriminación", "Física",
                      "Psicológica", "Sexual", 
                      "Hombres", "Mujeres")

tipo_viole.df <- data.frame(
  x = factor(c("Psicológica", "Sexual","Física",  "Discriminación"), 
             levels = order_categories[1:4]),
  y = c(51.6, 49.0, 34.7, 27.4),
  text = c("33.29 M", "31.61 M", "22.38 M", "7.74 M")
)


compar.16_21 <- data.frame(
  x = factor(c("Psicológica", "Física", "Sexual", "Discriminación")),
  y.2021 = c(51.6, 49.0, 34.7, 27.4),
  y.2016 = c(49.0,34.0,41.3,29.0)
  )
 
df.21_16 <- read_excel("Libro1.xlsx")
# Definición de la app Shiny

server = function(input, output) {
  
  output$plot_01 <- renderPlotly({
    
     
      
    if (input$caso == "Población de mujeres en 2021") {
      
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
    }
    else if (input$caso == "Cambios de 2016 a 2021") {
      
      fig.comparar <- plot_ly(compar.16_21,
                              x = ~x,
                              y = ~y.2016,
                              type = 'bar',
                              name = '2016',
                              marker = list(color = 'blue',
                                            opacity = 0.5)
      )
      fig.comparar <- fig.comparar %>% add_trace(data = compar.16_21, 
                                             x = ~x, 
                                             y = ~y.2021,
                                             type = 'bar', 
                                             name = '2021',
                                             marker = list(color = 'red',
                                                           opacity = 0.5))
      
      fig.comparar <- fig.comparar %>% layout(
        title = 'Cambio en la violencia hacia las mujeres de 2016 a 2021',
        xaxis = list(title = 'Tipo de violencia que viven las mujeres'),
        yaxis = list(title = 'Porcentaje')
      )
      
      
      
      
      
     
    }
     
    
    
    
  })
  
  output$plot_02 <- renderPlotly({
    
    if(input$states == "Violencia Psicológica")
      {   
    plot_ly(df.21_16, 
            x = ~Estado, 
            y = ~Psicológica.16, 
            type = 'bar',
            name = '2016',
            marker = list(color = 'darkgreen', 
                          opacity = 0.5)
    ) %>%
      add_trace(y = ~Psicológica.21, 
                name = '2021',
                marker = list(color = 'darkred', 
                              opacity = 0.5)) %>%
      layout(title = "Comparación en la violencia Psicológica",
             xaxis = list(title = "Estados"),
             yaxis = list(title = "Porcentaje"),
             barmode = 'group') 
    }
    else if(input$states == "Violencia Sexual"){
      plot_ly(df.21_16, 
              x = ~Estado, 
              y = df.21_16$Sexual.16, 
              type = 'bar',
              name = '2016',
              marker = list(color = 'darkgreen', 
                            opacity = 0.5)
      ) %>%
        add_trace(y = ~ df.21_16$Sexual.21, 
                  name = '2021',
                  marker = list(color = 'darkred', 
                                opacity = 0.5)) %>%
        layout(title = "Comparación en la violencia Sexual",
               xaxis = list(title = "Estados"),
               yaxis = list(title = "Porcentaje"),
               barmode = 'group') 
    }
    else if(input$states == "Violencia Física"){
      plot_ly(df.21_16, 
              x = ~Estado, 
              y = df.21_16$Física.16,
              type = 'bar',
              name = '2016',
              marker = list(color = 'darkgreen', 
                            opacity = 0.5)
      ) %>%
        add_trace(y = ~ Física.21, 
                  name = '2021',
                  marker = list(color = 'darkred', 
                                opacity = 0.5)) %>%
        layout(title = "Comparación en la violencia Física",
               xaxis = list(title = "Estados"),
               yaxis = list(title = "Porcentaje"),
               barmode = 'group') 
    }
  else{return(NULL)}
  })
  
  output$plot_defunciones <- renderPlotly({
    violentas <- c(13922, 14086, 13294, 14404)
    homicidio <- c(3752, 3893, 3957, 4002)
    suicidio <- c(1265, 1313, 1436, 1568)
    año <- c(2018, 2019, 2020, 2021)
    datos <- data.frame(violentas, homicidio, suicidio, año)
    
    datos_largo <- tidyr::gather(datos, key = "Tipo", value = "Valor", -año)
    
    # Crear el gráfico interactivo con Plotly
    plot_ly(datos_largo, x = ~año, y = ~Valor, color = ~Tipo, type = 'scatter', mode = 'lines') %>%
      layout(title = "Evolución de defunciones por tipo",
             xaxis = list(title = "Año"),
             yaxis = list(title = "Número de mujeres fallecidas"),
             legend = list(title = "Tipo")) %>%
      config(displayModeBar = FALSE)
  })
  
  
  output$text_01 <- renderText({
    if (input$caso == "Población de mujeres en 2021") {
      
      
      HTML(" De un total de 126,014,024 de habitantes en México un poco más del 50%
      son mujeres (approx.64.5 M). Así mismo se tiene que la violencia psicológica
      es la más afecta a las mujeres ya  que está presente en 51.6%, seguida de la
      violencia sexual (49.7 %), la violencia física (34.7 %) y la violencia económica,
      patrimonial y/o discriminación (27.4 %).
  ")
      
      
    }
    else if (input$caso == "Cambios de 2016 a 2021") {
      HTML("
   De acuerdo a las dos encuestas del INEGI realizadas en los años 2016 y 2021,
    las mujeres mayores a 15 años son víctimas de violencia de género en un 70.1%, 
    es decir al menos 45 millones de mujeres se encontraban en esta problemática en el 2021.
    ")
   
    }
    else {
      return(NULL)
    }
  })
}

