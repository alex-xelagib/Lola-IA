# NORMALIZACION DE SALIDAS
## Comceptos
 El proceso de normalización de salidas es convier los valores finales del proceso del aprendisaje de la red neuronal en procedimientos ya establecidos para que se realice una accion.

 los resultados estaran definidos a partir de una serie de bit's lo cual hara que se conozca a la perfeccion la accion que debe de realizar

### Normalizacion
Con los datos de entrada definidos vamos a explicar los distintas salidas que tendra LOLA
la salidas de las redes neuronales las vamos a expresar como una cadena  de bit's por lo tanto
nuestro error esperado se basa en la siguiente tabla

1 0 0
0 1 0
0 0 1
1 1 1

Teniendo como base las siguientes procedimientos para la lista de respuesta

1 0 0  ---> al tener esta respuesta el programa reproducira un sonido (Ya grabado con anterioridad) de un saludo del programa LOLA

0 1 0  ---> al tener esta respuesta el programa abrira un programa, este programa estara defino a partir de la palabra de entrada (ejemplo: Python, Lola reconocera dicha palabra como una palabra exclusiva y al detectar que coincide con su aprendisaje abrira el programa "python.exe")

0 0 1 --> al tener esta respuesta el programa desplegara una imagen la cual estara dada a partir de un nombre ya conocido (ejemplo: Juan, lola reconocera dicha palabra exclusiva y abrira el explorador de imagen mostrando la imagen de juan)

1 1 1 --> este conjunto de bit's lo hemos definido como el "NO ENCONTRADO" que es cuando Lola no reconozca ningun tipo de comando exclusivo  asi sabremos con exactitud que no encontro nada.
