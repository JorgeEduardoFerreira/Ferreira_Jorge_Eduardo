/*Ejercicio 2:
Completar las condiciones de los if del siguiente script para que los mensajes se muestren
siempre de forma correcta:
var num1 = 3;
var num2 = 7;
if(...) {
console.log("num1 no es mayor que num2");
}
if(...) {
console.log("num2 es positivo");
}
if(...) {
console.log("num1 es negativo o distinto de cero");
}
if(...) {
console.log("Incrementar en 1 unidad el valor de num1 no lo hace mayor o igual que
num2"); }
*/

var num1 = 3;
var num2 = 7;
if (num1<num2) { //si numero 1 es menor q cero imprime
console.log("num1 no es mayor que num2");
}
if (num2>0) { //si numero 2 mayor que 0 imprime
console.log("num2 es positivo");
}
if (num1<0 || num1!=0) { //si numero 1 es menor que 0
console.log("num1 es negativo o distinto de cero");
}
if(num2>= num1+1) {  // si numero dos es mayor o igual a numero 1 + 1 imprime  
    console.log("incrementar en 1 unidad el valor de num1 no lo hace mayor o igual que num2")
}
