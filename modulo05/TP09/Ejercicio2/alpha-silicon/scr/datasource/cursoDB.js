const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Curso Conectada correctamente");
    }
});
//fin de conexion db

var cursoDb = {};

//Query para listar todos los cursos
cursoDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM cursos where estado >=1", function (err, result, fields) {
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

////Query para listar curso identificado por un id
cursoDb.getByidcurso = function (idcurso,funCallback) {
    connection.query("SELECT * FROM cursos WHERE idcurso=?",idcurso, function (err, result, fields) {
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
                    message: "No se encontro el curso"
                });
            }
            
        }
    });
}

//////Query para crear curso
cursoDb.create = function (cursos, funCallback) {
    var query = 'INSERT INTO cursos (nombre,descripcion) VALUES (?,?)'
    var dbParams = [cursos.nombre, cursos.descripcion];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe el curso con el nombre ${cursos.nombre}`,
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
                message: `Se creo el curso ${cursos.nombre} ${cursos.descripcion}`,
                detail: result
            });
        }
    });
}


/**
 * 
 * @param {*} idcurso 
 * @param {*} cursos 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */

////////Query para modificar curso identificando por su id
cursoDb.update = function (idcurso, cursos, funCallback) {
    var query = 'UPDATE cursos SET nombre = ?, descripcion = ?, estado = ? WHERE idcurso = ?'
    var dbParams = [cursos.nombre, cursos.descripcion, cursos.estado, idcurso];
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
                    message: `No se encontro el curso ${idcurso}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el curso ${cursos.idcurso} ${cursos.nombre}`,
                    detail: result
                });
            }
        }
    });

}

// ////////Query para Eliminar fiscamente de la bases de datos un curso identificando por su id
// cursoDb.delete = function(idcurso,funCallback){
//     var query = 'DELETE FROM cursos WHERE idcurso = ?'
//     connection.query(query, idcurso, function (err, result, fields) {
//         if (err) {
//             funCallback({
//                 message: "Surgio un problema, contactese con un administrador. Gracias",
//                 detail: err
//             });
//             console.error(err);
//         } else {
//             if (result.affectedRows == 0) {
//                 funCallback(undefined,{
//                     message: `No se encontro el curso ${idcurso}`,
//                     detail: result
//                 });
//             } else {
//                 funCallback(undefined,{
//                     message: `Se elimino el curso ${idcurso}`,
//                     detail: result
//                 });
//             }
//         }
//     });
// }

//////////Query para Eliminar logicamente un curso identificando por su id
cursoDb.logdelete = function (idcurso, funCallback) {
    connection.query("UPDATE cursos SET estado = 0 WHERE idcurso = ?",idcurso, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idcurso} del curso`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se desactivo el curso con el id ${idcurso}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = cursoDb;
