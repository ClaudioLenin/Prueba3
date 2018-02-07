-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2018 a las 02:21:02
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_piscina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE  IF NOT EXISTS `persona` (
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL unique,
  `cedula` varchar(10) NOT NULL primary key,
  `direccion` varchar(30) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contrasenia` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table  IF NOT EXISTS `factura`(
	`id_factura` varchar(10) NOT NULL primary key,
	`cedula`varchar(10) NOT NULL,
	`detalle` varchar(100) NOT NULL ,
	`valor_total` float NOT NULL ,
	`fecha` date,

	foreign key (`cedula`) references `persona` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table  IF NOT EXISTS `SERVICIO`(
	`id_servicio` varchar(10) NOT NULL primary key,
	`tipo` varchar(30) NOT NULL ,
	`detalle` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table  IF NOT EXISTS `factura_servicio`(
	`cantidad` int NOT NULL ,
	`id_factura` varchar(10) NOT NULL ,
	`id_servicio` varchar(10) NOT NULL ,

	foreign key (`id_factura`) references `factura` (`id_factura`),
	foreign key (`id_servicio`) references `SERVICIO` (`id_servicio`),
	primary key (`id_factura`,`id_servicio`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table  IF NOT EXISTS `PRODUCTO_LIMPIEZA`(
	`id_producto` varchar(10) NOT NULL primary key,
	`fecha_entrega` date NOT NULL ,
	`fecha_caducidad` date NOT NULL ,
	`detalle` varchar(100) NOT NULL , 
	`cantidad` int DEFAULT '0' NOT NULL ,
	`precio` float DEFAULT '0' NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table IF NOT EXISTS `INFORMACION`(
	`id_informacion` varchar(10) NOT NULL primary key,
	`tema` varchar(30) NOT NULL , 
	`descripcion` varchar(1000) NOT NULL ,
	`imagen` varchar(30) DEFAULT '0'

)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table IF NOT EXISTS `HORARIO`(
	`id_horario` varchar(10) NOT NULL primary key,
	`fecha_inicio` date NOT NULL ,
	`fecha_final` date NOT NULL ,
	`hora_inicio` time DEFAULT '00:00:00'NOT NULL ,
	`hora_final` time DEFAULT '00:00:00' NOT NULL 

)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table IF NOT EXISTS `informacion_horario`(
	`id_horario` varchar(10) NOT NULL ,
	`id_informacion` varchar(10) NOT NULL ,
	
	foreign key (`id_horario`) references `HORARIO`(`id_horario`) ,
	foreign key (`id_informacion`) references INFORMACION(`id_informacion`) ,
	primary key (`id_horario`, `id_informacion`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table IF NOT EXISTS `servicio_producto_limpieza_informacion`(
	`id_producto` varchar(10) NOT NULL ,
	`id_servicio` varchar(10) NOT NULL ,
	`id_informacion` varchar(10) NOT NULL ,

	foreign key (`id_producto`) references `PRODUCTO_LIMPIEZA`(`id_producto`) ,
	foreign key (`id_servicio`) references `SERVICIO`(`id_Servicio`) ,
	foreign key (`id_informacion`) references `INFORMACION`(`id_informacion`) ,
	primary key (`id_producto`, `id_servicio`, `id_informacion`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
