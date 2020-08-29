FROM obedaeg/rstudio-mysql

RUN R -e "install.packages(c('shinyWidgets', 'shinythemes', 'pool', 'shinydashboard', 'shinyjs', 'V8', 'lubridate', 'shiny', 'readr', 'DT', 'dygraphs', 'stringr', 'parsedate', 'rbokeh'))"

RUN mkdir -p /home/rstudio/parcial
WORKDIR /home/rstudio/parcial

COPY app.R/ /home/rstudio/parcial
COPY data/ /home/rstudio/parcial