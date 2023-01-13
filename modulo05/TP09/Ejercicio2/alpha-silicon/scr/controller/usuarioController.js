require("rootpath")();
const express = require('express');
const app = express();

const userDB = require("../datasource/userDB.js");


app.get('/', getAll);

app.get('/:idusuario', getByIdusuario);

app.post('/', create);

app.put('/:idusuario', update);

// app.delete('/del/:idusuario', eliminar);

app.delete('/:idusuario', eliminacionlogica);

// Metododo para listar todos los usuarios
function getAll(req, res) {
    userDB.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
//// Metodo para buscar usuario por su id
function getByIdusuario(req, res) {
    userDB.getByIdusuario(req.params.idusuario,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

////// Metodo para agregar Usuarios
function create(req, res) {
    userDB.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

//////// Metodo para modificar Usuarios identificando por su id
function update(req, res) {
    userDB.update(req.params.idusuario, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// ////////// Metodo par eliminar fisicmente usuario de la base de datos identificando por id
// function eliminar(req, res) {
//     userDB.delete(req.params.idusuario,  function (err, result) {
//         if (err) {
//             res.status(500).send(err);
//         } else {
//             if (result.detail.affectedRows == 0) {
//                 res.status(404).json(result);
//             } else {
//                 res.json(result);
//             }
//         }
//     });
// }

////////////// Metodo par eliminar usuario indentificando por su id cambiando el estado a 0
function eliminacionlogica(req, res) {
    userDB.logdelete(req.params.idusuario, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;