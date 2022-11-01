-- Creo la base de datos
create schema E3_TP04_M02

-- Creo tabla CLIENTE
CREATE table `E3_TP04_M02`.`CLIENTE` (
	id_cliente INT AUTO_INCREMENT,
	dni_cl varchar(45) unique not null, 
    nombre_cl varchar(120) not null,
    direccion_cl varchar(120) not null,
    telefono_cl varchar(20) not null,
    PRIMARY KEY (`id_cliente`)
    );
    
-- Cargo tabla CLIENTE
INSERT INTO `e3_tp04_m02`.`cliente` (`dni_cl`, `nombre_cl`, `direccion_cl`, `telefono_cl`) VALUES ('12123123', 'Juan Pepito', 'Narnia -  Ropero 820', '3755123456');
INSERT INTO `e3_tp04_m02`.`cliente` (`dni_cl`, `nombre_cl`, `direccion_cl`, `telefono_cl`) VALUES ('45456456', 'Marcos Marquitos', 'Palmera - Derecha 3', '3576456456');
INSERT INTO `e3_tp04_m02`.`cliente` (`dni_cl`, `nombre_cl`, `direccion_cl`, `telefono_cl`) VALUES ('78789789', 'Jheson Butcher', 'Machete - Cortada 15', '3573951753');
INSERT INTO `e3_tp04_m02`.`cliente` (`dni_cl`, `nombre_cl`, `direccion_cl`, `telefono_cl`) VALUES ('35357357', 'Bob Esponja', 'Bahia Bikini - Piña 10', '3216951951');

-- Creo tabla RESERVA   
CREATE TABLE `E3_TP04_M02`.`RESERVA` (
  `id_reserva` INT NOT NULL AUTO_INCREMENT,
  `ini_res` DATE,
  `fin_res` DATE,
  `total_res` FLOAT,
  `Cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_reserva`, `Cliente_id_cliente`),
  INDEX `fk_RESERVA_Cliente_idx` (`Cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_Cliente`
    FOREIGN KEY (`Cliente_id_cliente`)
    REFERENCES `E3_TP04_M02`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- Cargo tabla RESERVA
INSERT INTO `e3_tp04_m02`.`reserva` (`ini_res`, `fin_res`, `total_res`, `Cliente_id_cliente`) VALUES ('2022-10-14', '2022-10-18', '0', '2');
INSERT INTO `e3_tp04_m02`.`reserva` (`ini_res`, `Cliente_id_cliente`) VALUES ('2022-10-20', '1');
INSERT INTO `e3_tp04_m02`.`reserva` (`ini_res`, `Cliente_id_cliente`) VALUES ('2022-10-20', '1');
INSERT INTO `e3_tp04_m02`.`reserva` (`ini_res`, `Cliente_id_cliente`) VALUES ('2022-11-05', '3');
INSERT INTO `e3_tp04_m02`.`reserva` (`ini_res`, `fin_res`, `Cliente_id_cliente`) VALUES ('2022-05-16', '2022-10-01', '4');

    
-- Creo tabla COCHE
CREATE TABLE `E3_TP04_M02`.`COCHE` (
  `matricula` VARCHAR(15) NOT NULL,
  `modelo_co` VARCHAR(80) NOT NULL,
  `marca_co` VARCHAR(60) NOT NULL,
  `color_co` VARCHAR(30) NOT NULL,
  `valorhora_co` FLOAT NOT NULL,
  `ini_ltcombust` FLOAT,
  `fin_ltcombust` FLOAT,
  `RESERVA_id_reserva` INT,
  `RESERVA_Cliente_id_cliente` INT,
  PRIMARY KEY (`matricula`, `RESERVA_id_reserva`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_COCHE_RESERVA1_idx` (`RESERVA_id_reserva` ASC, `RESERVA_Cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_COCHE_RESERVA1`
    FOREIGN KEY (`RESERVA_id_reserva` , `RESERVA_Cliente_id_cliente`)
    REFERENCES `E3_TP04_M02`.`RESERVA` (`id_reserva` , `Cliente_id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- Cargo tabla COCHE
INSERT INTO `e3_tp04_m02`.`coche` (`matricula`, `modelo_co`, `marca_co`, `color_co`, `valorhora_co`, `RESERVA_id_reserva`) VALUES ('qwe321', 'Megane', 'Renault', 'Gris', '500', '3');
INSERT INTO `e3_tp04_m02`.`coche` (`matricula`, `modelo_co`, `marca_co`, `color_co`, `valorhora_co`, `RESERVA_id_reserva`) VALUES ('asd456', 'Clio', 'Renault', 'Rojo', '250', '1');
INSERT INTO `e3_tp04_m02`.`coche` (`matricula`, `modelo_co`, `marca_co`, `color_co`, `valorhora_co`, `RESERVA_id_reserva`) VALUES ('zxc789', 'Celta', 'Chevrolet', 'Blanco', '150.5', '2');
INSERT INTO `e3_tp04_m02`.`coche` (`matricula`, `modelo_co`, `marca_co`, `color_co`, `valorhora_co`, `RESERVA_id_reserva`) VALUES ('rty321', 'Corsa', 'Chevrolet', 'Gris', '200', '2');
INSERT INTO `e3_tp04_m02`.`coche` (`matricula`, `modelo_co`, `marca_co`, `color_co`, `valorhora_co`, `RESERVA_id_reserva`) VALUES ('hjk951', 'Fox', 'Volkswagen', 'Negro', '300', '2');
INSERT INTO `e3_tp04_m02`.`coche` (`matricula`, `modelo_co`, `marca_co`, `color_co`, `valorhora_co`, `RESERVA_id_reserva`) VALUES ('uyt777', 'PataPata', 'Rondi', 'Amarillo', '15', '4');