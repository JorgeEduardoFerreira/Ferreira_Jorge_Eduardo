/*Ejercicio 4:
Escribir el código de una función a la que se pasa como parámetro un número entero y
devuelve como resultado una cadena de texto que indica si el número es par o impar. Mostrar
por pantalla el resultado devuelto por la función.
Por ejemplo 2=par; 5=impar...
*/


var N_ing, resultado
N_ing = prompt ("ingrese un número Entero para evaluar si es par o impar", "...")
NumE= parseInt (N_ing)
resultado = ParImpar(NumE) //llamo a la función ParImpar
console.log ("el numero " +NumE+ " es " +resultado)
    
function ParImpar(NumE) {
    if (NumE % 2 == 0) {
        return "PAR"
    }
    else {
        return "IMPAR"
    }
}
