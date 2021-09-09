#  Author
Nestor Alfonso Sánchez Jacobo

# Summary

La aplicación muestra un listado de peliculas con su información general y especifica la cual a su vez, cuenta con la funcionalidad de mostrar el trailer de la pelicula seleccionada.

La aplicación realiza peticiones al Api themoviedb, que nos proporciona las peliculas con las categorías, playing now y popularity, cuando el dispositivo no cuenta con una conexión a internet muestra una alerta con la leyenda antes mencionada.

Cuando el dispositivo se conecta a internet se realizan las peticiones y se guardan los datos de manera local para que si posteriormente ingresa a la aplicación sin conexión a internet se le muetren los datos previamente consumidos.

La aplicación cuenta con un switch que permite cambiar de categoría

# Install dependencies (CocoaPods)

Para poder configurar la aplicación por primera vez es necesario ejecutar el siguiente comando
- pod install

## Dependencies (CocoaPods)

- Alamofire
- Kingfisher
- RealmSwift
- SkeletonView

## Notes
Tareas no concluidas

- Mejorar el diseño de la aplicación
- Colocar un loader o skeleton al cargar los datos en la respuesta del Api
- Guardar detalles especificos en base de local (Realm)
- Agregar un buscador que funcione tanto para la base de datos local como para la respuesta recibida por el Api.
    Realizando la busqueda por el parametro enviado desde el textfield en una funcion filter aplicado al arreglo de peliculas.
