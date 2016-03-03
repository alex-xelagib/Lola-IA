# NORMALIZACION DE ENTRADA
## Conceptos
frecuencia de muestreo es el número de muestras por unidad de tiempo que se toman de una señal continua para producir una señal discreta, durante el proceso necesario para convertirla de analógica en digital. Como todas las frecuencias.

### Efecto aliasing
Si se utiliza una frecuencia menor a la establecida por el teorema de Nyquist, se produce una distorsión conocida como aliasing; algunos autores traducen este término como solapamiento

### Filtro antialiasing
los sistemas de digitalización incluyen filtros PASO BAJO, que eliminan todas las frecuencias que sobrepasan la frecuencia crítica (la que corresponde a la mitad de la frecuencia de muestreo elegida) en la señal de entrada. Es decir, todas las frecuencias que queden por encima de la frecuencia máxima a muestrear seleccionada, son eliminadas

### Espectro de Frecuencia
El espectro de frecuencia se caracteriza por la distribución de amplitudes para cada frecuencia de un fenómeno ondulatorio (sonoro, luminoso o electromagnético) que sea superposición de ondas de varias frecuencias.

### Análisis espectral
se refiere a la acción de descomponer algo complejo en partes simples o identificar en ese algo complejo las partes más simples que lo forman. Como se ha visto, hay una base física para modelar la luz, el sonido o las ondas de radio en superposición de diferentes frecuencias. Un proceso que cuantifique las diversas intensidades de cada frecuencia

### Trasformada de Furiel
la señal puede ser concebida como la transformada de Fourier de la amplitud  A=A(v). que es el análisis  para pequeños intervalos de tiempo, o menos frecuentemente para intervalos largos, o incluso puede realizarse el análisis espectral de una función determinista teniendo la subida y bajada de cada pedaso de la onda.

## Normalizacion
La idea basica es realizar una trasformada a la onda de entrada a modo que tengamos los "picos" en donde la onda esta en un determinado tiempo, (figura 1, carpeta: Entrada(modificada))

Si tenemos el audio inicial "HOLA" (carpeta: Entrada(Original) audio original) debemos de aplicar un filtro ANALOGICO .

Este filtro se caracteriza por permitir el paso de las frecuencias más bajas  y atenuar las frecuencias más altas De la teoría se obtiene que los filtros están caracterizados por sus funciones de transferencia.

Por lo tanto tenemos ya con las ondas de nuestro audio "HOLA" Imagen: "audio-HOLA" (carpeta: Entrada(Original))

y le aplicamos la funcion de  transferencia de un filtro pasa bajo de primer orden que  corresponde a
H(s)=      1
        -- -- --
         1 + S
             --
             Wc

Esta funcion de trasferencia determina el comportamiento del filtro  donde Wc, corresponde a la frecuencua de corte propia del filtro.


Por que el resultado de esta tendremos el  ANALISIS ESPECTRAL de nuestro uadio (figura 2, carpeta: Entrada(modificada))

Con la ayuda del programa Sound Forge 9,1 podemos encontrar el tamaño en la que crece y decrese la onda analizada por lo que tenemos los valores de un simple "hola" para poder aplicar la normalizacion
