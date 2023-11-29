library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)
library(shinyjs)


#library(maps)
#library(maptools)


bootstrapPage(
  useShinyjs(), 
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
      
      
      /*Estilo para botones*/
      
      .my-btn {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
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
             column(4,
                    tabsetPanel(
                      id = "tabs",
                      tabPanel("General", 
                               #Contenido de la pestaña 
                               
                               fluidRow(
                                 column(
                                   width = 12,
                                   
                                   selectInput('caso',
                                               "Seleccione el gráfico que desea ver",
                                               choices = c("Porcentaje de mujeres en el país (2021)",
                                                           "Encuestas de violencia 2016 vs 2021")
                                               
                                   )
                                   
                                   
                                   ,
                                   HTML('<span style="font-size: 120%;"> <b>INTERPRETACIÓN</b> </span>'),
                                   HTML("</p></p>"),
                                   tags$div(textOutput("text_01"), 
                                            style = "
                                                     font-weight: bold;
                                                     font-style: italic;
                                                     font-size: 110%;")
                                   #color: #A233FF;
                                   ,                             
                                     HTML("</p></p>"),
                                   textOutput("text_02"),
                                   
                                   
                                 ),
                                 
                                 #plotOutput("plot1")
                               )
                      )
                      ,
                      tabPanel("Escolar",
                               # Contenido de la pestaña 2
                               fluidRow(
                                 column(
                                   width = 8,
                                   plotOutput("plot_02")
                                 )
                               )
                      ),
                      tabPanel("Laboral",
                               # Contenido de la pestaña 3
                               fluidRow(
                                 column(
                                   width = 8,
                                   plotOutput("plot_03")
                                 )
                               )
                      )
                    )),
             
             
             column(8,
                    mainPanel( 
                      plotlyOutput("plot_01"),
                      

                      #actionButton("next_graph", "Siguiente Gráfico")
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
      "Póster",
      column(6,
             
      ))
    
    
  )
)









