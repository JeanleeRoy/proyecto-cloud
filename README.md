# proyecto-cloud

Aplicación usando Exprees.js, Node.js y MongoDB

## Funcionalidad

El usuario selecciona una imagen, agrega un comentario y se guarda en su lista personal.

![App](app.gif)

Elegimos esta aplicación porque cuenta con los componentes de backend, frontend y una base de datos que ayuda a persistir la información brindada por un usario. 

Considerando lo anterior, las características que se pueden integrar a esta aplicación son la escalabilidad, el monitoreo, el stateless, resiliencia y confiabilidad.

## Ejecución

Para correr la aplicación localmente debe de tener MongoDB y NPM instalados en su computador.

Una vez instalados debe copiar el repositorio y descargar las dependencias medinate el siguiente comando

    git clone https://github.com/JeanleeRoy/proyecto-cloud
    cd proyecto-cloud
    npm install

Para levantar la aplicación debe ejecutar el siguiente comando

    npm run start

La aplicación estará en la siguiente ruta http://localhost:3000
