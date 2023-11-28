library(shiny)
library(shinythemes)



navbarPage(
  theme = shinytheme("simplex"), 
  collapsible = TRUE,
  id = "nav",
  windowTitle = "WOMEN",
  HTML('<a style="text-decoration:none;cursor:default" class="active" href="#">WOMEN-2023</a>'),
  
  tabPanel("Resultados",
           sidebarLayout(
             sidebarPanel(
               width = 3,
               fluidRow(
                 column(
                   width = 12,
                   sliderInput("bins_tab1",
                               "Número de Bins:",
                               min = 1,
                               max = 50,
                               value = 30),
                   numericInput('numb',"numero de graphs",
                                min=4,
                                max=19, value = 7)
                 )
               )
             ),
             mainPanel(
               width = 9,
               fluidRow(
                 column(
                   width = 6,
                   plotOutput("histogram_tab1")
                 ),
                 column(
                   width = 6,
                   verbatimTextOutput("text_output")  
                 )
               )
             )
           )
  ),
  
  tabPanel("Muertes",
           sidebarLayout(
             sidebarPanel(
               # Input: Slider for the number of bins (for Tab 2)
               sliderInput("bins_tab2",
                           "Número de Bins (Tab 2):",
                           min = 1,
                           max = 50,
                           value = 30)
             ),
             mainPanel(
               plotOutput("histogram_tab2")
             )
           )
  ),
  tags$head(
  tags$style(
  HTML("
    .navbar-nav { /* Hace las pestañas verticales */
      flex-direction: column !important;
    }
    
     body {
        background-color: #ffffff; /* Cambia el color de fondo a blanco */
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
  "
       ))
)
)
