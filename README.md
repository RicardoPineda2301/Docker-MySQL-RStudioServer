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

3. Para ejecutar el contenedor de RStudio, es importante que lo ejecute de la siguiente manera:

````
docker run --rm -p 8787:8787 -e PASSWORD=contraseña_a_su_disposicion sebpineda23/rstudio
````

4. Para entrar a su instancia de RStudio, abra un browser y coloque: 127.0.0.1:8787

**Nota:** El usuario default es "Rstudio" y la contraseña es la que especificó en el comando anterior.

5. Para jalar el contenedor de MySQL, ejecute el comando:

````
docker pull sebpineda23/mysql
````
6. Para ejecutar el contenedor de MySQL, es importante que lo ejecute de la siguiente manera:

````
docker run --name db -p 3306:3306 -d sebpineda23/mysql --secure-file-priv=/home/parcial
````
Por otro lado, si desea hacer todo el proceso de instalación desde 0, siga los siguientes pasos:

## R Studio

Para levantar el contenedor de RStudio, referirse a [esta guia, ](https://github.com/RicardoPineda2301/Shiny-Docker/tree/master/RStudio) en donde encontrará el procedimiento paso a paso de como hacerlo, así como el Dockerfile y demás recursos necesarios para hacerlo.

## MySQL

Para levantar el contenedor de MySQL, referirse a [esta guia, ](https://github.com/RicardoPineda2301/Shiny-Docker/tree/master/MySQL) en donde encontrará el procedimiento paso a paso de como hacerlo.

## Conexión

Si ya tiene los dos contenedores listos en su máquina, puede pasar al siguiente paso: la conexión de ellos. Para hacerlo, seguir estos pasos:

1. Asegurese de que los dos contenedores esten corriendo. Para hacerlo puede correr el siguiente comando y verificar que ambos contenedores salgan como output:

````
docker ps
````

2. Si los dos contenedores están activos, el siguiente paso es crear una conexión. Para eso ejecutamos el siguiente comando:

````
conex
````

3. tres
