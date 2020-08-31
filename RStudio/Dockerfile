FROM obedaeg/rstudio-mysql

# instala los paquetes necesarios
RUN R -e "install.packages(c('flexdashboard', 'shinyWidgets', 'shinythemes', 'pool', 'shinydashboard', 'shinyjs', 'V8', 'lubridate', 'shiny', 'readr', 'DT', 'dygraphs', 'stringr', 'parsedate', 'rbokeh'))"

# Crea un directorio para el parcial
RUN mkdir -p /home/rstudio/parcial
WORKDIR /home/rstudio/parcial

RUN chmod -R 777 /home/rstudio/parcial/

# Copia los scripts necesarios
COPY app.R/ /home/rstudio/parcial
COPY dashboards.Rmd/ /home/rstudio/parcial
