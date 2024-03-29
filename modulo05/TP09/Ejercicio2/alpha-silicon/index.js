require("rootpath")();
const express = require('express');
const app = express();
const morgan = require('morgan');
const config = require("./src/config/config.json");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan('tiny'));
morgan(':method :url :status :res[content-length] - :response-time ms');
  

//Endpoint principal
app.get("/", function (req, res) {
    res.send("ALPHA-SILICON");
});


//Endpoint para Personas
const personaCont = require("./src/controller/personaController.js");
app.use("/api/persona",personaCont);

//Endpoint para Cursos
const cursoCont = require("./src/controller/cursoController.js");
app.use("/api/curso",cursoCont);

//Endpoint para Usuarios 
const usuarioCont = require("./src/controller/usuarioController.js");
app.use("/api/usuario",usuarioCont);

//Endpoint para Sedes
const sedeCont = require("./src/controller/sedeController.js");
app.use("/api/sede",sedeCont);

//Endpoint para Materias
const materiaCont = require("./src/controller/materiaController.js");
app.use("/api/materia",materiaCont);

app.listen(config.server.port, function (err) {
    if (err) {
        console.log(err);
    } else {
        console.log(`Server iniciado en puerto:${config.server.port}`);
    }
});
