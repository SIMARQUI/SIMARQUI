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
  PRIMARY KEY (`id_arch`),
  UNIQUE KEY `nom_arch` (`nom_arch`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `archiprestazgo`
--

INSERT INTO `archiprestazgo` (`id_arch`, `nom_arch`) VALUES
(5, 'Carabobo Este'),
(7, 'Carabobo Oeste'),
(6, 'Carabobo Sur'),
(2, 'Valencia Centro - Norte'),
(1, 'Valencia Centro - Sur'),
(3, 'Valencia Sur - Este'),
(4, 'Valencia Sur - Oeste');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `id_doc` varchar(10) NOT NULL,
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
  `id_inm` int(11) NOT NULL,
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
  `id_archif` int(11) NOT NULL,
  PRIMARY KEY (`id_parro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`id_parro`, `nom_parro`, `id_archif`) VALUES
(1, 'Catedral', 1),
(2, 'Divina Pastora', 1),
(3, 'Candelaria', 1),
(4, 'Corpus Cristi', 2),
(5, 'Inmaculado Corazon de Maria', 2),
(6, 'La Ascencion del Señor', 2),
(7, 'Espiritu Santo', 3),
(8, 'Jesus de Nazareth', 3),
(9, 'La Milagrosa', 3),
(10, 'Jesus, Maria y Jose', 4),
(11, 'Jesus Obrero', 4),
(12, 'Sagrada Familia', 4),
(13, 'Cristo Rey', 5),
(14, 'Divino Niño Jesus', 5),
(15, 'La Presentacion del Señor', 5),
(16, 'Maria Madre del Redentor', 6),
(17, 'Nuestra Señora de Belen', 6),
(18, 'Nuestra Señora del Carmen y San Luis', 6),
(19, 'La Inmaculada Concepcion', 7),
(20, 'Nuestra Señora de la Medalla Milagrosa y la San Cruz', 7),
(21, 'Nuestra Señora del Carmen', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `se_refiere`
--

CREATE TABLE IF NOT EXISTS `se_refiere` (
  `id_docf` varchar(10) NOT NULL,
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
(9, 'ADJUDICACION'),
(13, 'ANTICRESIS'),
(15, 'ARRENDAMIENTO'),
(2, 'CESION O TRASPASO'),
(1, 'COMPRA VENTA'),
(3, 'DONACIONES'),
(14, 'EXPROPIACION'),
(11, 'HIPOTECA'),
(8, 'LIQUIDACION DE HIPOTECA'),
(10, 'LIQUIDACION Y PARTICION DE BIENES'),
(6, 'NOTAS ACLARATORIAS'),
(17, 'OTROS'),
(4, 'PERMUTAS'),
(12, 'PETICION PARA CONSTRUCCION'),
(16, 'RETRACTO LEGAL'),
(7, 'TESTAMENTO'),
(5, 'TITULO SUPLETORIO');

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
