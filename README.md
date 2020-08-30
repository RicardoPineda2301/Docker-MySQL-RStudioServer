# Shiny-Docker
A continuación encontrará una guía de como instalar dos contenedores de docker; uno de RStudio, y otro de MySQL, así como una guía de como conectarlos para que se puedan comunicar entre ellos.

## Docker

Lo primero que debe de tener instalado en su máquina es Docker. Si ya lo tiene instalado, puede pasar a la siguiente sección.

### Windows Professional

Si su sistema operativo es Windows professional, refierase a esta guía de instalación: [guía](https://docs.docker.com/docker-for-windows/)

### Windows Home

Si su sistema operativo es Windows Home, refierase a esta guía de instalación: [guía](https://docs.docker.com/docker-for-windows/install-windows-home/)

### MacOS

Si su sistema operativo es Mac OS, refierase a esta guía de instalación: [guia](https://docs.docker.com/docker-for-mac/install/)

### Debian o Debian-Based

Si su sistema operativo es, o está basado en Debian, abra una terminal y escriba:

````
sudo apt-get update
sudo apt-get install docker.io
````

## Jalar los Containers

Si usted solamente desea tener los contenedores y hacer la conexión para probarlos sin tener que hacer todo el proceso desde 0, tiene la opción de jalar cada uno individualmente con los siguientes pasos:

1. Abra una terminal en una máquina que tenga Docker instalado

2. Para jalar el contenedor de RStudio, ejecute el comando:

```
docker pull sebpineda23/rstudio
```

3. Para jalar el contenedor de MySQL, ejecute el comando:

````
docker pull sebpineda23/mysql
````

Por otro lado, si desea hacer todo el proceso de instalación desde 0, siga los siguientes pasos:

## R Studio

Para levantar el contenedor de RStudio, referirse a [esta guia, ](https://github.com/RicardoPineda2301/Shiny-Docker/tree/master/RStudio) en donde encontrará el procedimiento paso a paso de como hacerlo, así como el Dockerfile y demás recursos necesarios para hacerlo.

## MySQL

Para levantar el contenedor de MySQL, referirse a [esta guia, ](https://github.com/RicardoPineda2301/Shiny-Docker/tree/master/MySQL) en donde encontrará el procedimiento paso a paso de como hacerlo.

## Conexión

Si ya tiene los dos contenedores listos en su máquina, puede pasar al siguiente paso: la conexión de ellos. Para hacerlo, seguir estos pasos:

1. uno

2. dos

3. tres
