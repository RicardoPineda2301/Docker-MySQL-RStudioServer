# Parcial # 1
#
## Cargando las librerías
library(shiny)
library(readr)
library(dplyr)
library(RMySQL)
library(DT)
library(pool)
library(lubridate)
library(stringr)
library(shinyWidgets)
library(shinydashboard)
library(shinythemes)

my_db <- dbPool(
    RMySQL::MySQL(), 
    dbname = "parcial1_dp",
    host = "127.0.0.1",
    username = "root",
    idleTimeout = 20000
    #password = "root"
)

df_stats <- as.data.frame(my_db %>% tbl("video_stats"))
df_stats <- df_stats[!duplicated(df_stats$id), ]
df_stats <- df_stats %>%
    rename(
        Vistas = viewCount,
        Likes = likeCount,
        'No me gusta' = dislikeCount,
        Favoritos = favoriteCount,
        Comentarios = commentCount
    )
df_metadata <- as.data.frame(my_db %>% tbl("video_metadata")) 
df_metadata <- df_metadata %>%
    rename(
        id = video_id,
        'Título' = title,
        'Descripción' = description,
        'Código' = iframe,
        Enlace = link
    )
df_metadata <- df_metadata[!duplicated(df_metadata$id), ]
df_stats$id <- substr(df_stats$id, 1, 10) 
df_videos <- merge(df_metadata, df_stats, by ="id")
cols <- c(1, 2, 5, 6, 7, 8, 9, 10)

# Define UI for application that draws a histogram
ui <- navbarPage("Academática Dashboard",
    theme= shinytheme("flatly"),
    #shinythemes::themeSelector(),
    #useShinydashboard(),
    # Application title
    #titlePanel("Academática Dashboard"),
    #tabsetPanel(
        tabPanel("Estadísticas de los datos", 
            fluidRow(     
                 column(width = 8, 
                     plotOutput("distPlot")
                 ),
                 column(width = 4, 
                        valueBoxOutput("caja")
                 )
            ),
            fluidRow(     
                column(width = 4, 
                       valueBoxOutput("caja_likes")
                ),
                column(width = 4, 
                       valueBoxOutput("caja_dislikes")
                ),
                column(width = 4, 
                       valueBoxOutput("caja_favoritos")
                )
            )
        ),
        tabPanel("Filtrar la data por parámetros",
                 # sidebarLayout(
                 #     sidebarPanel(
                 #         sliderInput("dislike_input",
                 #                     "Número de no me gusta:",
                 #                     min = min(df_stats$'No me gusta'),
                 #                     max = max(df_stats$'No me gusta'),
                 #                     value = max(df_stats$'No me gusta')),
                 #         sliderInput("like_input",
                 #                     "Número de likes:",
                 #                     min = min(df_stats$Likes),
                 #                     max = max(df_stats$Likes),
                 #                     value = max(df_stats$Likes)),
                 #         sliderInput("com_input",
                 #                     "Número de comentarios:",
                 #                     min = min(df_stats$Comentarios),
                 #                     max = max(df_stats$Comentarios),
                 #                     value = max(df_stats$Comentarios)
                 #                     ),
                 #         sliderInput("vistas_input",
                 #                     "Número de vistas:",
                 #                     min = min(df_stats$Vistas),
                 #                     max = max(df_stats$Vistas),
                 #                     value = max(df_stats$Vistas)
                 #         ),
                 #         textInput("search_title","Buscar por título o descripción:"),
                 #         textInput("search_link","Buscar por enlace:")
                 #     ),
                     
                     # Show a plot of the generated distribution
                fluidRow(
                    column(width = 12,
                      
                         DT::dataTableOutput("stats")
                     
                    )
                )
                 #)
                 
                 ),
        tabPanel("Vídeo seleccionado", 
                 
                     mainPanel(
                         #plotOutput("distPlot"),
                         h3("Vídeo seleccionado"),
                         h4(textOutput("vacio")),
                         h1(textOutput("titulo_video")),
                         textOutput("codigo"),
                         uiOutput("video")
                     )
                 
        )
    #)
                     
    # Sidebar with a slider input for number of bins 
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    ## Base de datos
    
    
    

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- df_videos[, 6]
        bins <- seq(min(x), max(x), length.out = 20)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white', main="Distribución de vistas en el dataset", xlab="Vistas (agrupadas)")
    })
    
    output$stats <- DT::renderDataTable({
        #link <- as.character(input$search_link)
        #titulos <- as.character(input$search_title)
        #dislike_input <- as.integer(input$dislike_input)
        #like_input <- as.integer(input$like_input)
        #com_input <- as.integer(input$com_input)
        #vistas_input <- as.integer(input$vistas_input)
        #resultado_busqueda <- df_videos %>% filter(str_detect(Enlace,link))
        #resultado_busqueda <- resultado_busqueda %>% filter(str_detect(`Descripción`,titulos) | str_detect(`Título`,titulos))
        #resultado_busqueda <- resultado_busqueda %>% filter(`Likes` <= like_input & `No me gusta` <=like_input & Comentarios <= com_input & Vistas <= vistas_input )
        DT::datatable(df_videos[,cols],
                      filter = 'top',
                      options = list(
                          pageLength = 5,
                          lengthMenu = c(5, 10, 5)
                      )
                         
                      ) }, selection = 'single', server = TRUE)
    
    
    # output$vacio <- renderText({
    #     if(input$stats_rows_selected < 1){
    #         "Seleccione un vídeo por favor"
    #     } else {
    #         ""
    #     }
    #     })
    # }
    output$codigo <- renderText({
        df_videos[input$stats_rows_selected, 3]
        
    })
    
    output$titulo_video <- renderText({
        df_videos[input$stats_rows_selected, 2]
        
    })
    
    output$video <- renderUI({
        HTML(df_metadata[input$stats_rows_selected, 4])
    })
    
    
    output$caja <- renderValueBox({
        valueBox(
            value = max(df_videos$Vistas),
            subtitle = "Mayor cantidad de vistas",
            icon = icon("eye"),
            color = "red"
        )
    })
    
    output$caja_likes <- renderValueBox({
        valueBox(
            value = max(df_videos$Likes),
            subtitle = "Mayor cantidad de likes",
            icon = icon("heart"),
            color = "red"
        )
    })
    
    output$caja_dislikes <- renderValueBox({
        valueBox(
            value = max(df_videos$`No me gusta`),
            subtitle = "Mayor cantidad de 'No me gusta'",
            icon = icon("hand"),
            color = "red"
        )
    })
    
    output$caja_favoritos <- renderValueBox({
        valueBox(
            value = max(df_videos$Favoritos),
            subtitle = "Mayor cantidad de favoritos",
            icon = icon("star"),
            color = "red"
        )
    })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
