/*Ejercicio 6:
Escribir un script que muestre la posición de la primera vocal de un texto introducido por
teclado.Por ejemplo: perro = “e” es la letra Nº2 ; árbol = “a” es la letra Nº1.
*/

var vocal = ["a","e","i","o","u"]
var texto, textoaux, aux, i, j

var texto = prompt("por favor ingrese una palabra a verificar", "...")
textoaux = texto.toLowerCase()

/* uso para chequear que me conviritió todo a miniusculas
console.log (textoaux)
*/

aux=-1
for (i=0; i<textoaux.length; i++) {
    for (j=0; j<vocal.length; j++) {
        if (vocal[j]===textoaux.charAt(i)) {
            aux = i
                                            /*uso para ver que valores me almacena y que dato es (para ejecutarlos debo sacarlos de los comentarios)
            console.log (aux) 
            console.log(vocal[j])
            console.log(textoaux.charAt(i))
                                            */
            break                           //como quiero econtrar solo la primera coincidencia, coroto el proceso al encontrar
        }
    }
    if (aux !== -1) {
        console.log ("***CONCIDENCIA***")   //Aviso que encontró una coincidencia y uso la misma variable "aux" como bandera   
        break                               //corto el bucle para que no siga buscando ya que encontró la coincidencia          
    }

}
console.log ("La primera vocal encontrada en "+ texto +" es la '"+ vocal[j] + "' y es la letra numero "+ (aux+1) +" dentro de la palabra"  )
console.log ("fin")
