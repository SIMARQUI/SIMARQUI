-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2016 a las 13:54:43
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `archiprestazgo`
--

INSERT INTO `archiprestazgo` (`id_arch`, `nom_arch`) VALUES
(1, 'Valencia Centro - Sur'),
(2, 'Valencia Centro - Norte'),
(3, 'Valencia Sur - Este'),
(4, 'Valencia Sur - Oeste'),
(5, 'Carabobo Este'),
(6, 'Carabobo Sur'),
(7, 'Carabobo Oeste');

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

--
-- Volcado de datos para la tabla `documento`
--

/*INSERT INTO `documento` (`id_doc`, `tipo`, `datos_registro`, `abogado_redactor`, `fecha`, `activo`, `fecha_add_doc`) VALUES
('doc1', 'Permutas', 'Datos de yeisser', 'Abogado yeisser', '2015-09-11', 1, '2016-03-11 06:25:21'),
('doc10', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc11', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc12', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc13', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc14', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc15', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc16', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc17', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc18', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc19', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc2', 'TESTAMENTO', 'assa', 'sasasa', '2015-05-11', 1, '2016-03-11 06:25:21'),
('doc20', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc21', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc22', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc23', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc24', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc25', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc26', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc27', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:16'),
('doc28', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc29', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc3', 'TESTAMENTO', 'saddas', 'asddsa', '2016-04-03', 1, '2016-03-11 07:03:26'),
('doc30', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc31', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc32', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc33', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc34', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc35', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc36', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc37', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc38', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc39', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc4', 'TESTAMENTO', 'jjjj', 'jjjj', '2015-07-05', 1, '2016-03-11 07:03:26'),
('doc40', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc41', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc42', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc43', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc44', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc45', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc46', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc47', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:17'),
('doc48', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc49', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc5', 'TESTAMENTO', 'werer', 'werwer', '2014-01-06', 1, '2016-03-11 08:25:43'),
('doc50', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc51', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc52', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc53', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc54', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc55', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc56', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc57', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc58', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc59', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc6', 'TESTAMENTO', 'dssdsasa', 'dssdsd', '2015-02-01', 1, '2016-03-11 09:17:34'),
('doc60', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc61', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc62', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc63', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc64', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc65', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:18'),
('doc66', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc68', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc7', 'as', 'zxzxsasa', 'zxzxsasasa', '2016-04-04', 1, '2016-03-11 09:19:44'),
('doc71', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc72', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc73', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc74', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc75', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc76', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:19'),
('doc9', 'TESTAMENTO', 'LJLKJ', 'ljlkjkl', '2000-02-02', 1, '2016-04-19 19:48:15');*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fundacion`
--

CREATE TABLE IF NOT EXISTS `fundacion` (
  `id_fund` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fund` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fund`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `fundacion`
--

INSERT INTO `fundacion` (`id_fund`, `nom_fund`) VALUES
(1, 'fundacion1'),
(2, 'fundacion2'),
(3, 'fundacion3'),
(4, 'fundacion4'),
(5, 'fundacion5'),
(6, 'fundacion6');

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

--
-- Volcado de datos para la tabla `inmueble`
--

/*INSERT INTO `inmueble` (`id_inm`, `descripcion`, `modo_adq`, `direccion`, `metraje`, `tipo_inm`, `fecha_add_inm`, `linderos`) VALUES
(5, 'dssd', 'sdjj', 'sdkk', 'dsds', 'dssd', '2016-03-11 08:20:10', 'linderos'),
(6, 'sadsad', 'wqe', 'wqe', 'wqe', 'wqe', '2016-03-11 08:34:03', 'linderos'),
(7, 'zzz', 'sdaffads', 'fsdafdas', 'fsdaafsda', 'fsad', '2016-03-11 08:38:18', 'linderos'),
(8, 'sasasa', 'saas', 'askk', 'saas', 'sasa', '2016-03-11 08:40:24', 'linderos'),
(9, 'wewewe', 'sasa', 'asas', 'sasa', 'wewewe', '2016-03-11 08:43:41', 'linderos'),
(10, 'sasasa', 'sasa', 'sasa', 'sasa', 'sasa', '2016-03-11 08:44:32', 'linderos'),
(11, 'sasa', 'sasasa', 'sasa', 'sasasa', 'assa', '2016-03-11 08:44:52', 'linderos'),
(13, 'nuevo1', 'nuevo1', 'nuevo1', 'nuevo1', 'nuevo1', '2016-04-29 08:08:53', 'nuevo1'),
(14, 'asfdfsdfsd', 'ass', 'san francisco', 'aaa', 'aaaa', '2016-07-03 21:54:29', 'sadffsadfsda'),
(15, 'sadad', 'sadsda', 'sad', 'sadasd', 'sasad', '2016-07-27 06:37:59', 'sadsad');*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inm_pert_arqui`
--

CREATE TABLE IF NOT EXISTS `inm_pert_arqui` (
  `id_inmffff` int(11) NOT NULL,
  PRIMARY KEY (`id_inmffff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inm_pert_arqui`
--

/*INSERT INTO `inm_pert_arqui` (`id_inmffff`) VALUES
(5),
(12),
(14);*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inm_pert_fund`
--

CREATE TABLE IF NOT EXISTS `inm_pert_fund` (
  `id_inmff` int(11) NOT NULL,
  `id_fundff` int(11) NOT NULL,
  PRIMARY KEY (`id_inmff`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inm_pert_fund`
--

/*INSERT INTO `inm_pert_fund` (`id_inmff`, `id_fundff`) VALUES
(10, 4),
(13, 7);*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inm_pert_parro`
--

CREATE TABLE IF NOT EXISTS `inm_pert_parro` (
  `id_inmf` int(11) NOT NULL,
  `id_parrof` int(11) NOT NULL,
  PRIMARY KEY (`id_inmf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inm_pert_parro`
--

/*INSERT INTO `inm_pert_parro` (`id_inmf`, `id_parrof`) VALUES
(15, 19),
(16, 16);*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE IF NOT EXISTS `parroquia` (
  `id_parro` int(11) NOT NULL AUTO_INCREMENT,
  `nom_parro` varchar(100) NOT NULL,
  `id_archif` int(11) NOT NULL,
  PRIMARY KEY (`id_parro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

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

--
-- Volcado de datos para la tabla `se_refiere`
--

/*INSERT INTO `se_refiere` (`id_docf`, `id_inmfff`) VALUES
('doc1', 7),
('doc1', 8),
('doc1', 9),
('doc1', 10),
('doc1', 11),
('doc6', 1),
('doc68', 14),
('doc7', 2),
('doc76', 15);*/

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
(5, 'TiTULO SUPLETORIO');

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
('admin', 'admin', 'Administrador', 10, 1, 10, 10, 10, 10, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
