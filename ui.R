library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)


library(maps)
#library(maptools)




bootstrapPage(
  
  tags$head(
    tags$style(
      HTML("
    .navbar-nav { /* Hace las pestañas verticales */
      flex-direction: column !important;
    }
    
     body {
        background-color:background-color: rgba(255, 255, 255, 0.4); /* Cambia el color de fondo a blanco */
     }
      
    .sidebar {
          background-color: rgba(255, 255, 255, 0.8); /* Fondo blanco semi-transparente */
          border: 1px solid rgba(0, 0, 0, 0.1); /* Borde ligero */
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Sombra suave */
        }
    
    
    .navbar-nav .nav-link {
      padding-left: 15px; /* Ajusta el padding de las pestañas */
    }
    .nav-item { /* Cambia el color de fondo de las pestañas y su transparencia */
      background-color:  rgba(235, 190, 235, 0.4);
      border-bottom: 1px solid rgba(255, 182, 193, 0.5);
    }
    .nav-item a { /* Cambia el color del texto en las pestañas */
      color: #8A2BE2;
    }
    .navbar-nav .active { /* Cambia el color de fondo de la pestaña activa */
      background-color: rgba(235, 130, 235, 0.4);
    }
    
    
    
    
    /* Estilos para la línea de separación */
      .separation-line {
        border-left: 2px solid #3498db; /* Color de la línea (azul) */
        padding-left: 10px; /* Espaciado izquierdo para la línea */
      }
      
       /* Estilos personalizados para el tabsetPanel */
      .nav-tabs .nav-link {
        border-bottom: 2px solid #3498db; /* Línea de borde inferior en las pestañas */
        background-color: rgba(255, 255, 255, 0.4);
      }
    
    
    
  "
           )
      )
    ),
  

  
  navbarPage(
    theme = shinytheme("simplex"), 
    collapsible = TRUE,
    id = "nav",
    windowTitle = "WOMEN",
    HTML('<a style="text-decoration:none;cursor:default" class="active" href="#">Violence-2023</a>'),
    
    
    
    
    tabPanel("Resultados",
             column(6,
                    tabsetPanel(
                      id = "tabs",
                      tabPanel("Tab 1", 
                               #Contenido de la pestaña 
                               
                               fluidRow(
                                 column(
                                   width = 6,
                                   sliderInput("bins_tab1",
                                               "Número de Bins:",
                                               min = 1,
                                               max = 50,
                                               value = 30),
                                   
                                   dateInput("f0", HTML("<b style=color:#045a8d>Tiempo de inicio (ti)</b>"), 
                                             value = as.Date("2021/05/28"), 
                                             format = "yyyy/mm/dd", 
                                            #min = min(data0$Fecha), max = max(data0$Fecha)
                                   )
                                 ),
                                   
                                   #plotOutput("plot1")
                                 )
                               )
                      ),
                      # tabPanel("Tab 2", 
                      #          # Contenido de la pestaña 2
                      #          fluidRow(
                      #            column(
                      #              width = 6,
                      #              plotOutput("plot2")
                      #            )
                      #          )
                      # ),
                      # tabPanel("Tab 3", 
                      #          # Contenido de la pestaña 3
                      #          fluidRow(
                      #            column(
                      #              width = 6,
                      #              plotOutput("plot3")
                      #            )
                      #          )
                      # )
                    ),
             
             
             column(6,
                    mainPanel( 
                      plotlyOutput("histogram")
                    )
                    
                    
                    
                    )
             
             
             )
    ,
    
    tabPanel(
      "Regionalización",
      column(6,
             
             )),
      
      tabPanel(
        "Aspectos",
        column(6,
               
        )),
        
        tabPanel(
          "Feminicidios",
          column(6,
                 
          )),
          
          tabPanel(
            "Históricos",
            column(6,
                   
            ))
      
      
    )
  )
    
    
    
    
    
    
      
                                     
  
