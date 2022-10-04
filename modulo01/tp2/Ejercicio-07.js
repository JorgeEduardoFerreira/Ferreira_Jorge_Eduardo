/*Ejercicio 7:
Escribir una función que reciba un texto y lo devuelva al revés.
*/

var texto = prompt("Ingrese un texto para ser revertido su orden"," ")
var revertido = alreves(texto)
console.log (revertido)

function alreves(estetexto) {
    return estetexto.split("").reverse().join("")   //la funcion split separa cada caracter en un elemento de un array
                                                    //la funcion reverse ordena el los elementos del array alreves
                                                    //la funcion join une los elementos de un array fomrando una cadena
}
