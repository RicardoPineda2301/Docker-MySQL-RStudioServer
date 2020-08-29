# RStudio

### Guía de instalación

1. El primer paso es crear una nueva carpeta con el nombre de su preferencia.

2. Descargar el Dockerfile, así como la carpeta "Data" desde este mismo repositorio y ponerlas en la carpeta que creó en el paso anterior.

3. Abrir una terminal y navegar hasta esa carpeta.

4. Ejecutar el siguiente comando:

````
docker build -t [Nombre que le quiera dar] -f Dockerfile .
````

5. Ahora que ya tiene el contenedor en su máquina, solo queda ejecutarlo. Para eso poner el siguiente comando desde su terminal:

````
docker run --rm -p 8787:8787 -e PASSWORD=contraseña_a_su_disposicion [El nombre que le dio al contenedor]
````

6. El contenedor ya está corriendo, para acceder a su instancia de RStudio, abra un browser y ponga 127.0.0.1:8787 o haga click [aqui](127.0.0.1:8787)
