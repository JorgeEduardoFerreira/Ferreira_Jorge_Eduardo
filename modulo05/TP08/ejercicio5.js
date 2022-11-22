/*
Ejercicio 5
Crear un programa (ejercicio5.js) capaz de leer el archivo departamentos.json.
Luego recorrer e imprimir nombre + puesto de los empleados de tecnologia.
Al ejecutar node ejercicio5.js la salida en consola debería ser la siguiente:
Pablo Richmon PM
Marta Fernandez TechLead
Pedro Mendez FullStack js
*/

const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var departa = JSON.parse(rawdata);
// console.log (departa)

getNombreyPuesto (departa);

// console.log("----------");
// console.log(departa['departamentos'].length);
// console.log("-----***-----");
// console.log(departa['departamentos'][1].length);
// console.log(departa['departamentos'][1]['Tecnologia'].length);

function getNombreyPuesto (Array) { 
    for(var i=0;i<Array['departamentos'].length ; i++){
        //  console.log(Array['departamentos'].length);
        //  console.log(i);
        //  console.log(Array['departamentos'][i]);
        if (i==1) {       // EN VEZ DE 1 QUIERO COMPARAR SI DICE TECNOLOGIA  
            console.log(i);
            for(var j=0;j<Array['departamentos'][i]['Tecnologia'].length ; j++){
                //  console.log(j);
                //  console.log(Array['departamentos'][i]);
                console.log(Array['departamentos'][1]['Tecnologia'][j]['nombre'] + ' ' + Array['departamentos'][1]['Tecnologia'][j]['puesto'])
                };
                return;
            
        }
    };
}; 
