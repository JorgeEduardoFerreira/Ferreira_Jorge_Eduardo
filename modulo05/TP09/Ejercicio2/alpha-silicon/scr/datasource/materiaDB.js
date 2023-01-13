const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Materias Conectada correctamente");
    }
});
//fin de conexion db

var materiaDb = {};

// Query para listar las Materias
materiaDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM materias where estado >=1", function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            funCallback(undefined, result);
        }
    });
}

//-- Query para listar una Materia por su id
materiaDb.getByIdmateria = function (idmateria,funCallback) {
    connection.query("SELECT * FROM materias WHERE idmateria=?",idmateria, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if(result.length>0){
                funCallback(undefined, result[0]);
            }else{
                funCallback({
                    message: `No se encontro la materia con el ID ${idmateria}`
                });
            }
            
        }
    });
}

//--// Query para crear las materias
materiaDb.create = function (materia, funCallback) {
    var query = 'INSERT INTO materias (nombre, objetivo, plan_estudio) VALUES (?,?,?)'
    var dbParams = [materia.nombre, materia.objetivo, materia.plan_estudio];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la materia con el nombre ${materia.nombre}`,
                    detail: err
                });
            }else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo la materia ${materia.nombre} ${materia.objetivo}`,
                detail: result
            });
        }
    });
}


/**
 * 
 * @param {*} idmateria 
 * @param {*} materia 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */

//--//-- Query para Actualizar datos de una materia identificando por su id
materiaDb.update = function (idmateria, materia, funCallback) {
    var query = 'UPDATE materias SET nombre = ?, objetivo = ?, plan_estudio = ?, estado = ? WHERE idmateria = ?'
    var dbParams = [materia.nombre, materia.objetivo, materia.plan_estudio, materia.estado, idmateria];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro la materia con el ID ${idmateria}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la materia con el ID ${idmateria} y nombre ${materia.nombre}`,
                    detail: result
                });
            }
        }
    });

}

// //--//--// Query para eliminar fisicamente de una materia identificando por su id
// materiaDb.delete = function(idmateria,funCallback){
//     var query = 'DELETE FROM materias WHERE idmateria = ?'
//     connection.query(query, idmateria, function (err, result, fields) {
//         if (err) {
//             funCallback({
//                 message: "Surgio un problema, contactese con un administrador. Gracias",
//                 detail: err
//             });
//             console.error(err);
//         } else {
//             if (result.affectedRows == 0) {
//                 funCallback(undefined,{
//                     message: `No se encontro la materia con el ID ${idmateria}`,
//                     detail: result
//                 });
//             } else {
//                 funCallback(undefined,{
//                     message: `Se elimino la materia con el ID ${idmateria}`,
//                     detail: result
//                 });
//             }
//         }
//     });
// }

//--//--//-- Query para eliminar lógicamente la materia identificando por su id modificando su estado a 0
materiaDb.logdelete = function (idmateria, funCallback) {
    connection.query("UPDATE materias SET estado = 0 WHERE idmateria = ?",idmateria, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            }); 
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro el ID  ${idmateria} en materias`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se desactivó la materia con el ID ${idmateria}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = materiaDb;