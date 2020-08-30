# MySQL

### Guía de instalación

1. El primer paso es crear una nueva carpeta con el nombre de su preferencia.

2. Descargar el Dockerfile y el script llamado "load_data.sql" desde este mismo repositorio y ponerlas en la carpeta que creó en el paso anterior.

3. Abrir una terminal y navegar hasta esa carpeta.

4. Ejecutar el siguiente comando:

````
docker build -t [Nombre que le quiera dar] .
````

5. Ahora que ya tiene el contenedor en su máquina, solo queda ejecutarlo. Para eso poner el siguiente comando desde su terminal:

````
docker run --name db -p 3306:3306 -d [Nombre que le haya puesto] --secure-file-priv=/home/parcial
````

6. El contenedor ya está corriendo, para asegurarse de ello, puede correr el siguiente comando:

````
Docker exec -it [Nombre que le haya puesto] “bash”
````

7. Si se ejecutó correctamente, tendrá acceso a todo el contenedor. El contenedor corre en Linux por lo que todos los comandos Unix funcionan.

8. Para probar la base de datos, siga los siguientes pasos:

      a. Siempre dentro del bash, ejecute el siguiente comando:
      
      ````
      Mysql -uricardo -ppass
      ````
      
      **Nota:** El usuario default es ricardo, y la contraseña default es pass, pero si se lo cambió en el Dockerfile, será distinto aquí también.
      
      b. Para ver que la base de datos exista, ejecute el siguiente comando:
      
      ````
      Show databases;
      ````
      
      c. Si la base de datos "Parcial1_dp" aparece, está corriendo correctamente y puede seleccionarla y trabajar en ella como con cualquier base de datos. 
