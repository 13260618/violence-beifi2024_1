library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)
library(shinyjs)


library(readxl)
library(orca)
 
#library(maps)
#library(maptools)

library(rsconnect)

rsconnect::setAccountInfo(name='8itts9-israel-monjaraz0ram0rez',
                          token='645244F9D2D53E88039AD56828337003',
                          secret='Jc68iAavi04W4ZJoRsFNeYMxVPYKa2YJYbcKcQH/')

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
 HTML('<a style="text-decoration:none;cursor:default" class="active" href="#"><b>Violence-2023</a></b>'),
 
 tabPanel(HTML("<b>Resultados</b>"),
             column(4,
                    tabsetPanel(
                       
                      
                      tabPanel(HTML("<b>JUSTIFICACIÓN</b>"),
                               fluidRow(
                                 column(
                                   width = 12,
                                   div(
                                     style = "text-align: justify;",
                                   HTML("<p> <b>
                                        La violencia hacia las mujeres es sin duda alguna, uno de los temas más importantes para nuestra sociedad
                                        en la actualidad debido a las diferencias muy marcadas en diferentes aspectos de la vida diaria 
                                        (salarios, cargos políticos, acoso,  etc), es por ello que a continuación se presenta de manera sintetizada
                                        algunos indicadores representativos tomados de datos oficiales del Instituto Nacional de Estadística y Geografía (INEGI),
                                        que a su vez cuenta con datos de dos encuestas recientemente realizadas en 2016 y 2021, la encuesta:
                                        Encuesta Nacional sobre la Dinámica de las Relaciones en los Hogares (ENDIREH), así mismo algunos indicadores son tomados 
                                        del sitio oficial de Sistema Integrado de Estadísticas sobre Violencia contra las Mujeres (SIESVIM), que pertenece al INEGI.
                                        Este trabajo tiene la finalidad de reunir en un mismo sitio la situación que prevalece en el país sobre indicadores de 
                                        violencia contra las mujeres en México, realizando un análisis exploratorio de dichos datos y brindar algunas conclusiones 
                                        obvias de cada gráfico mostrado.
                                          </p> </b>
                                        ")
                                  
                                   ),
                                   div(
                                     style = "text-align: center;",
                                     tags$img(src = "hypatia.png", height = 150, width = 150),
                                     tags$img(src = "esfm.png", height =150, width = 150)
                                     
                                   )
                                  )
                               )
                      ),
                      
                      id = "tabs",
                      tabPanel(HTML("<b>SITUACIÓN GENERAL</b>"),
                               fluidRow(
                                 column(
                                   width = 12,
                                   selectInput('caso',
                                               HTML("<b> Seleccione el gráfico que desea ver</b> ")
                                                ,
                                               choices = c("Población de mujeres en 2021",
                                                           "Cambios de 2016 a 2021")
                                 
                                               )
                                   
                                   
                                   ,
                                   HTML('<span style="font-size: 120%;"> <b>INTERPRETACIÓN</b> </span>'),
                                   HTML("</p></p>"),
                                   tags$div(textOutput("text_01"), 
                                            style = "
                                                     font-weight: bold;
                                                     font-style: italic;
                                                     font-size: 110%;
                                                     text-align: justify;",
                                            ),                             
                                   HTML("</p></p>"),
                                   textOutput("text_02"),
                                   
                                   
                                 ),
                                 
                                 #plotOutput("plot1")
                               )
                      )
                       
                      
                      
                      )
                    ),
    column(8,
           mainPanel( 
             plotlyOutput("plot_01"),
             
           ) )
             ),
    
    tabPanel(
      HTML("<b>Regionalización</b>"),
    
      column(12,
             HTML("<p></p>"),
             selectInput('states',
                         HTML("<b> Seleccione el análisis por estados que desea ver.</b> ")
                         ,
                         choices = c("Violencia Psicológica",
                                     "Violencia Sexual",
                                     "Violencia Física")
                         
             ),
             HTML("<p></p>"),
             plotlyOutput("plot_02")
      )),
    
    tabPanel(id="5",
      HTML("<b>Aspectos</b>"),
      column(6,
             
      )),
    
    tabPanel( 
             HTML("<b>Feminicidios</b>"),
      column(6,
             plotlyOutput('plot_defunciones')
      )),
    
    tabPanel( 
             HTML("<b>Póster</b>"),
      column(12,
             mainPanel(
               tags$iframe(
                 id = "pdf_viewer",
                 style="height:900px; width:150%;", 
                 src = "poster-beifi2024_1-women.pdf"),
                 style = "border: none;"
               )
               # Aquí se añade el visor de PDF
      #          tags$iframe(style="height:600px; width:100%;", 
      #                      
      )
               
               )
  )
    
  )










