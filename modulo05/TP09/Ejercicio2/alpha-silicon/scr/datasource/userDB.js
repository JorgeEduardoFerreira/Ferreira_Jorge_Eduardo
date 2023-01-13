const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Usuario Conectada correctamente");
    }
});
//fin de conexion db

var userDb = {};

// Query para listar los usuarios
userDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM usuarios where estado >=1", function (err, result, fields) {
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

//-- Query para listar un usuario por su id
userDb.getByIdusuario = function (idusuario,funCallback) {
    connection.query("SELECT * FROM usuarios WHERE idusuario=?",idusuario, function (err, result, fields) {
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
                    message: `No se encontro el usuario con el ID ${idusuario}`
                });
            }
            
        }
    });
}

//--// Query para crear los usuarios
userDb.create = function (usuario, funCallback) {
    var query = 'INSERT INTO usuarios (nickname,email,password) VALUES (?,?,?)'
    var dbParams = [usuario.nickname, usuario.email, usuario.password];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe el usuario con el nickname ${usuario.nickname}`,
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
                message: `Se creo el usuario ${usuario.nickname} ${usuario.email}`,
                detail: result
            });
        }
    });
}


/**
 * 
 * @param {*} idusuario 
 * @param {*} usuario 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */

//--//-- Query para Actualizar datos de un usuario identificando por su id
userDb.update = function (idusuario, usuario, funCallback) {
    var query = 'UPDATE usuarios SET nickname = ?, email = ?, password = ?, estado = ? WHERE idusuario = ?'
    var dbParams = [usuario.nickname, usuario.email, usuario.password, usuario.estado, idusuario];
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
                    message: `No se encontro el usuario ${idusuario}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el usuario ${usuario.idusuario} ${usuario.nickname}`,
                    detail: result
                });
            }
        }
    });

}

userDb.delete = function(idusuario,funCallback){
    var query = 'DELETE FROM usuarios WHERE idusuario = ?'
    connection.query(query, idusuario, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback(undefined,{
                    message: `No se encontro el usuario ${idusuario}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino el usuario ${idusuario}`,
                    detail: result
                });
            }
        }
    });
}


userDb.logdelete = function (idusuario, funCallback) {
    connection.query("UPDATE usuarios SET estado = 0 WHERE idusuario = ?",idusuario, function (err, result, fields) {
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
                    message: `No se encontro el usuario con el ID  ${idusuario}`,
                    detail: result
                }); 
            } else {
            //   console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la  el usuario con el ID ${idusuario}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = userDb;