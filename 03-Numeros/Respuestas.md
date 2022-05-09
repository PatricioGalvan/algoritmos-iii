# Preguntas

## Aporte de los mensajes de DD
### En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

Cada uno de los llamados aporta una de las 2 mitades para conocer el tipo de objeto con el que se está interactuando (primero de self y luego de su colaborador).

Por ej en este TP cuando hago double dispatch para la suma, si hiciera 1 + 1/5, con la implementacion original estaria haciendo 'a un objeto de la clase Entero, sumale algo'.
Con DD, el segundo llamado identifica a 1/5 como un objeto perteneciente a la clase Fraccion, y ahora estamos diciendo 'un objeto de la clase Fraccion tiene que ser sumado a un objeto de la clase Entero'.

<br/>

## Lógica de instanciado
### Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La lógica de cómo instanciar un objeto nos parece mejor tenerla en métodos de clase propios a la clase, para que sea la misma clase quien sepa crear instancias de si misma.
Cuando se crea el objeto desde diferentes lugares y formas, lo resolvimos dejandole esa responsabilidad a la superclase (Entero) de decidir a cual subclase pertenece lo que estamos intentando instanciar.

<br/>

## Nombres de las categorías de métodos
### Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Utilizamos dos tipos de categorias: publicas y privadas. Las categorias publicas pueden ser utilizadas por fuera de la clase (por ej en los tests), y las agrupamos por nombres que describan lo que hacen los metodos.
Luego estan las categorias privadas, que las creamos para dejar constancia que esos metodos son para ser utilizados unicamente por otros metodos de la misma clase y no por fuera de la misma.

<br/>

## Subclass Responsibility
### Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Dejamos ese mensaje para indicar que las subclases de ese objeto son quienes se tienen que encargar de la implementación de ese método.
Los métodos igual funcionan aunque la superclass no tenga el mensaje 'self subclassResponsitility' (nos pasó en un método que nos olvidamos de agregarlo), pero igualmente debería ir siempre como buena práctica.

Por ej si el día de mañana creo una nueva subclase de Número, y a esta subclase me olvido de crearle la implementación a un mensaje que Número ya tiene como 'subclassResponsibility', me va a saltar el error indicando que la subclase debería ser la responsable de la implementación.

<br/>

## No rompas
### ¿Por qué está mal/qué problemas trae romper encapsulamiento?

Porque al romper el encapsulamiento se está accediendo al 'como' se realizan las cosas, y lo unico que tiene que importar es el 'que'.
