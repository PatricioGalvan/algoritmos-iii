
### Sobre implementar funcionalidad

Los primeros tests no pasaron de una porque nuestra implementación para el test01 tenía hardcodeado que el metodo 'cantidadDeHuevosDeAvispas' devuelva un 0, por lo que el test 02 no pasaba.

Si desde el comienzo hubieramos pensado en la implementación que terminamos usando cuando llegamos al test03, hubieran pasado los 3 tests de una. Igualmente nos parece mejor implementar la funcionalidad avanzando por cada test 1 por 1, creemos que es mejor que confiar ciegamente en poder crear una solucion general para todo (que suele ser mas compleja y hay mas chances de equivocarnos).


### Sobre código repetido

Al comienzo nos quedó mucho código repetido, teniamos el mismo bloque de código para incrementar/reducir las cantidades de huevos y recursos.

En nuestro modelo el responsable de ver si hay suficientes recursos para dejar un huevo es el insecto, no el habitat. El método de intentarReproducirse revisa si la hay suficiente cantidad de recursos que consume la avispa (orugas, polillas u otros huevos) antes de poner un huevo.

Otra forma de implementarlo podría ser que el habitat tenga un metodo 'hayRecursosSuficientes' que diga si el insecto puede o no reproducirse. Creemos que es mejor que el insecto que va a consumir los recursos sea el responsable porque cada tipo de insecto consume distintos recursos.


### Sobre código repetido 2

Primero resolvimos guardar la cantidad de recursos (huevos, orugas, polillas) en un colaborador para cada recursos. Cuando terminamos y pasaban todos los tests, decidimos intentar refactorizar el código utilizando diccionarios.

Contemplamos la posibilidad de usar un único diccionario para huevos, orugas y polillas, pero nos pareció mejor utilizar 2 diccionarios: uno para huevos y otro para orugas/polillas. Esto fue para que a la hora de obtener la cantidad total de huevos se pueda sumar los valores del diccionario de huevos en vez de llevar registro del total de huevos en un contador aparte dentro del diccionario.
Se podría haber hecho menos si consideramos menos como una implementación más simple (como nuestra primera versión sin diccionarios). También pensamos en tomar a la avispa Lara como un objeto hijo de la avispa Oriana, pero no estabamos seguros si hubiera resultado en menos o no.