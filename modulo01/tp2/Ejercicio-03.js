/*Ejercicio 3:
El factorial de un número entero positivo se define como el producto de todos los números
naturales anteriores o iguales a él. Es decir que multiplicando todos los factores n x (n-1) x (n-2)
x ... x 1. Por ejemplo: el factorial de 5 (escrito como 5!) es igual a: 5! = 5 x 4 x 3 x 2 x 1 = 120
Utilizando la estructura FOR, crear un script que pueda calcular el factorial de un número
entero.*/

var Ingr, NumE, Fact 
// delcaro variables

Ingr = prompt("Por favor ingrese un número Entero Positivo ===>>>","...")

while (Ingr < 0) { //condiciono a que el numero sea positivo o igual a 0
      Ingr = prompt("ERROR. Por favor ingrese un número Entero Positivo ===>>>","...")
      }

NumE= parseInt(Ingr) //tomo solo la parte entera del número ingresado

if (NumE === 0) {
      Fact = 1
      console.log ("El Factorial de " + NumE + " es igual a " + Fact)
}
else {
      Fact=NumE
      for (let i=NumE; i > 1 ; i--) { //calculo el factorial
      NumE--
      Fact = Fact * NumE
      }
      console.log ("El Factorial de " + (NumE=parseInt(Ingr)) + " es igual a " + Fact)
}
