require("rootpath")();
const express = require('express');
const app = express();

const sedeDB = require("../datasource/sedeDB.js");


app.get('/', getAll);

app.get('/:idsede', getByIdsede);

app.post('/', create);

app.put('/:idsede', update);

// app.delete('/del/:idsede', eliminar);

app.delete('/:idsede', eliminacionlogica);

// Metododo para listar todas las sedes
function getAll(req, res) {
    sedeDB.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
//// Metodo para buscar sede por su id
function getByIdsede(req, res) {
   sedeDB.getByIdsede(req.params.idsede,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
////// Metodo para agregar sede
function create(req, res) {
    sedeDB.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

//////// Metodo para modificar sede identificando por su id
function update(req, res) {
    sedeDB.update(req.params.idsede, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// ////////// Metodo par eliminar fisicmente sede de la base de datos identificando por id
// function eliminar(req, res) {
//     sedeDB.delete(req.params.idsede,  function (err, result) {
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

//////////// Metodo par eliminar logicamente la sede indentificando por su id cambiando el estado a 0
function eliminacionlogica(req, res) {
    sedeDB.logdelete(req.params.idsede, function (result) {
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