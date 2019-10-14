library(shiny)
library(shinysky)


my_autocomplete_list <- c("John Doe","Ash","Ajay sharma","Ken Chong","Will Smith","Neo")

country_list <- c("Argentina","Austria","Australia","Belgium","Bolivia (Plurinational State of)","Brazil","Canada","Switzerland","Chile","Colombia","Costa Rica","Cyprus","Czech Republic","Germany","Denmark","Dominican Republic","Ecuador","Estonia","Spain","Finland","France","United Kingdom of Great Britain and Northern Ireland","Greece","Guatemala","Hong Kong","Honduras","Hungary")


shinyUI(fluidPage(
  tags$head(tags$style(HTML("body{
                            background-image: url(http://wallportal.com/uploads/posts/backgrounds-for-music/backgrounds_for_music_010.jpg);
                            }"))
            ,tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")),
  titlePanel("ROCKNROLLA"),
   
  # 
  # 
  # navbarPage(
  #   tags$head(tags$style(HTML("body{
  #                           background-image: url(https://i.imgur.com/MlVn5Of.jpg);
  #                           }"))
  #             ,tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css"))),
	  
	  mainPanel(
	    

	    
	  tabsetPanel(
	  
	  
        tabPanel("User",
              hr(),   
              fluidPage(   
              #
              sidebarLayout(fluid=TRUE,
                #choices=list("Heard","Not Heard","Gimme All, man!")
                sidebarPanel(
                  textInput(inputId="UserName", label= "User Name", value = "U1"),
                  selectInput(inputId="className", label="Mood", choices=list("Dinner","Sleep","Party","Workout")),
                  radioButtons(inputId="Song_played", label = "You Know this", choiceNames = list(
                    "Heard",
                    "Not Heard"
                  ),
                  choiceValues = list(
                    1, 0 
                  )),
				          actionButton("user_Button", label = "Schneiderize!",
                                                  style="color: #fff; background-color: #337ab7; border-color: #2e6da4") # action button
                  #submitButton("Click for Top 5", icon("refresh"))
                  
                ),
                
                mainPanel(
                  #textOutput('prob'),
                  fluidRow(
                     # box(
                     #   title = "Your customized playlist",
                     #   #status = "primary",
                     #   background = "aqua", 
                     #   height = 320,
                     #   width = 12,
                         tableOutput("Top5")
                     #   tags$style(type="text/css", "#view tr:last-child {font-weight:bold;}")
                    # )
                    
                  )
                )
              ))
              #
				 
				 ), 
				 
				 
				 
        tabPanel("Enterprise",
                 hr(),
                 fluidPage(
                   sidebarLayout(
                     sidebarPanel(
                       fluidRow(
                         textInput.typeahead(id="Region",
                                             placeholder="Country Name",
                                             local=data.frame(country=c(country_list)),
                                             valueKey = "country",
                                             tokens=c(1:length(country_list)),
                                             template = HTML("<p class='repo-language'>{{info}}</p> <p class='repo-name'>{{country}}</p><style>h1 {color:red;}p {color:DarkSlateBlue;}</style>")
                         )),
                       br(),
                       br(),
                       sliderInput("acousticness", "acousticness",
                                   min = 0, max = 1, value = 0.5,
                                   ticks = FALSE, round = TRUE, step = 0.01),
                       sliderInput("danceability", "danceability",
                                   min = 0, max = 1, value = 0.5,
                                   ticks = FALSE, round = TRUE, step = 0.01),
                       sliderInput("speechiness", "speechiness",
                                   min = 0, max = 1, value = 0.5,
                                   ticks = FALSE, round = TRUE, step = 0.01),
                       sliderInput("energy", "energy",
                                   min = 0, max = 1, value = 0.5,
                                   ticks = FALSE, round = TRUE, step = 0.01),
                       sliderInput("liveness", "liveness",
                                   min = 0, max = 1, value = 0.5,
                                   ticks = FALSE, round = TRUE, step = 0.01),
                       actionButton("producer_Button", label = "Schneiderize!")
                     ),
                     mainPanel(
                       dataTableOutput('song_attributes'),			 
                       tableOutput('estimated_length'),
                       fluidRow(
                         # box(
                         #   title = "Track Lifecycle",
                         #   #status = "primary",
                         #   background = "aqua",
                         #   height = 320,
                         #   width = 12,
                           plotOutput("plotPut",width="100%")
                          #  tags$style(type="text/css", "#view tr:last-child {font-weight:bold;}")
                         # )
                         )
                       
                     )
                   )
                 ),
                 
                 
                 hr()
                  # action button,
				 
				 ) 
      
	  
	  
	  )
	)
 )
)
    





# shinyUI(fluidPage(
  
  # titlePanel("YAAA - your song usher"),
  
  # # sidebarLayout(
    # # sidebarPanel(
      # # numericInput('stockprice','Stock Price',100),
      # # numericInput('strike','Strike Price',100),
      # # sliderInput('maturity','Maturity (years)',min=0.1,max=10,value=1,step=0.01),
      # # sliderInput('volatility','Volatility',min=0.1,max=0.9,value=0.15,step=0.01),
      # # sliderInput('riskfreerate','Risk free rate',min=0.0,max=0.5,value=0.01,step=0.01),
      # # sliderInput('divrate','Dividend rate',min=0.0,max=0.25,value=0.01,step=0.01),
      # # hr(),
      # # p('Please refer to following for more details:',
        # # a("Black-Scholes (1973)", 
          # # href = "https://en.wikipedia.org/wiki/Black%E2%80%93Scholes_model")),
      # # hr()
    # # ),
  
    # # mainPanel(
      # # p('Call price'),
      # # textOutput("BScall"),
      # # hr(),
      # # p('Put price'),
      # # textOutput("BSput"),
      # # hr(),
      # tabsetPanel(
        # tabPanel("Calls", plotOutput("plotCall",width="100%")), 
        # tabPanel("Puts", plotOutput("plotPut",width="100%")) 
      # )
    # )
  # )  
# ))
