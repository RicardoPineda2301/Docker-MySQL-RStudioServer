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

1. Asegurese de que los dos contenedores esten detenidos. Para hacerlo puede correr el siguiente comando y verificar que ninguno de los contenedores salgan como output:

````
docker ps
````

2. Si los dos contenedores están inactivos, el siguiente paso es crear una conexión. Para eso ejecutamos el siguiente comando:

````
docker network create --driver bridge [Nombre que le quiera dar a la conexión]
````

3. Ahora que ya tenemos la conexión lista, levantamos ambos contenedores especificando la conexión.

4. Contenedor de MySQL:

````
docker run -it --network [Nombre que le haya puesto a la conexión] [Nombre de su contenedor de MYSQL]
````

5. Contenedor de RStudio:

````
docker run --network [Nombre que le haya puesto a la conexión] -p 8888:8888 -e PASSWORD=[Contraseña que quiera] [Nombre de su contenedor de RStudio]
````

6. Ahora que ambos contenedores están activos, hay que inspeccionar la conexión para ver que dirección le asigno de IPV4:

````
docker network inspect [Nombre que le haya puesto a la conexión]
````

Navegar hasta la parte más baja del output, verificar la dirección que tiene asignada **IPV4Address** y anotarla.

7. Ahora que ya tenemos la dirección asignada, nos vamos a nuestra instancia de RStudio en un browser, en 127.0.0.1:8888 y modificamos la parte de la conexión con la nueva dirección: 

````
db_user <- 'ricardo'
db_password <- 'pass'
db_name <- 'parcial1_dp'
db_table <- 'video_metadata'
db_host <- '172.19.0.2' # dirección de IPV4
db_port <- 3306

````
