-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-12-2015 a las 23:13:23
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: 'basesc'
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla 'documento'
--

DROP TABLE IF EXISTS documento;
CREATE TABLE IF NOT EXISTS documento (
  cod_doc varchar(10) NOT NULL,
  cod_inmf int(11) NOT NULL,
  tipo varchar(60) NOT NULL,
  dia int(11) NOT NULL,
  mes int(11) NOT NULL,
  anyo int(11) NOT NULL,
  datos_registro varchar(100) NOT NULL,
  abogado_redactor varchar(100) NOT NULL,
  fecha_add_doc TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cod_doc)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla 'documento'
--

INSERT INTO documento (cod_doc, cod_inmf, tipo, dia, mes, anyo, datos_registro, abogado_redactor) VALUES
('000', 1, 'Compra-Venta', 1, 2, 1990, 'datos registro #1', 'nombre abogado #1'),
('001', 2, 'Compra-Venta', 1, 3, 1990, 'datos registro #2', 'nombre abogado #1'),
('002', 3, 'Compra-Venta', 1, 4, 1990, 'datos registro #2', 'nombre abogado #1'),
('003', 4, 'Sesion o traspaso', 2, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('005', 5, 'Sesion o traspaso', 1, 2, 1999, 'datos registro #2', 'nombre abogado #1'),
('010', 25, 'Testamento', 5, 5, 2005, 'datos registro #2', 'nombre abogado #1'),
('011', 5, 'Testamento', 4, 11, 1999, 'datos registro #2', 'nombre abogado #1'),
('012', 6, 'compra', 10, 12, 1992, 'datos registro #2', 'nombre abogado #1'),
('013', 7, 'venta', 5, 1, 1990, 'datos registro #2', 'nombre abogado #1'),
('014', 8, 'compra venta', 2, 2, 1995, 'datos registro #2', 'nombre abogado #1'),
('015', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('016', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('017', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('018', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('019', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('020', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('021', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('022', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('023', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('024', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('025', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('026', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('027', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('028', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('029', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('030', 1, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('032', 10, 'compra venta', 1, 2, 1990, 'datos registro #2', 'nombre abogado #1'),
('033', 9, 'compra venta', 4, 10, 2005, 'datos registro #2', 'nombre abogado #1'),
('058', 19, 'Testamento', 25, 12, 2014, 'datos registro #2', 'nombre abogado #1'),
('352', 5, 'Testamento', 2, 2, 1997, 'datos registro #2', 'nombre abogado #1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla 'inmueble'
--

TRUNCATE TABLE inmueble;
-- DROP TABLE inmueble;
CREATE TABLE IF NOT EXISTS inmueble (
  cod_inm int(11) NOT NULL AUTO_INCREMENT,
  nom_arch varchar(50) NOT NULL,
  nom_parro varchar(100) NOT NULL,
  descripcion varchar(200) NOT NULL,
  modo_adq varchar(50) NOT NULL,
  direccion varchar(200) NOT NULL,
  metraje varchar(20) NOT NULL,
  tipo_inm varchar(50) NOT NULL,
  fecha_add_inm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cod_inm)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla 'inmueble'
--

INSERT INTO inmueble (nom_arch, nom_parro, descripcion, modo_adq, direccion, metraje, tipo_inm) VALUES
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Blas', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Divina Pastora', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'Candelaria', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'la Granja', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Naguanagua', 'La entrada', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia Centro - Sur', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela'),
('Valencia', 'San Jose', 'se compro para ser usado de refugio', 'compra', 'valencia', '189', 'parcela');