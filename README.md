# proyecto-cloud

|  **#** | **Código** | **Apellidos, Nombre** |
| :---: | :---: | :---: |
|  1 | 201810112 | Bacigalupo, Renato|
|  2 | 201810554 | Barreto Zavaleta, Jeanlee |

## Knote

Aplicación que usa Exprees.js, Node.js y MongoDB

## Funcionalidad

El usuario selecciona una imagen, agrega un comentario y se guarda en su lista personal.

![App](app.gif)

Elegimos esta aplicación porque cuenta con los componentes de backend, frontend y una base de datos que ayuda a persistir la información brindada por un usario. 

Considerando lo anterior, las características que se pueden integrar a esta aplicación son la escalabilidad, el monitoreo, el stateless, resiliencia y confiabilidad.

## Ejecución

### Local

Para correr la aplicación localmente debe de tener MongoDB y NPM instalados en su computador.

Una vez instalados debe copiar el repositorio y descargar las dependencias medinate el siguiente comando

    git clone https://github.com/JeanleeRoy/proyecto-cloud
    cd proyecto-cloud
    npm install

Para levantar la aplicación debe ejecutar el siguiente comando

    npm run start

La aplicación estará en la siguiente ruta http://localhost:3000


## Contenerización de la aplicación

En esta sección vamos a empaquetar la aplicación en un contenedor Docker. En el `Dockerfile` se especifica la copia de los ficheros del programa hacia la imagen ubuntu (alpine) con Node.js instalado.

    FROM node:16.15.1-alpine3.16
    COPY . .
    RUN npm install
    CMD [ "node", "index.js" ]

El siguiente comando se utilza para construir la imagen de la aplicación Knote considerando el Dockerfile previo

    docker build -t knote .

### Corriendo en Docker

Para la base de datos podemos correr MongoDB como un conenedor de Docker. Pero antes de eso debemos establecer la conexión entre ambos contenedores (el de `knote` y el de `mongo`).

El siguiente comando nos ayuda a crear un Docker Network para estos contenedores:

    docker network create knote

Ahora solo queda correr MongoDB con:
    
    docker run -d --name=mongo --network=knote mongo

Y el siguiente comando es para la aplicación Knote:

    docker run --name=knote --network=knote -p 3000:3000 \
        -e MONGO_URL=mongodb://mongo:27017/dev knote

> Aquí puedes reemplazar la imagen local `knote` por una ya subida a Docker Hub `jeanlee23/knote-js`

Algo a destacar es que para la variable de entorno `MONGO_URL` el valor del hostname es `mongo`, precisamente este es el nombre que se le asigno al contenedor MongoDB mediante el flag `--name=mongo`


AquAhora la aplicación corriendo en Docker es accesible desde la ruta http://localhost:3000/

## Kubernetes

Para crear un cluster kubernetes se requiere la instalación de Minikube y kubectl (este último necesita de un hipervisor, lo más común es usarlo con VirtualBox).

Con Minikube instaldo, puedes crear el clúster con el siguiente comando:

    minikube start --vm

Con el comando completado, puedes verificar que el cluster está creado con:

    kubectl cluster-info

Para hacer el deploy en el clúster de kubernetes utiliza el siguiente comando:

    kubectl apply -f kubernetes

El comando manda todos los archivos YAML del directorio `kubernetes`

Para acceder a la aplicación desplegada utiliza el siguiente comando:

    minikube service knote --url
