require("rootpath")();
const express = require('express');
const app = express();

const materiaDb = require("../datasource/materiaDB.js");


app.get('/', getAll);

app.get('/:idmateria', getByIdmateria);

app.post('/', create);

app.put('/:idmateria', update);

// app.delete('/del/:idmateria', eliminar);

app.delete('/:idmateria', eliminacionlogica);

// Metododo para listar todas las materias 
function getAll(req, res) {
    materiaDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

//-- Metodo para buscar Materia por su id
function getByIdmateria(req, res) {
    materiaDb.getByIdmateria(req.params.idmateria,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

//--// Metodo para agregar Materia
function create(req, res) {
    materiaDb.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

//--//-- Metodo para modificar materias
function update(req, res) {
    materiaDb.update(req.params.idmateria, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// //--//--// Metodo par eliminar fisicmente Materias de la base de datos identificando por id
// function eliminar(req, res) {
//     materiaDb.delete(req.params.idmateria,  function (err, result) {
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

//--//--//-- Metodo par eliminar logicamente Materias indentificando por su id cambiando el estado a 0
function eliminacionlogica(req, res) {
    materiaDb.logdelete(req.params.idmateria, function (result) {
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