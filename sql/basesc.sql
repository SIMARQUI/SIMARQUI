-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2017 a las 17:51:14
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `basesc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archiprestazgo`
--

CREATE TABLE IF NOT EXISTS `archiprestazgo` (
  `id_arch` int(11) NOT NULL AUTO_INCREMENT,
  `nom_arch` varchar(100) NOT NULL,
  `cod_arch` varchar(5) NOT NULL,
  PRIMARY KEY (`id_arch`),
  UNIQUE KEY `nom_arch` (`nom_arch`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `archiprestazgo`
--

INSERT INTO `archiprestazgo` (`id_arch`, `nom_arch`, `cod_arch`) VALUES
(5, 'Carabobo Este', '6'),
(7, 'Carabobo Oeste', '8'),
(6, 'Carabobo Sur', '7'),
(2, 'Valencia Centro - Norte', '3'),
(1, 'Valencia Centro - Sur', '2'),
(3, 'Valencia Sur - Este', '4'),
(8, 'Curia Arquidiocesana', '1'),
(4, 'Valencia Sur - Oeste', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `id_doc` int(11) NOT NULL AUTO_INCREMENT,
  `cod_doc` varchar(11) NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `datos_registro` varchar(100) NOT NULL,
  `abogado_redactor` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_add_doc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fundacion`
--

CREATE TABLE IF NOT EXISTS `fundacion` (
  `id_fund` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fund` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fund`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE IF NOT EXISTS `inmueble` (
  `id_inm` int(11) NOT NULL AUTO_INCREMENT,
  `cod_inm` varchar(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `modo_adq` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `metraje` varchar(20) NOT NULL,
  `tipo_inm` varchar(50) NOT NULL,
  `fecha_add_inm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linderos` varchar(200) NOT NULL,
  PRIMARY KEY (`id_inm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inm_pert_arqui`
--

CREATE TABLE IF NOT EXISTS `inm_pert_arqui` (
  `id_inmffff` int(11) NOT NULL,
  PRIMARY KEY (`id_inmffff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inm_pert_fund`
--

CREATE TABLE IF NOT EXISTS `inm_pert_fund` (
  `id_inmff` int(11) NOT NULL,
  `id_fundff` int(11) NOT NULL,
  PRIMARY KEY (`id_inmff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inm_pert_parro`
--

CREATE TABLE IF NOT EXISTS `inm_pert_parro` (
  `id_inmf` int(11) NOT NULL,
  `id_parrof` int(11) NOT NULL,
  PRIMARY KEY (`id_inmf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE IF NOT EXISTS `parroquia` (
  `id_parro` int(11) NOT NULL AUTO_INCREMENT,
  `nom_parro` varchar(100) NOT NULL,
  `cod_parro` varchar(5) NOT NULL,
  `id_archif` int(11) NOT NULL,
  PRIMARY KEY (`id_parro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`id_parro`, `nom_parro`, `cod_parro`, `id_archif`) VALUES
--  Curia Arquidiocesana id_archif = 3
--  Valencia Centro - Sur id_archif = 1 cod_arch = 2
(1, "Catedral", "2-01", 1),
(2, "Divina Pastora", "2-02", 1),
(3, "Candelaria", "2-03", 1),
(4, "Nuestra Señora de Coromoto", "2-04", 1),
(5, "San Blas", "2-05", 1),
(6, "San Martin de Porres", "2-06", 1),
(7, "San Miguel Arcangel", "2-07", 1),
(8, "San Pedro y San Pablo", "2-08", 1),
(9, "San Rafael", "2-09", 1),
(10, "Santa Rosa de Lima", "2-10", 1),
--  Centro - Norte id_archif = 2 cod_arch = 3
(11, "Corpus Cristi", "3-01", 2),
(12, "Inmaculado Corazon de Maria", "3-02", 2),
(13, "La Ascención del Señor", "3-03", 2),
(14, "La Ascención y Santa Rita", "3-04", 2),
(15, "La Inmaculada (Camoruco)", "3-05", 2),
(16, "Nuestra Señora de Begoña", "3-06", 2),
(17, "Nuestra Señora del Carmen", "3-07", 2),
(18, "La Purisima Concepción y Sanhto Niño de Praga", "3-08", 2),
(19, "San Antonio", "3-09", 2),
(20, "San Jose", "3-01", 2),
(21, "Santa Eduviguis", "3-11", 2),
(22, "Santa Marta", "3-12", 2),
--  Valencia Sur - Este id_archif = 3 cod_arch = 4
(23, "Espiritu Santo", "4-01", 3),
(24, "Jesús de Nazareth", "4-02", 3),
(25, "La Milagrosa", "4-03", 3),
(26, "La Misericordia del Señor", "4-04", 3),
(27, "Nuestra Señora de Guadalupe", "4-05", 3),
(28, "Sagrado Corazón de Jesús", "4-06", 3),
(29, "San Diego de Alcala y de la Candelaria", "4-07", 3),
(30, "Cuasi Parroquia La Transfiguración del Señor", "4-08", 3),
(31, "Cuasi Parroquia Santa Inés Mártin", "4-09", 3),
(32, "La Resurección del Señor", "4-10", 3),
--  Valencia Sur - Oeste id_archif = 4 cod_arch = 5
(33, "Jesús María y José", "5-01", 4),
(34, "Jesús Obrero", "5-02", 4),
(35, "Sagrada Familia", "5-03", 4),
(36, "Nuestra Señora de Las Mercedes", "5-04", 4),
(37, "San Jóse de Calasanz", "5-05", 4),
(38, "San José Obrero", "5-06", 4),
(39, "San Juan Bautista", "5-07", 4),
(40, "San Juan Bosco", "5-08", 4),
(41, "San Juan María Vianney", "5-09", 4),
(42, "San Pablo Ermitaño", "5-10", 4),
(43, "Santisimo Redentor", "5-11", 4),
--  Carabobo Este id_archif = 5 cod_arch = 6
(44, "Cristo Rey", "6-01", 5),
(45, "Divino Niño Jesús", "6-02", 5),
(46, "La Presentación del Señor", "6-03", 5),
(47, "María Madre de la Iglesia", "6-04", 5),
(48, "Nuestra Señora del Carmen", "6-05", 5),
(49, "Nuestra Señora del Carmen Y santa Teresita del Niño Jesús", "6-06", 5),
(50, "Nuestra Señora de la Medalla Milagrosa", "6-07", 5),
(51, "San Agustin", "6-08", 5),
(52, "San Antonio de Padua", "6-09", 5),
(53, "San Juan Apostol", "6-10", 5),
(54, "San Pancracio", "6-11", 5),
(55, "San Juan Pablo II", "6-12", 5),
--  Carabobo Sur id_archif = 6 cod_arch = 7
(56, "Maria Madre del Redentor", "7-01", 6),
(57, "Nuestra Señora de Belén", "7-02", 6),
(58, "Nuestra Señora del Carmen y San Luis", "7-03", 6),
(59, "Nuestra Señora del Rosario", "7-04", 6),
(60, "Santos Angeles Custodios y San Isidro", "7-05", 6),
(61, "Cuasi Parroquia E Santo Cristo", "7-06", 6),
(62, "Cuasi Parroquia San José de Los Naranjos (Vicaria San José)", "7-07", 6),
--  Carabobo Oeste id_archif = 7 cod_arch = 8
(63, "La Inmaculada Concepción", "8-01", 7),
(64, "Nuestra Señora de la Medalla Milagrosa y la San Cruz", "8-02", 7),
(65, "Nuestra Señora del Carmen", "8-03", 7),
(66, "Sagrado Corazon de Jesús", "8-04", 7),
(67, "San José", "8-05", 7),
(68, "San Rafael", "8-06", 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `se_refiere`
--

CREATE TABLE IF NOT EXISTS `se_refiere` (
  `id_docf` int(11) NOT NULL,
  `id_inmfff` int(11) NOT NULL,
  PRIMARY KEY (`id_docf`,`id_inmfff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `nombre`) VALUES
(9, 'Adjudicación'),
(13, 'Anticresis'),
(15, 'Arrendamiento'),
(2, 'Cesion o Traspaso'),
(1, 'Compra Venta'),
(3, 'Donaciones'),
(14, 'Expropiación'),
(11, 'Hipoteca'),
(8, 'Liquidación de Hipoteca'),
(10, 'Liquidación y Partición de Bienes'),
(6, 'Notas Aclaratorias'),
(17, 'Otros'),
(4, 'Permutas'),
(12, 'Petición Para Construcción'),
(16, 'Retracto Legal'),
(7, 'Testamento'),
(5, 'Titulo Supletorio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `login` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'Consultor',
  `filasPP` int(11) NOT NULL DEFAULT '10',
  `abrirBusqDoc` bit(1) NOT NULL DEFAULT b'0',
  `filasPPInm` int(11) NOT NULL DEFAULT '10',
  `filasPPArch` int(11) NOT NULL DEFAULT '10',
  `filasPPFund` int(11) NOT NULL DEFAULT '10',
  `filasPPUsuario` int(11) NOT NULL,
  `abrirBusqInm` bit(1) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`login`, `password`, `rol`, `filasPP`, `abrirBusqDoc`, `filasPPInm`, `filasPPArch`, `filasPPFund`, `filasPPUsuario`, `abrirBusqInm`) VALUES
('admin', 'admin1234', 'Administrador', 100, b'1', 10, 50, 10, 10, b'1'),
('consultor', 'consultor1234', 'Consultor', 10, b'1', 5, 20, 50, 10, b'1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
