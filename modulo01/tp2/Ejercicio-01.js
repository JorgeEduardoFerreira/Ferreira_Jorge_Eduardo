/*TP2 Ejercicio 1 
A partir del siguiente array que se proporciona: var valores = [verdadero, false, 2, "hola",
"mundo", 3, char];
1. Determinar cuál de los elementos de texto es mayor, es decir el que contenga más
letras.
2. Imprimir los elementos de menor a mayor cantidad de letras.
3. Determinar el resultado de las cuatro operaciones matemáticas realizadas con los dos
elementos numéricos.
*/

var verdadero, char, i; 
//Declaro las variables para que no me tire error y luego le asigno ell contenido de la variable su mismo nombre en string. 
verdadero = "verdadero"
char = "char"

var valores = [verdadero, false, 2, "hola",
"mundo", 3, char];
var strings = [] //declaro para alamcenar los string
var numeros = [] //declaro para almacenar posiciones de numeros

console.log ("ESTE ES EL VECTOR 'strings' DE SOLO LOS ELEMENTOS STRING EXTRAIDOS DEL VECTOR 'valores'")
for (let i = 0; i < valores.length; i++) {
  //**console.log (typeof (valores[i]))** muestra en consola el tipo de elemento que es
  if (typeof (valores[i])==="string"){
    console.log (valores[i])
    strings.push (valores[i])
  }
}
console.log ("") //uso esto solo para dejar un renglon vacio en la consola para que no se mezclen los datos
console.log ("ESTE ES EL VECTOR CON LA CANTIDAD DE LETRAS QUE TIENE CADA ELEMENTO DEL VECTOR 'strings'")
for ( i = 0; i<strings.length; i++) {
   console.log (strings[i] +" = " +strings[i].length)
   /*Referencias: https://www.freecodecamp.org/espanol/news/ordenar-arreglos-en-javascript-como-usar-el-metodo-sort/
   https://www.youtube.com/watch?v=rfewUSHLymw
   */
}
console.log ("")
console.log ("ESTE ES EL VECTOR 'string' DE SOLO LOS ELEMENTOS STRING ORDENADOS DE MENOR A MAYOR")
//Ordeno el array "strings" de menor a mayor y luego lo muestro en consola
strings.sort ( (a,b) =>{
  if(a == b) {
    return 0; 
  }
  if(a < b) {
    return -1;
  }
  return 1;
});
for (i = 0; i<strings.length; i++)
console.log (strings[i])
console.log ("")
if (strings.length==i) {
  console.log ("el elemento con mayor cantidad de caracteres en el array es la palabra = '"+strings[i-1] +"'")
}
for (i = 0; i<valores.length; i++) {
    if (typeof (valores[i])==="number") {
        numeros.push (valores[i])
    }
}
console.log (numeros) //imprimo el array de numeros
for (i = 0; i<(numeros.length)-1; i++) {
    console.log ("la suma de " +numeros[i] +" + " +numeros[i++] +" es = " +numeros[i]+numeros[i++]) 
}
