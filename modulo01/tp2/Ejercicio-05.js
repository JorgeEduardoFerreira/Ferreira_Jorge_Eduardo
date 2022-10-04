/*Ejercicio 5:
Crear una función que muestre información sobre una cadena de texto que se le pasa como
argumento. A partir de la cadena que se le pasa, la función determina si esa cadena está
formada sólo por mayúsculas, sólo por minúsculas o por una mezcla de ambas.
*/

var texto
texto = prompt ("ingrese un texto por favor","...")
console.log ("el texto " +MayusMinus(texto)) //llamo a la funcion MayusMinus directamente dentro del console.log

function MayusMinus(texto) {
    //comparo el texto ingresado con el texto ingresado pasado todo a mayusculas
    if (texto === texto.toUpperCase()) {
        resultado = "está formado solo por Mayúsculas"
    }
    //comparo el texto ingresado con el texto ingresado pasado todo a minusculas
    else if (texto === texto.toLowerCase()) {
        resultado = "está formado solo por Minúsculas"        
    }
    //si no es mayusculas y no es minusculas, por descarte es combinado
    else {
        resultado = "está compuesto por ambos, mayúsculas y minúsculas"
    }
    
return resultado
}
