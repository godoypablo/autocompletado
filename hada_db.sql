-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-01-2019 a las 17:28:37
-- Versión del servidor: 5.1.73
-- Versión de PHP: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hada_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agrupamientos`
--

CREATE TABLE `agrupamientos` (
  `idAgrupamiento` int(11) NOT NULL,
  `detalleAgrupamiento` varchar(80) DEFAULT NULL,
  `tramo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agrupamientos`
--

INSERT INTO `agrupamientos` (`idAgrupamiento`, `detalleAgrupamiento`, `tramo`) VALUES
(1, 'Administrativo y Técnico B - Técnico', 'Administrativo'),
(2, 'Administrativo y Tecnico B - Ejecución', 'Administrativo'),
(3, 'Administrativo y Tecnico C - Supervisión', 'Administrativo'),
(4, 'Mantenimiento y Producción B - Operario', 'Administrativo'),
(5, 'Mantenimiento y Producción C - Supervisión', 'Administrativo'),
(6, 'Personal de Servicios Generales B - Personal de Servicios', 'Servicios Generales'),
(7, 'Profesional A', 'Profesional'),
(8, 'Profesional B', 'Profesional'),
(9, 'Profesional C', 'Profesional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionesDocentes`
--

CREATE TABLE `asignacionesDocentes` (
  `idasignaciondocente` int(11) NOT NULL,
  `idDocente` int(11) DEFAULT NULL,
  `idasigcarrera` int(11) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `cargaHoraria` int(11) DEFAULT NULL,
  `fechaDesde` date DEFAULT NULL,
  `fechaHasta` date DEFAULT NULL,
  `resolucion` varchar(15) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipoDesignacion` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'C:Concurso, D:Directa',
  `idComision` int(11) DEFAULT NULL COMMENT 'Guaraní',
  `cantAlumnos` int(11) DEFAULT NULL,
  `expediente` varchar(15) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `equipoCatedra` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'S:Si, N:No',
  `idSede` int(11) DEFAULT NULL,
  `investigacion` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'S:Si, N:No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignacionesDocentes`
--

INSERT INTO `asignacionesDocentes` (`idasignaciondocente`, `idDocente`, `idasigcarrera`, `idCategoria`, `cargaHoraria`, `fechaDesde`, `fechaHasta`, `resolucion`, `tipoDesignacion`, `idComision`, `cantAlumnos`, `expediente`, `equipoCatedra`, `idSede`, `investigacion`) VALUES
(1, 1, 32, 30, 3, '2017-03-31', '2018-03-31', 'Res 0114/17CD', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionesPas`
--

CREATE TABLE `asignacionesPas` (
  `idAsignPas` int(11) NOT NULL,
  `idPas` int(11) DEFAULT NULL,
  `idAgrupamiento` int(11) DEFAULT NULL,
  `idCargo` int(11) DEFAULT NULL,
  `funcion` blob,
  `resolucion` varchar(20) DEFAULT NULL,
  `afectaciones` varchar(80) DEFAULT NULL,
  `fechaDesde` date DEFAULT NULL,
  `fechaHasta` date DEFAULT NULL,
  `horasAsignadas` int(11) DEFAULT NULL,
  `idDependencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturaDocente`
--

CREATE TABLE `asignaturaDocente` (
  `idAsignaturaDocente` int(11) NOT NULL,
  `idDocente` int(11) DEFAULT NULL,
  `idAsignatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `idAsignatura` int(11) NOT NULL,
  `nombreAsignatura` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `anioCursada` int(11) DEFAULT NULL,
  `hsSemanales` int(11) DEFAULT NULL,
  `comentarios` varchar(300) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `idPeriodoLectivo` int(11) DEFAULT NULL,
  `idPlanVigente` int(11) DEFAULT NULL,
  `idCarrera` int(11) DEFAULT NULL,
  `periodoLectivo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`idAsignatura`, `nombreAsignatura`, `anioCursada`, `hsSemanales`, `comentarios`, `idPeriodoLectivo`, `idPlanVigente`, `idCarrera`, `periodoLectivo`) VALUES
(2, 'Epistemología', 1, 0, '-', NULL, 28, NULL, '1º Cuatrimestre'),
(4, 'Epistemología', 1, 0, '-', NULL, 27, NULL, '1º Cuatrimestre'),
(5, 'Teoría Social y del Estado', 1, 0, '', NULL, 23, NULL, '1º Cuatrimestre'),
(6, 'Trayecto Pedagógico - Sociología de la Educación', 1, 1, 'Res 01147/17 CD', NULL, 1, NULL, 'Anual'),
(7, 'Historia del Arte I', 1, 2, '', NULL, 0, NULL, 'Anual'),
(8, 'Semiotica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(9, 'Dibujo I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(10, 'Morfologia', 1, 4, '', NULL, 0, NULL, 'Anual'),
(11, 'Composición  Plástica', 0, 4, '', NULL, 0, NULL, 'Anual'),
(12, 'Sistemas de Representación', 1, 4, '', NULL, 0, NULL, 'Anual'),
(13, 'Compocisión Plástica', 1, 4, '', NULL, 0, NULL, 'Anual'),
(14, 'Ceramica ', 1, 15, '', NULL, 0, NULL, 'Anual'),
(15, 'Pintura ', 1, 15, '', NULL, 0, NULL, 'Anual'),
(16, 'Escultura ', 1, 15, '', NULL, 0, NULL, 'Anual'),
(17, 'Grabado', 1, 15, '', NULL, 0, NULL, 'Anual'),
(18, 'Filosofía', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(19, 'Filosofía', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(20, 'Semiótica de los Lenguajes Visuales', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(21, 'Historia del Arte II', 2, 2, '', NULL, 0, NULL, 'Anual'),
(22, 'Dibujo', 2, 3, '', NULL, 0, NULL, 'Anual'),
(23, 'Morfología', 2, 4, '', NULL, 0, NULL, 'Anual'),
(24, 'Composición Plástica', 2, 4, '', NULL, 0, NULL, 'Anual'),
(25, 'Experimentacón Visual', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(26, 'Céramica II', 2, 8, '', NULL, 0, NULL, 'Anual'),
(27, 'Pintura II', 3, 8, '', NULL, 0, NULL, 'Anual'),
(28, 'Ceramica II', 2, 8, '', NULL, 0, NULL, 'Anual'),
(29, 'Ceramica II', 2, 8, '', NULL, 0, NULL, 'Anual'),
(30, 'Pintura II', 2, 8, '', NULL, 0, NULL, 'Anual'),
(31, 'Escultura II', 2, 8, '', NULL, 0, NULL, 'Anual'),
(32, 'Grabado II', 2, 8, '', NULL, 0, NULL, 'Anual'),
(33, 'Idioma Extranjero Nivel I', 2, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(34, 'Informática Nivel I', 2, 2, '', NULL, 0, NULL, 'Anual'),
(35, 'Estética', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(36, 'Historia del Arte III', 3, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(37, 'Técnicas Visuales Contemporáneas', 3, 2, '', NULL, 0, NULL, 'Anual'),
(38, 'Dibujo III', 3, 3, '', NULL, 0, NULL, 'Anual'),
(39, 'Sintaxis Visual III', 3, 4, '', NULL, 0, NULL, 'Anual'),
(40, 'Laboratorio de los Materiales', 3, 2, '', NULL, 0, NULL, 'Anual'),
(41, 'Ceramica III', 3, 8, '', NULL, 0, NULL, 'Anual'),
(42, 'Pintura III', 3, 8, '', NULL, 0, NULL, 'Anual'),
(43, 'Escultura III', 3, 8, '', NULL, 0, NULL, 'Anual'),
(44, 'Grabado III', 3, 8, '', NULL, 0, NULL, 'Anual'),
(45, 'Idioma Extranjero Nivel II', 3, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(46, 'Informatica Nivel II', 3, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(47, 'Metodología de la Investigación', 3, 2, '', NULL, 0, NULL, 'Anual'),
(48, 'Arte Argentino Latinoamericano', 4, 3, '', NULL, 0, NULL, 'Anual'),
(49, 'Comunicación e Investigación Visual', 4, 4, '', NULL, 0, NULL, 'Anual'),
(50, 'Crítica del Arte', 4, 2, '', NULL, 0, NULL, 'Anual'),
(51, 'Metrodología de la Investigación Artística', 4, 2, '', NULL, 0, NULL, 'Anual'),
(52, 'Talleres de Investigación y Producción en Artes Visuales IV', 4, 8, '', NULL, 0, NULL, 'Anual'),
(53, 'Seminario de Tesis ', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(54, 'Arte Digital', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(55, 'Psicología del Arte ', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(56, 'Sociología del Arte', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(57, 'Antropología Cultural', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(58, 'Seminario de Estéticas Contemporaneas', 5, 4, '', NULL, 0, NULL, 'Anual'),
(59, 'Producción en Lenguajes Contemporáneos', 5, 3, '', NULL, 0, NULL, 'Anual'),
(60, 'Gestión Cultural', 5, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(61, 'Taller de Investigación y Producción en Artes Visuales V Tesis Final', 5, 8, '', NULL, 0, NULL, 'Anual'),
(62, 'Epistemología', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(63, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(64, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(65, 'Taller de Problematización de lo Espacio Temporal', 1, 3, '', NULL, 0, NULL, 'Anual'),
(66, 'Antropología ', 1, 3, '', NULL, 0, NULL, 'Anual'),
(67, 'Teoría Politica', 1, 3, '', NULL, 0, NULL, 'Anual'),
(68, 'Seminario Problemática Sociológica', 0, 3, '', NULL, 0, NULL, 'Anual'),
(69, 'Epistemología de las Ciencias Sociales', 2, 3, '', NULL, 0, NULL, 'Anual'),
(70, 'Seminario \"Procesos de Articulación entre Espacio y Cultura\"', 2, 3, '', NULL, 0, NULL, 'Anual'),
(71, 'Taller de Estudios de los Procesos Civilizatorios Mundiales', 2, 4, '', NULL, 0, NULL, 'Anual'),
(72, 'Procesos Civilizatorios Mundiales', 2, 6, '', NULL, 0, NULL, 'Anual'),
(73, 'Historia de las Ideas ', 2, 4, '', NULL, 0, NULL, 'Anual'),
(74, 'Economía Política', 2, 3, '', NULL, 0, NULL, 'Anual'),
(75, 'Investigación Social I', 3, 3, '', NULL, 0, NULL, 'Anual'),
(76, 'Configuración de los Espacios de la Modernidad y del Sistema-Mundo', 2, 6, '', NULL, 0, NULL, 'Anual'),
(77, 'Configuración de los Espacios de la Modernidad y del Sistema-Mundo', 3, 4, '', NULL, 0, NULL, 'Anual'),
(78, 'Procesos Históricos de la Modernidad', 3, 6, '', NULL, 0, NULL, 'Anual'),
(79, 'Teoría Social y Teoría Histórica', 3, 4, '', NULL, 0, NULL, 'Anual'),
(80, 'Histórica de las Ideas II', 3, 4, '', NULL, 0, NULL, 'Anual'),
(81, 'Investigación Social II', 4, 3, '', NULL, 0, NULL, 'Anual'),
(82, 'Seminario \"Geografía de la Mundialización Capitalista de los Estados-Nación', 4, 6, '', NULL, 0, NULL, 'Anual'),
(83, 'Taller de Análisis de los Procesos de Configuración y Expansión del Capitalismo Silgo XX. Caso Argen', 4, 4, '', NULL, 0, NULL, 'Anual'),
(84, 'Análisis de Discurso', 4, 3, '', NULL, 0, NULL, 'Anual'),
(85, 'Pedagogía y Construcción de Subjetividades', 4, 3, '', NULL, 0, NULL, 'Anual'),
(86, 'Tesina', 5, 3, '', NULL, 0, NULL, 'Anual'),
(87, 'La Tensión Global-Local y su Impacto en la Crisis de los Estados-Nación', 5, 6, '', NULL, 0, NULL, 'Anual'),
(88, 'Taller de Producción Científica sobre los debates de la ocesos de la Crisis de la Modernidad', 5, 4, '', NULL, 0, NULL, 'Anual'),
(89, 'Problemas de la História del Tiempo Presente', 5, 6, '', NULL, 0, NULL, 'Anual'),
(90, 'Literatura y Sociedad', 0, 3, '', NULL, 0, NULL, 'Anual'),
(91, 'Derechos Humanos y Filosofía Práctica', 5, 3, '', NULL, 0, NULL, 'Anual'),
(92, 'Sistemas de Información Geográficos', 5, 3, '', NULL, 0, NULL, 'Anual'),
(93, 'Ciudades Sustentables', 5, 3, '', NULL, 0, NULL, 'Anual'),
(94, 'Filosofía de la Historia', 5, 3, '', NULL, 0, NULL, 'Anual'),
(95, 'Teoría del Sujeto y Control Social', 5, 3, '', NULL, 0, NULL, 'Anual'),
(96, 'Historia Social y del Estado Argentino Siglo XX', 5, 3, '', NULL, 0, NULL, 'Anual'),
(97, 'Gestión Económica, Presupuesto Participativo', 5, 3, '', NULL, 0, NULL, 'Anual'),
(98, 'Política Social', 5, 3, '', NULL, 0, NULL, 'Anual'),
(99, 'Epistemología', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(100, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(101, 'Problemática Antropologíca de la Salud', 1, 2, '', NULL, 0, NULL, 'Anual'),
(102, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(103, 'Derechos Humanos y Memorias Sociales', 1, 2, '', NULL, 0, NULL, 'Anual'),
(104, 'Teorías Psicológicas Contemporáneas', 1, 3, '', NULL, 0, NULL, 'Anual'),
(105, 'Teorías del Desarrollo I. Infancia y Adolescencia', 1, 3, '', NULL, 0, NULL, 'Anual'),
(106, 'Prácticas en Psicolgerontología I. Introducción al Campo.', 1, 3, '', NULL, 0, NULL, 'Anual'),
(107, 'Prácticas en Psicolgerontología II. Contextos Sociocomunitarios', 2, 10, '', NULL, 0, NULL, 'Anual'),
(108, 'Psicoanálisis', 2, 4, '', NULL, 0, NULL, 'Anual'),
(109, 'Teorías del Desarrollo II. Adultez y Vejez', 2, 3, '', NULL, 0, NULL, 'Anual'),
(110, 'Salud Pública. Salud Mental', 2, 5, '', NULL, 0, NULL, 'Anual'),
(111, 'Neurobiología', 2, 3, '', NULL, 0, NULL, 'Anual'),
(112, 'Psicopatología', 3, 4, '', NULL, 0, NULL, 'Anual'),
(113, 'Prácticas en Psicolgerontología III. Instituciones Gerontológicas y de Salud.', 3, 10, '', NULL, 0, NULL, 'Anual'),
(114, 'Proyecto de Intervención en Programas y Organizaciones Sociales', 0, 5, '', NULL, 0, NULL, 'Anual'),
(115, 'Un nivel de idioma (Alemán o Francés o Italiano o Portugués)', 3, 32, '', NULL, 0, NULL, '1º Cuatrimestre'),
(116, 'Epistemología', 1, 3, '', NULL, 1, NULL, '1º Cuatrimestre'),
(117, 'Semiótica', 1, 3, '', NULL, 1, NULL, '2º Cuatrimestre'),
(118, 'Teoría Social y del Estado', 1, 3, '', NULL, 1, NULL, '1º Cuatrimestre'),
(119, 'Introducción a la Filosofía', 1, 4, '', NULL, 1, NULL, 'Anual'),
(120, 'Problemática Epistemológica  de la Psicología', 1, 4, '', NULL, 1, NULL, 'Anual'),
(121, 'Corrientes de la Psicología Contemporánea I', 1, 4, '', NULL, 1, NULL, 'Anual'),
(122, 'Psicología del Desarrollo I', 1, 3, '', NULL, 1, NULL, 'Anual'),
(123, 'Antropología', 2, 4, '', NULL, 1, NULL, 'Anual'),
(124, 'Teoría Psicoanalítica ', 2, 5, '', NULL, 1, NULL, 'Anual'),
(125, 'Corrientes de la Psicología  Contemporánea II', 2, 4, '', NULL, 1, NULL, 'Anual'),
(126, 'Psicología del Desarrollo II', 2, 3, '', NULL, 1, NULL, 'Anual'),
(127, 'Seminario de Psicogerontología', 3, 24, '', NULL, 1, NULL, 'Anual'),
(128, 'Psicología del Desarrollo III', 3, 3, '', NULL, 1, NULL, 'Anual'),
(129, 'Un nivel de idioma', 3, 3, '', NULL, 1, NULL, 'Anual'),
(130, 'Informática Nivel I', 3, 3, '', NULL, 1, NULL, 'Anual'),
(131, ' Lógica', 1, 0, '', NULL, 0, NULL, 'Anual'),
(132, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(133, 'Teoría Social  y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(134, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(135, ' Historia de la Filosofía Antigua', 1, 4, '', NULL, 0, NULL, 'Anual'),
(136, ' Historia de la Filosofía Antigua', 1, 4, '', NULL, 0, NULL, 'Anual'),
(137, 'Seminario sobre Pensamiento y Cultura', 1, 4, '', NULL, 0, NULL, 'Anual'),
(138, 'Griego', 0, 3, '', NULL, 0, NULL, 'Anual'),
(139, ' Introducción a la Filosofía', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(140, 'Historia de la Filosofía Medieval y del Renacimiento', 2, 5, '', NULL, 0, NULL, 'Anual'),
(141, ' Metodología de la Investigación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(142, ' Latín', 2, 3, '', NULL, 0, NULL, 'Anual'),
(143, 'Metafísica', 0, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(144, 'Teoría del Conocimiento', 2, 5, '', NULL, 0, NULL, '2º Cuatrimestre'),
(145, ' Antropología Filosófica', 2, 4, '', NULL, 0, NULL, 'Anual'),
(146, 'Seminario de Investigación I', 2, 4, '', NULL, 0, NULL, 'Anual'),
(147, 'Historia de la Filosofía Moderna', 3, 5, '', NULL, 0, NULL, 'Anual'),
(148, ' Filosofía de la Ciencia', 3, 4, '', NULL, 0, NULL, 'Anual'),
(149, 'Filosofía de la Cultura', 3, 4, '', NULL, 0, NULL, 'Anual'),
(150, 'Seminario de la Investigación II', 3, 4, '', NULL, 0, NULL, 'Anual'),
(151, ' Ética', 3, 4, '', NULL, 0, NULL, 'Anual'),
(152, ' Corrientes Actuales de la Filosofía', 4, 5, '', NULL, 0, NULL, 'Anual'),
(153, 'Filosofía del Lenguaje', 4, 5, '', NULL, 0, NULL, 'Anual'),
(154, ' Estética', 4, 4, '', NULL, 0, NULL, 'Anual'),
(155, ' Filosofía Política', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(156, ' Filosofía del Derecho', 4, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(157, ' Filosofía de la Historia', 4, 4, '', NULL, 0, NULL, 'Anual'),
(158, 'Seminario de Tesis', 4, 5, '', NULL, 0, NULL, 'Anual'),
(159, 'Dos Niveles de Idioma Inglés o Francés', 5, 0, '', NULL, 0, NULL, 'Anual'),
(160, 'Nivel de Idioma I', 5, 0, '', NULL, 0, NULL, 'Anual'),
(161, 'Nivel de Idioma II', 5, 0, '', NULL, 0, NULL, 'Anual'),
(162, 'Nivel de Idioma III ', 5, 0, '', NULL, 0, NULL, 'Anual'),
(163, 'Epistemología', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(164, 'Teoría Social  y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(165, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(166, 'Lengua Francesa I', 1, 6, '', NULL, 0, NULL, 'Anual'),
(167, 'Fonética y Fonología Francesas I ', 1, 3, '', NULL, 0, NULL, 'Anual'),
(168, 'Gramática Francesa I  ', 1, 3, '', NULL, 0, NULL, 'Anual'),
(169, 'Taller de Expresión Oral y Escrita I      ', 1, 2, '', NULL, 0, NULL, 'Anual'),
(170, 'Introducción a los  Estudios Sociales  ', 1, 2, '', NULL, 0, NULL, 'Anual'),
(171, 'Lengua y Cultura Latina I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(172, 'Lengua Española', 1, 3, '', NULL, 0, NULL, 'Anual'),
(173, 'Introducción a la Traductología', 1, 2, '', NULL, 0, NULL, 'Anual'),
(174, 'Lengua Francesa II ', 2, 4, '', NULL, 0, NULL, 'Anual'),
(175, 'Fonética y Fonología Francesas II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(176, 'Gramática Francesa II ', 2, 3, '', NULL, 0, NULL, 'Anual'),
(177, 'Taller de Expresión Oral y Escrita II', 2, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(178, 'Estudios Sociales y Literarios', 2, 3, '', NULL, 0, NULL, 'Anual'),
(179, 'Lengua y Cultura Latina II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(180, 'Métodos y Técnicas de la Traducción', 2, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(181, 'Lengua Francesa III          ', 3, 4, '', NULL, 0, NULL, 'Anual'),
(182, 'Fonética y Fonología Francesas III  ', 3, 2, '', NULL, 0, NULL, 'Anual'),
(183, 'Fonética y Fonología Francesas III  ', 3, 2, '', NULL, 0, NULL, 'Anual'),
(184, 'Ciencias del Lenguaje I', 3, 2, '', NULL, 0, NULL, 'Anual'),
(185, 'Civilización Francesa I ', 3, 2, '', NULL, 0, NULL, 'Anual'),
(186, 'Literatura Francesa I    ', 3, 2, '', NULL, 0, NULL, 'Anual'),
(187, 'Introducción a la Traducción Jurídica', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(188, 'Introducción a la Traducción Comercial', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(189, 'Traducción Técnica', 3, 3, '', NULL, 0, NULL, 'Anual'),
(190, 'Traducción Científica', 3, 3, '', NULL, 0, NULL, 'Anual'),
(191, 'Lengua Francesa IV', 4, 4, '', NULL, 0, NULL, 'Anual'),
(192, 'Ciencias del Lenguaje II ', 4, 2, '', NULL, 0, NULL, 'Anual'),
(193, 'Seminario de Estudios Comparados', 4, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(194, 'Residencia de la Traducción', 4, 4, '', NULL, 0, NULL, 'Anual'),
(195, 'Francofonía     ', 4, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(196, 'Introducción  a la Interpretación', 4, 4, '', NULL, 0, NULL, 'Anual'),
(197, 'Dos Niveles de Idiomas ', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(198, 'Dos Niveles de Informática', 4, 3, '', NULL, 0, NULL, 'Anual'),
(199, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(200, 'Teoría Social  y del Estado', 0, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(201, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(202, 'Introducción a la Geografía', 1, 4, '', NULL, 0, NULL, 'Anual'),
(203, 'Geografía Física I', 1, 4, '', NULL, 0, NULL, 'Anual'),
(204, 'Geografía Económica', 1, 4, '', NULL, 0, NULL, 'Anual'),
(205, 'Técnicas de Trabajo en Geografía I', 1, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(206, 'Técnicas de Trabajo en Geografía II', 1, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(207, 'Pedagogía', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(208, ' Didáctica', 2, 3, '', NULL, 0, NULL, 'Anual'),
(209, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(210, 'Problemática del Aprendizaje', 2, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(211, 'Seminario de la Práctica Docente I', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(212, 'Geografía Social', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(213, 'Geografía Física II', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(214, 'Metodología de la Investigación Geográfica', 2, 3, '', NULL, 0, NULL, 'Anual'),
(215, 'Derechos Humanos', 2, 2, '', NULL, 0, NULL, 'Anual'),
(216, 'Didáctica de la geografía y las ciencias sociales', 3, 3, '', NULL, 0, NULL, 'Anual'),
(217, 'Seminario de la práctica docente II', 3, 4, '', NULL, 0, NULL, 'Anual'),
(218, 'Organización del Espacio Argentino', 3, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(219, 'Geografía Urbana', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(220, 'Geografía Rural', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(221, 'Geografía Cultural', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(222, 'Geografía Ambiental', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(223, 'Geografía de las Actividades Económicas', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(224, ' Investigación Educativa', 4, 3, '', NULL, 0, NULL, 'Anual'),
(225, ' Análisis Institucional', 4, 3, '', NULL, 0, NULL, 'Anual'),
(226, 'Política Educativa', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(227, 'Taller de Acción Educativa', 4, 20, '', NULL, 0, NULL, 'Anual'),
(228, 'Idioma Extranjero I', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(229, 'Idioma Extranjero I', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(230, 'Idioma Extranjero II', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(231, 'Informática I', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(232, 'Informática II', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(233, 'Informática II', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(234, 'Teoría e Historia de la Geografía', 4, 4, '', NULL, 0, NULL, 'Anual'),
(235, 'Planeamiento y Ordenamiento Territorial', 4, 4, '', NULL, 0, NULL, 'Anual'),
(236, 'Análisis Territorial', 4, 4, '', NULL, 0, NULL, 'Anual'),
(237, 'Geografía del Turismo', 4, 3, '', NULL, 0, NULL, 'Anual'),
(239, 'Seminario I - Cuidades Intermedias y Territorio. Perspectivas Teóricas y Estudios de Caso-', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(240, 'Seminario II- Catástrofes Naturales Inducidas por el Hombre', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(241, 'Seminario de Tesis de Licenciatura', 5, 5, '', NULL, 0, NULL, 'Anual'),
(242, 'Seminario III- Integración Economía y Territorio', 5, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(243, 'Elaboración de Tesis', 5, 15, '', NULL, 0, NULL, 'Anual'),
(244, 'Idioma Extranjero I', 5, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(245, 'Idioma Extranjero II', 5, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(246, 'Informática I', 5, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(247, 'Informática II', 5, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(248, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(249, 'Teoría Social  y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(250, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(251, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(252, 'Geografia Histórica', 1, 2, '', NULL, 0, NULL, 'Anual'),
(253, 'Espacio y Civilización. Mundo Antiguo: Sociedades Orientales', 1, 3, '', NULL, 0, NULL, 'Anual'),
(254, 'Espacio y Civilización. Mundo Antiguo: Sociedades Grecolatinas', 1, 4, '', NULL, 0, NULL, 'Anual'),
(255, 'Historia Americana I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(256, 'Antropología ', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(257, 'Economía ', 1, 2, '', NULL, 0, NULL, 'Anual'),
(258, 'Epistemología de la Historia', 2, 3, '', NULL, 0, NULL, 'Anual'),
(259, 'Espacio y Civilización. Medioevo: Sociedades Feudales', 2, 3, '', NULL, 0, NULL, 'Anual'),
(260, 'Historia Argentina I', 2, 4, '', NULL, 0, NULL, 'Anual'),
(261, 'Historia Americana II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(262, 'Seminario I', 2, 6, '', NULL, 0, NULL, 'Anual'),
(263, 'Historia de la Historiografía', 2, 3, '', NULL, 0, NULL, 'Anual'),
(264, 'Historia del Arte ', 2, 2, '', NULL, 0, NULL, 'Anual'),
(265, 'Seminario II', 3, 4, '', NULL, 0, NULL, 'Anual'),
(267, 'Paleografía y Diplomatica', 3, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(268, 'Espacio y Civilización. Modernidad. Sociedades Capitalistas', 3, 3, '', NULL, 0, NULL, 'Anual'),
(269, 'Historia Americana III', 3, 3, '', NULL, 0, NULL, 'Anual'),
(270, 'Historia Argentina II', 3, 4, '', NULL, 0, NULL, 'Anual'),
(271, 'Metodología de la Investigación Histórica I', 3, 6, '', NULL, 0, NULL, '1º Cuatrimestre'),
(272, 'Seminario III', 3, 10, '', NULL, 0, NULL, 'Anual'),
(273, 'Espacio y Civilización. Sociedades Contemporáneas', 4, 3, '', NULL, 0, NULL, 'Anual'),
(274, 'Historia Argentina III', 4, 3, '', NULL, 0, NULL, 'Anual'),
(275, 'Lectura de Discursos Historeográficos', 4, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(276, 'Análisis Histórico del Presente', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(277, 'Metodología de la Investigación Historica II', 4, 4, '', NULL, 0, NULL, 'Anual'),
(278, 'Derechos Humanos', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(279, 'Seminario IV', 5, 12, '', NULL, 0, NULL, 'Anual'),
(280, 'Teoría Política', 5, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(281, 'Corrientes filosóficas Contemporáneas', 5, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(282, 'Historia y Literatura', 5, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(283, 'Nivel de Idioma I', 5, 0, '', NULL, 0, NULL, 'Anual'),
(284, 'Nivel de Idioma II', 5, 0, '', NULL, 0, NULL, 'Anual'),
(285, 'Nivel de Idioma III', 5, 0, '', NULL, 0, NULL, 'Anual'),
(286, 'Nivel de Idioma Inglés', 5, 0, '', NULL, 0, NULL, 'Anual'),
(287, ' Epistemología', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(288, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(289, ' Lengua Inglesa I', 1, 6, '', NULL, 0, NULL, 'Anual'),
(290, 'Fonética y Fonología I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(291, 'Gramática I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(292, 'Taller Integrador de Habilidades Lingüísticas', 1, 3, '', NULL, 0, NULL, 'Anual'),
(293, 'Civilización y Cultura de los Países de Habla Inglesa I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(294, 'Civilización y Cultura de los Países de Habla Inglesa I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(295, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(296, 'Pedagogía', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(297, ' Problemática del Aprendizaje', 2, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(298, 'Didáctica', 2, 3, '', NULL, 0, NULL, 'Anual'),
(299, 'Didáctica de las Lenguas Extranjeras I', 2, 3, '', NULL, 0, NULL, 'Anual'),
(300, ' Lengua Inglesa II', 2, 5, '', NULL, 0, NULL, 'Anual'),
(301, ' Fonética y Fonología II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(302, 'Ciencias del Lenguaje I', 2, 2, '', NULL, 0, NULL, 'Anual'),
(303, ' Civilización y Cultura de los Países de Habla Inglesa II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(304, ' Gramática II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(305, 'Análisis Institucional', 3, 3, '', NULL, 0, NULL, 'Anual'),
(306, 'Política Educativa', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(307, 'Investigación Educativa', 3, 3, '', NULL, 0, NULL, 'Anual'),
(308, 'Seminario de la Práctica Docente I', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(309, ' Didáctica de las Lenguas Extranjeras II', 3, 3, '', NULL, 0, NULL, 'Anual'),
(310, ' Lengua Inglesa III', 3, 4, '', NULL, 0, NULL, 'Anual'),
(311, 'Fonética y Fonología III', 3, 2, '', NULL, 0, NULL, 'Anual'),
(312, ' Estructuras Comparadas', 3, 2, '', NULL, 0, NULL, 'Anual'),
(313, ' Literatura de los Países de Habla Inglesa I', 3, 3, '', NULL, 0, NULL, 'Anual'),
(314, 'Seminario de la Práctica Docente II', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(315, 'Taller de Acción Educativa', 4, 15, '', NULL, 0, NULL, 'Anual'),
(316, ' Lengua Inglesa IV', 4, 4, '', NULL, 0, NULL, 'Anual'),
(317, 'Ciencias del Lenguaje III', 4, 2, '', NULL, 0, NULL, 'Anual'),
(318, 'Literatura de los Países de Habla Inglesa II', 4, 3, '', NULL, 0, NULL, 'Anual'),
(319, 'Derechos Humanos', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(320, 'Dos Niveles  Lengua Extranjera', 4, 3, '', NULL, 0, NULL, 'Anual'),
(321, 'Francés I', 4, 0, '', NULL, 0, NULL, 'Anual'),
(322, 'Francés II', 4, 0, '', NULL, 0, NULL, 'Anual'),
(323, 'Informática', 4, 3, '', NULL, 0, NULL, 'Anual'),
(324, 'Nivel de Idioma I', 4, 3, '', NULL, 0, NULL, 'Anual'),
(325, 'Nivel de Idioma II ', 4, 3, '', NULL, 0, NULL, 'Anual'),
(326, 'Nivel de Idioma III', 4, 3, '', NULL, 0, NULL, 'Anual'),
(327, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(328, 'Pedagogía', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(329, 'Problemática Antropológica de la Educación', 1, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(330, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(331, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(332, 'Didáctica ', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(333, 'Psicología Educacional I', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(334, 'Arte y Educación ', 1, 3, '', NULL, 0, NULL, 'Anual'),
(335, 'Didáctica de la Lengua y la Literatura I', 1, 2, '', NULL, 0, NULL, 'Anual'),
(336, 'Didáctica de las Ciencias Naturales I', 1, 2, '', NULL, 0, NULL, 'Anual'),
(337, 'Didáctica de la Matemática I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(338, 'Didáctica de las Ciencias Sociales I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(339, 'Alfaberización Académica', 1, 2, '', NULL, 0, NULL, 'Anual'),
(340, 'Psicología del desarrollo ', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(341, 'Didáctica de las Ciencias Naturales II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(342, 'Didáctica de las Ciencias Naturales II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(343, 'Problemática de la Educación Inicial', 2, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(344, 'Didáctica de la Educación Artística', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(345, 'Psicología Educacional II', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(346, 'Problemas de la Historia Social Argentina', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(347, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(348, 'Didáctica de la Lengua y la Literatura II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(349, 'Didáctica de la Matemática II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(350, 'Didáctica de la Ciencias Sociales II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(351, 'Investigación Educativa I. Contextos y Prácticas Educativas', 2, 2, '', NULL, 0, NULL, 'Anual'),
(352, 'Prácticas Docentes I: Contextos y Prácticas Educativas', 2, 3, '', NULL, 0, NULL, 'Anual'),
(353, 'Didáctica de la Educación Física', 3, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(354, 'Seminario de Literatura para niños', 3, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(355, 'Didáctica de la Educación Tecnológica', 3, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(356, 'Problemáticas Históricas Latinoamericanas', 3, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(357, 'Educación y Tecnologías de la Información y la Comunicación', 3, 2, '', NULL, 0, NULL, '2º Cuatrimestre'),
(358, 'Análisis Institucional', 3, 3, '', NULL, 0, NULL, 'Anual'),
(359, 'Seminario Taller Jardines Maternales', 3, 3, '', NULL, 0, NULL, 'Anual'),
(360, 'Taller de lenguajes audiovisuales y Materiales Educativos', 3, 2, '', NULL, 0, NULL, 'Anual'),
(361, 'Taller de Expresión Creativa', 3, 2, '', NULL, 0, NULL, 'Anual'),
(362, 'Investigación Educativa II. Prácticas de enseñanza y Cotidianeidad  ', 3, 2, '', NULL, 0, NULL, 'Anual'),
(363, 'Prácticas Docentes II: Prácticas de Enseñanza y Cotidianeidad', 3, 6, '', NULL, 0, NULL, 'Anual'),
(365, 'Educación para la Salud', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(366, 'Taller de Sexualidad Humana', 4, 2, '', NULL, 0, NULL, '1º Cuatrimestre'),
(367, 'Política Educativa', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(368, 'Seminario Contexto Laboral y Trabajo Docente', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(369, 'Seminario Contexto Laboral y Trabajo Docente', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(370, 'Derechos Humanos y Memorias Sociales', 4, 2, '', NULL, 0, NULL, 'Anual'),
(371, 'Investigación Educativa III. Prácticas institucionales', 4, 2, '', NULL, 0, NULL, 'Anual'),
(372, 'Investigación Educativa III. Prácticas institucionales', 4, 2, '', NULL, 0, NULL, 'Anual'),
(373, 'Prácticas Docentes III. Educacion Inicial: Prácticas institucionales', 4, 10, '', NULL, 0, NULL, 'Anual'),
(374, 'Literatura para maternal', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(375, 'Infancias: configuración social, historia y actualidad', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(376, 'Literatura para maternal', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(377, 'Infancias: configuración social, historia y actualidad', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(378, 'Pobrezas: contextos y dimensiones', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(379, 'Construyendo nuevos escenarios. La construcción social de la discapacidad', 4, 32, '', NULL, 0, NULL, 'Anual'),
(380, 'Violencias sociales y violencias en contextos escolares', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(381, 'Memorias sociales y educativas', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(382, 'La problemática del abuso infantil: estado, familia y escuela', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(383, 'Trabajo infantil y educación: sujetos y contextos', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(384, 'Estado, escuela y familia. Configuraciones históricas y problemáticas actuales', 4, 32, '', NULL, 0, NULL, '2º Cuatrimestre'),
(385, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(386, 'Teoría Social  y del Estado', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(387, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(388, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(389, 'Teoría Social  y del Estado', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(390, 'Latín ', 1, 3, '', NULL, 0, NULL, 'Anual'),
(391, 'Lengua Italiana I', 1, 6, '', NULL, 0, NULL, 'Anual'),
(393, 'Gramática Italiana I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(394, 'Fonética y Fonología I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(395, 'Civilización Italiana I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(396, 'Métodos y Técnicas de Traducción', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(397, 'Terminología y Documentación', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(398, 'Terminología y Documentación', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(399, 'Teoría y Práctica de la Investigación', 2, 4, '', NULL, 0, NULL, 'Anual'),
(400, 'Lengua Italiana II', 2, 6, '', NULL, 0, NULL, 'Anual'),
(401, 'Gramática Italiana II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(402, 'Fonética y Fonología II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(403, 'Literatura Italiana I', 2, 4, '', NULL, 0, NULL, 'Anual'),
(405, 'Elementos de Derecho aplicados a la Traducción', 3, 4, '', NULL, 0, NULL, 'Anual'),
(406, 'Derechos Humanos', 3, 2, '', NULL, 0, NULL, 'Anual'),
(407, 'Lengua Española I', 3, 4, '', NULL, 0, NULL, 'Anual'),
(408, 'Lengua Italiana III', 3, 6, '', NULL, 0, NULL, 'Anual'),
(409, 'Lingüística I', 3, 3, '', NULL, 0, NULL, 'Anual'),
(410, 'Civilización Italiana II', 3, 3, '', NULL, 0, NULL, 'Anual'),
(411, 'Gramática Italiana III', 3, 3, '', NULL, 0, NULL, 'Anual'),
(412, 'Traducción Periodistica', 4, 4, '', NULL, 0, NULL, 'Anual'),
(413, 'Traducción Comercial', 4, 4, '', NULL, 0, NULL, 'Anual'),
(414, 'Traducción Comercial', 4, 4, '', NULL, 0, NULL, 'Anual'),
(415, 'Gramática Contrastiva', 4, 4, '', NULL, 0, NULL, 'Anual'),
(416, 'Lengua Italiana IV', 4, 6, '', NULL, 0, NULL, 'Anual'),
(417, 'Historia de la Lengua Italiana', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(418, 'Historia de la Lengua Italiana', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(419, 'Lengua Española II', 4, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(420, 'Literatura Italiana II', 4, 3, '', NULL, 0, NULL, 'Anual'),
(421, 'Civilización Italiana III', 4, 3, '', NULL, 0, NULL, 'Anual'),
(422, 'Traducción Científica y Técnica', 4, 4, '', NULL, 0, NULL, 'Anual'),
(423, 'Traducción Científica y Técnica', 5, 4, '', NULL, 0, NULL, 'Anual'),
(424, 'Traducción Jurídica', 5, 4, '', NULL, 0, NULL, 'Anual'),
(425, 'Traducción Literaria', 5, 4, '', NULL, 0, NULL, 'Anual'),
(426, 'Lengua Italiana V', 5, 6, '', NULL, 0, NULL, 'Anual'),
(427, 'Laboratorio de Interpretación', 5, 6, '', NULL, 0, NULL, 'Anual'),
(428, 'Lingüística II', 5, 3, '', NULL, 0, NULL, 'Anual'),
(429, 'Lingüística II', 5, 3, '', NULL, 0, NULL, 'Anual'),
(430, 'un nivel  de lengua extranjera', 5, 3, '', NULL, 0, NULL, 'Anual'),
(431, 'Epistemología', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(432, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(433, 'Semiótica ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(434, ' Didáctica', 2, 3, '', NULL, 0, NULL, 'Anual'),
(435, 'Pedagogía ', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(436, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(437, 'Problemática del Aprendizaje', 2, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(438, 'Lenguaje Musical I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(439, 'Instrumento Armónico I (opción) Piano', 1, 2, '', NULL, 0, NULL, 'Anual'),
(440, 'Conjunto Vocal Instrumental I', 1, 2, '', NULL, 0, NULL, 'Anual'),
(441, 'Educación Vocal I', 1, 2, '', NULL, 0, NULL, 'Anual'),
(443, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(444, 'Historia Social y Política  de las Músicas  ', 1, 2, '', NULL, 0, NULL, 'Anual'),
(445, 'Pedagogía', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(446, 'Didáctica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(447, 'Lenguaje Musical II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(448, 'Instrumento Armónico II  (opción) Piano', 2, 2, '', NULL, 0, NULL, 'Anual'),
(449, 'Conjunto Vocal Instrumental II', 0, 3, '', NULL, 0, NULL, 'Anual'),
(450, 'Educación Vocal II', 2, 2, '', NULL, 0, NULL, 'Anual'),
(451, 'Historia Social y Política de las Músicas Latinoamericanas y Argentinas', 2, 2, '', NULL, 0, NULL, 'Anual'),
(452, 'Práctica Docente I. Proyectos Musicales en Contextos Socio Comunitarios.', 2, 3, '', NULL, 0, NULL, 'Anual'),
(453, 'Epistemología  ', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(454, 'Psicología Educacional  ', 2, 3, '', NULL, 0, NULL, 'Anual'),
(455, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(456, 'Trabajo Corporal', 2, 2, '', NULL, 0, NULL, 'Anual'),
(457, 'Semiótica ', 2, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(458, 'Lenguaje Musical III', 3, 2, '', NULL, 0, NULL, 'Anual'),
(459, 'Instrumento Armónico III  (opción) Piano', 3, 2, '', NULL, 0, NULL, 'Anual'),
(460, 'Sistema de Estructuras y Texturas I', 3, 3, '', NULL, 0, NULL, 'Anual'),
(461, 'Conjunto Vocal Instrumental III', 3, 3, '', NULL, 0, NULL, 'Anual'),
(462, 'Didactica de la Musica', 3, 4, '', NULL, 0, NULL, 'Anual'),
(463, 'Prácticas Docentes II Proyectos Musicales y Cotidianeidad Escolar ', 3, 5, '', NULL, 0, NULL, 'Anual'),
(464, 'Análisis Institucional  ', 3, 3, '', NULL, 0, NULL, 'Anual'),
(465, 'Sistemas, Estructuras y Texturas II', 4, 3, '', NULL, 0, NULL, 'Anual'),
(466, 'Instrumento Armónico IV  (opción) Piano', 4, 2, '', NULL, 0, NULL, 'Anual'),
(467, 'Instrumento Armónico IV  (opción) Piano', 4, 2, '', NULL, 0, NULL, 'Anual'),
(468, 'Instrumento Armonico Complementario I (opciòn) Guitarra', 4, 2, '', NULL, 0, NULL, 'Anual'),
(469, 'Prácticas Docentes III. Propuestas de enseñanza musical en la Educacion Obligatoria', 4, 5, '', NULL, 0, NULL, 'Anual'),
(470, 'Derechos Humanos y Memorias Sociales', 4, 3, '', NULL, 0, NULL, 'Anual'),
(471, 'Taller de Danzas Populares y Folcloricas Argentinas', 4, 2, '', NULL, 0, NULL, 'Anual'),
(472, 'Folclore Musical Argentino ', 4, 2, '', NULL, 0, NULL, 'Anual'),
(473, 'Problemática Socioantropologica de las Musicas', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(474, 'Tecnologias del aprendizaje y la comprension en Musica', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(475, 'Instrumento Armonico Complementario II (opcion) Guitarra', 5, 2, '', NULL, 0, NULL, 'Anual'),
(476, 'Musicas Folclóricas y Populares Americanas', 5, 2, '', NULL, 0, NULL, 'Anual'),
(477, 'Investigaccion Educativa ', 5, 3, '', NULL, 0, NULL, 'Anual'),
(478, 'Practicas Docentes IV. Propuestas de Enseñanza Musical en Modalidades del Sistema Educativo', 5, 5, '', NULL, 0, NULL, 'Anual'),
(479, 'Historia y Politica de la Educacion Argentina', 5, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(480, 'Producciones integradas entre diferentes lenguajes', 5, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(481, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(482, 'Teoría Social  y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(483, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(484, 'Lengua Portuguesa I', 1, 6, '', NULL, 0, NULL, 'Anual'),
(485, 'Gramática Portuguesa I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(486, ' Fonética y Fonología I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(487, ' Introducción a los Estudios Sociales y Literarios', 1, 3, '', NULL, 0, NULL, 'Anual'),
(488, ' Pedagogía ', 2, 3, '', NULL, 0, NULL, 'Anual'),
(489, ' Problemática del Aprendizaje', 2, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(490, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(491, ' Didáctica', 2, 3, '', NULL, 0, NULL, 'Anual'),
(492, ' Lengua Portuguesa II', 2, 6, '', NULL, 0, NULL, 'Anual'),
(493, ' Gramática Portuguesa II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(494, ' Fonética y Fonología II', 2, 3, '', NULL, 0, NULL, 'Anual'),
(495, ' Didáctica de la Lengua y Cultura Extranjera I', 2, 3, '', NULL, 0, NULL, 'Anual'),
(496, ' Ciencias del Lenguaje I', 2, 3, '', NULL, 0, NULL, 'Anual'),
(497, ' Análisis Institucional', 3, 3, '', NULL, 0, NULL, 'Anual'),
(498, ' Investigación Educativa', 3, 3, '', NULL, 0, NULL, 'Anual'),
(499, ' Política Educativa', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(500, 'Lengua Portuguesa III', 3, 5, '', NULL, 0, NULL, 'Anual'),
(501, ' Gramática Portuguesa III', 3, 4, '', NULL, 0, NULL, 'Anual'),
(502, 'Estudios Sociales y Literarios Comparados I', 3, 4, '', NULL, 0, NULL, 'Anual'),
(503, 'Didáctica de la Lengua y Cultura Extranjera II', 3, 3, '', NULL, 0, NULL, 'Anual'),
(504, 'Ciencias del Lenguaje II', 3, 3, '', NULL, 0, NULL, 'Anual'),
(505, 'Taller de Acción Educativa', 4, 15, '', NULL, 0, NULL, 'Anual'),
(506, ' Lengua Portuguesa IV', 4, 4, '', NULL, 0, NULL, 'Anual'),
(507, 'Análisis Contrastivo Portugues - Español', 4, 2, '', NULL, 0, NULL, 'Anual'),
(508, ' Estudios Sociales y Literarios Comparados II', 4, 3, '', NULL, 0, NULL, 'Anual'),
(509, ' Seminario Integral', 4, 3, '', NULL, 0, NULL, 'Anual'),
(510, 'Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(511, 'Pedagogía', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(512, 'Problemática Antropológica de la Educación', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(513, 'Semiótica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(514, 'Didáctica', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(515, 'Psicología Educacional I', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(516, 'Arte y Educación ', 1, 3, '', NULL, 0, NULL, 'Anual'),
(517, 'Didáctica de la Lengua y la Literatura I', 1, 2, '', NULL, 0, NULL, 'Anual'),
(518, 'Didáctica de las Ciencias Naturales I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(519, 'Didactica de la Matematica I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(520, 'Didáctica de las Ciencias Sociales I', 1, 3, '', NULL, 0, NULL, 'Anual'),
(521, 'Alfaberización Académica', 1, 2, '', NULL, 0, NULL, 'Anual'),
(522, 'Psicología del Desarrollo', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(523, 'Didáctica de la Educación Artística', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(524, 'Problemas de la Historia Social Argentina', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(525, 'Problemas de la Historia Social Argentina', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(526, 'Psicología Educacional II', 2, 4, '', NULL, 0, NULL, '2º Cuatrimestre'),
(527, 'Sociología de la Educación', 2, 3, '', NULL, 0, NULL, 'Anual'),
(528, 'Didáctica de la Lengua y la Literatura II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(529, 'Didáctica de las Ciencias Naturales II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(530, 'Didáctica de la Matemática II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(531, 'Didáctica de las Ciencias Sociales II', 2, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(532, 'Investigación Educativa I. Contextos y Prácticas Educativas', 2, 2, '', NULL, 0, NULL, 'Anual'),
(533, 'Prácticas Docentes I: Contextos y Prácticas', 2, 3, '', NULL, 0, NULL, 'Anual'),
(534, 'Didáctica de la Lengua y la Literatura III', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(535, 'Didactica de la Matemática III', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(536, 'Didáctica de las Ciencias Sociales III', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(537, 'Didáctica de la Educacion Fisica', 3, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(538, 'Educación y Tecnologias de la Informacion y la Comunicación ', 3, 2, '', NULL, 0, NULL, '2º Cuatrimestre'),
(539, 'Didáctica de la Educacion Tecnologica', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(540, 'Problemáticas Históricas Latinoamericanas', 3, 2, '', NULL, 0, NULL, '2º Cuatrimestre'),
(541, 'Análisis Institucional', 3, 3, '', NULL, 0, NULL, 'Anual'),
(542, 'Taller de Expresión Creativa', 3, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(543, 'Investigacion Educativa II. Escuela, Juventudes y cotidianeidad', 3, 2, '', NULL, 0, NULL, 'Anual'),
(544, 'Practicas docentes II. Escuela y cotidianeidad', 3, 7, '', NULL, 0, NULL, 'Anual'),
(545, 'Educación para la Salud', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(546, 'Política Educativa', 4, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(547, 'Taller de Sexualidad Humana', 4, 2, '', NULL, 0, NULL, '2º Cuatrimestre'),
(548, 'Taller de Sexualidad Humana', 4, 2, '', NULL, 0, NULL, '2º Cuatrimestre'),
(549, 'Seminario Contexto Laboral y Trabajo Docente', 4, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(550, 'Derechos Humanos y Memorias Sociales', 4, 2, '', NULL, 0, NULL, 'Anual'),
(551, 'Investigacion Educativa III. Aula y Escuela, Espacios de Aprender y Enseñar', 4, 2, '', NULL, 0, NULL, 'Anual'),
(552, 'Prácticas Docentes III. Aula y Escuela, Espacios de Aprender y Enseñar', 4, 10, '', NULL, 0, NULL, 'Anual'),
(553, 'Infancias: Configuaracion Social, Historica y Actualidad', 4, 32, 'Seminarios optativos', NULL, 0, NULL, '1º Cuatrimestre'),
(554, 'Pobrezas: Contextos y Dimensiones', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(555, 'La Produccion Social de la Discapacidad', 4, 32, '', NULL, 0, NULL, '1º Cuatrimestre'),
(556, 'Violencias Sociales y Violencias en Contextos Escolares', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(557, 'Memorias Sociales y Educativas', 4, 32, '', NULL, 0, NULL, '1º Cuatrimestre'),
(558, 'La Problemática del Abuso Infantil: Estado- Familia y Escuela.', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(559, 'Trabajo Infantil y Educacion: Sujetos y Contextos', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(560, 'Estado, Escuela y Familia. Configuraciones Históricas y Problemáticas Actuales', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(561, 'Lenguajes Audiovisuales y Tecnologia Educativa', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(562, 'Construyendo nuevos escenarios: reflexiones en torno a la construcción social de la discapacidad', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(563, 'Psicologia Social en el campo educativo I y II', 4, 32, 'Seminario Optativo', NULL, 0, NULL, '1º Cuatrimestre'),
(564, ' Introducción a los Estudios Lingüísticos', 1, 2, '', NULL, 8, NULL, 'Anual'),
(565, ' Introducción a los Estudios Literarios', 1, 3, '', NULL, 8, NULL, 'Anual'),
(568, ' Literatura Grecolatina', 1, 2, '', NULL, 8, NULL, 'Anual'),
(569, 'Taller de Expresión Oral y Escrita', 1, 3, '', NULL, 8, NULL, 'Anual'),
(570, ' Latín  y Cultura Latina I', 1, 3, '', NULL, 8, NULL, 'Anual'),
(571, ' Epistemología', 1, 3, '', NULL, 8, NULL, '1º Cuatrimestre'),
(572, ' Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(573, 'Semiótica', 1, 3, '', NULL, 8, NULL, '2º Cuatrimestre'),
(574, ' Literatura Española I', 2, 3, '', NULL, 8, NULL, 'Anual'),
(575, ' Lengua Española I', 2, 3, '', NULL, 0, NULL, 'Anual'),
(576, ' Latín y Cultura Latina II', 2, 3, '', NULL, 8, NULL, 'Anual'),
(577, ' Lingüística I', 2, 3, '', NULL, 8, NULL, 'Anual'),
(578, 'Griego y Cultura Griega I', 2, 3, '', NULL, 8, NULL, 'Anual'),
(579, ' Literatura Francesa e Italiana', 2, 3, '', NULL, 8, NULL, 'Anual'),
(580, ' Pedagogía', 2, 3, '', NULL, 8, NULL, '1º Cuatrimestre'),
(581, ' Didáctica', 2, 3, '', NULL, 8, NULL, 'Anual'),
(582, ' Sociología de la Educación', 0, 3, '', NULL, 8, NULL, 'Anual'),
(583, ' Problemática del Aprendizaje', 2, 3, '', NULL, 8, NULL, '2º Cuatrimestre'),
(584, ' Literatura Española II', 3, 2, '', NULL, 8, NULL, 'Anual'),
(585, ' Lengua Española II', 3, 2, '', NULL, 8, NULL, 'Anual'),
(586, ' Literatura Argentina I', 3, 2, '', NULL, 8, NULL, 'Anual'),
(587, ' Lingüística II', 3, 2, '', NULL, 8, NULL, 'Anual'),
(588, ' Griego y Cultura Griega II', 3, 2, '', NULL, 8, NULL, 'Anual'),
(589, ' Literatura Inglesa', 3, 2, '', NULL, 8, NULL, 'Anual'),
(590, ' Didáctica de la Lengua y Literatura I', 3, 2, '', NULL, 8, NULL, 'Anual'),
(591, ' Seminario de la Práctica Docente', 3, 5, '', NULL, 8, NULL, 'Anual'),
(592, ' Investigación Educativa', 3, 3, '', NULL, 8, NULL, 'Anual'),
(593, ' Política Educativa', 3, 3, '', NULL, 8, NULL, '2º Cuatrimestre'),
(594, ' Análisis Institucional', 3, 3, '', NULL, 8, NULL, 'Anual'),
(595, ' Historia de la Lengua ', 4, 3, '', NULL, 8, NULL, '1º Cuatrimestre'),
(596, 'Teoría y Crítica Literaria', 4, 2, '', NULL, 8, NULL, 'Anual'),
(597, ' Literatura Argentina II', 4, 2, '', NULL, 8, NULL, 'Anual'),
(598, ' Literatura Latinoamericana', 4, 2, '', NULL, 8, NULL, 'Anual'),
(599, ' Seminario de Lingüística', 4, 2, '', NULL, 8, NULL, 'Anual'),
(600, 'Seminario en Literaturas Comparadas', 4, 2, '', NULL, 8, NULL, 'Anual'),
(601, ' Teoría de la Comunicación', 4, 2, '', NULL, 8, NULL, '2º Cuatrimestre'),
(602, 'Taller de Acción Educativa ', 4, 15, '', NULL, 8, NULL, 'Anual'),
(603, ' Didáctica de la Lengua y Literatura II', 4, 2, '', NULL, 8, NULL, 'Anual'),
(604, ' Epistemología ', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(605, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(606, 'Semiótica ', 1, 3, '', NULL, 0, NULL, '2º Cuatrimestre'),
(607, 'Introducción a la Filosofía', 1, 4, '', NULL, 0, NULL, 'Anual'),
(608, 'Psicología del Desarrollo I', 1, 4, '', NULL, 0, NULL, 'Anual'),
(609, 'Corrientes de la Psicología  Contemporánea I', 1, 4, '', NULL, 0, NULL, 'Anual'),
(610, 'Problemática Epistemológica de la Psicología', 1, 4, '', NULL, 0, NULL, 'Anual'),
(611, 'Biologia', 1, 3, '', NULL, 0, NULL, 'Anual'),
(612, 'Psicolinguistica', 2, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(613, 'Antropología', 2, 5, '', NULL, 0, NULL, 'Anual'),
(614, 'Historia de las culturas y mitologías', 2, 5, '', NULL, 0, NULL, '1º Cuatrimestre'),
(615, 'Psicología del Desarrollo II', 2, 4, '', NULL, 0, NULL, 'Anual'),
(616, 'Corrientes de la Psicología Contemporánea II', 2, 4, '', NULL, 0, NULL, 'Anual'),
(617, 'Teoría Psicoanalítica', 2, 5, '', NULL, 0, NULL, 'Anual'),
(618, 'Neurobilogia', 2, 3, '', NULL, 0, NULL, 'Anual'),
(619, 'Metodología de la Investigación', 3, 6, '', NULL, 0, NULL, 'Anual'),
(620, 'Psicología del Desarrollo III', 3, 3, '', NULL, 0, NULL, 'Anual'),
(621, ' Teoría Psicoanalítica: Escuela Inglesa', 3, 5, '', NULL, 0, NULL, '1º Cuatrimestre'),
(622, 'Teoría Psicoanalítica: Escuela Francesa', 3, 5, '', NULL, 0, NULL, 'Anual'),
(623, 'Psicologia Social', 3, 4, '', NULL, 0, NULL, 'Anual'),
(624, 'Instrumento de Exploración y  Diagnóstico Psicológico', 3, 4, '', NULL, 0, NULL, 'Anual'),
(625, 'Salud Publica.- Salud Mental', 3, 5, '', NULL, 0, NULL, 'Anual'),
(626, 'Orientación Vocacional y Laboral', 4, 4, '', NULL, 0, NULL, 'Anual'),
(627, 'Psicología Institucional', 4, 5, '', NULL, 0, NULL, 'Anual'),
(628, 'Psicologia, Etica y Derechos Humanos', 4, 4, '', NULL, 0, NULL, 'Anual'),
(629, 'Psicologia Educacional', 4, 4, '', NULL, 0, NULL, 'Anual'),
(630, 'Psicopatología I', 4, 5, '', NULL, 0, NULL, 'Anual'),
(631, 'Clínica I ', 4, 5, '', NULL, 0, NULL, 'Anual'),
(632, 'Psicología Socio-Comunitaria', 4, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(633, 'Psicopatología II', 4, 5, '', NULL, 0, NULL, '1º Cuatrimestre'),
(634, 'Clinica II      ', 4, 5, '', NULL, 0, NULL, '1º Cuatrimestre'),
(635, 'Psicología Jurídica Forense', 4, 4, '', NULL, 0, NULL, 'Anual'),
(636, 'Psiquiatría y Psicofarmacología', 5, 4, '', NULL, 0, NULL, '1º Cuatrimestre'),
(637, 'Comunicación y sistemas de relaciones humanas', 5, 4, '', NULL, 0, NULL, 'Anual'),
(638, 'Seminario de Tesis I', 5, 6, '', NULL, 0, NULL, '1º Cuatrimestre'),
(639, 'Seminario de Tesis II', 5, 6, '', NULL, 0, NULL, '1º Cuatrimestre'),
(640, 'Practicas profesionales supervisadas', 5, 12, '', NULL, 0, NULL, 'Anual'),
(641, 'Grupo, Organización, Institución y Comunidad', 5, 12, '', NULL, 0, NULL, 'Anual'),
(642, 'Seminario de Práctica Profesionales (Según Elección)                                  Educativas', 5, 12, '', NULL, 0, NULL, 'Anual'),
(643, '  Seminario de Práctica Profesionales (Según Elección)                     Jurídico Forense', 5, 12, '', NULL, 0, NULL, 'Anual'),
(644, 'Seminario II. Opción: Psicologia Juridico Forense', 5, 12, '', NULL, 0, NULL, 'Anual'),
(645, 'Teoría Social y del Estado', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(646, 'Semiótica', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(647, ' Epistemología', 0, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(648, 'Sociologia de la Educación', 1, 3, '', NULL, 0, NULL, 'Anual'),
(649, 'Problemática del Aprendizaje', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(650, 'Política Educativa', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(651, ' Pedagogía', 1, 3, '', NULL, 0, NULL, '1º Cuatrimestre'),
(652, ' Investigación Educativa', 1, 4, '', NULL, 0, NULL, 'Anual'),
(653, ' Didáctica', 1, 3, '', NULL, 0, NULL, 'Anual'),
(654, 'Análisis Institucional', 1, 3, '', NULL, 0, NULL, 'Anual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturasCarreras`
--

CREATE TABLE `asignaturasCarreras` (
  `idAsigCarrera` int(11) NOT NULL,
  `idAsignatura` int(11) DEFAULT NULL,
  `idCarrera` int(11) DEFAULT NULL,
  `comentarios` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturasCarreras`
--

INSERT INTO `asignaturasCarreras` (`idAsigCarrera`, `idAsignatura`, `idCarrera`, `comentarios`) VALUES
(23, 2, 87, NULL),
(24, 2, 72, NULL),
(25, 2, 81, NULL),
(26, 3, 73, NULL),
(27, 4, 82, NULL),
(28, 4, 73, NULL),
(29, 4, 88, NULL),
(30, 5, 76, NULL),
(31, 5, 85, NULL),
(32, 6, 47, NULL),
(33, 6, 53, NULL),
(34, 6, 54, NULL),
(35, 6, 55, NULL),
(36, 7, 27, NULL),
(37, 7, 28, NULL),
(38, 7, 29, NULL),
(39, 7, 31, NULL),
(40, 7, 30, NULL),
(41, 7, 32, NULL),
(42, 8, 28, NULL),
(43, 8, 27, NULL),
(44, 8, 29, NULL),
(45, 8, 31, NULL),
(46, 8, 30, NULL),
(47, 8, 32, NULL),
(48, 9, 27, NULL),
(49, 10, 27, NULL),
(50, 11, 27, NULL),
(51, 12, 27, NULL),
(52, 13, 27, NULL),
(53, 14, 27, NULL),
(54, 15, 27, NULL),
(55, 16, 27, NULL),
(56, 17, 27, NULL),
(57, 18, 27, NULL),
(58, 19, 27, NULL),
(59, 20, 27, NULL),
(60, 21, 27, NULL),
(61, 22, 27, NULL),
(62, 23, 27, NULL),
(63, 24, 27, NULL),
(64, 25, 27, NULL),
(65, 26, 27, NULL),
(66, 27, 27, NULL),
(67, 28, 27, NULL),
(68, 29, 27, NULL),
(69, 30, 27, NULL),
(70, 31, 27, NULL),
(71, 32, 27, NULL),
(72, 33, 27, NULL),
(73, 34, 27, NULL),
(74, 35, 27, NULL),
(75, 36, 27, NULL),
(76, 37, 27, NULL),
(77, 38, 27, NULL),
(78, 39, 27, NULL),
(79, 40, 27, NULL),
(80, 41, 27, NULL),
(81, 42, 27, NULL),
(82, 43, 27, NULL),
(83, 44, 27, NULL),
(84, 46, 27, NULL),
(85, 47, 27, NULL),
(86, 48, 27, NULL),
(87, 49, 27, NULL),
(88, 50, 27, NULL),
(89, 51, 27, NULL),
(90, 52, 27, NULL),
(91, 53, 27, NULL),
(92, 54, 27, NULL),
(93, 55, 27, NULL),
(94, 56, 27, NULL),
(95, 57, 27, NULL),
(96, 58, 27, NULL),
(97, 59, 27, NULL),
(98, 60, 27, NULL),
(99, 61, 27, NULL),
(100, 62, 1, NULL),
(101, 63, 1, NULL),
(102, 64, 1, NULL),
(103, 65, 1, NULL),
(104, 66, 1, NULL),
(105, 67, 1, NULL),
(106, 68, 1, NULL),
(107, 69, 1, NULL),
(108, 70, 1, NULL),
(109, 71, 1, NULL),
(110, 72, 1, NULL),
(111, 73, 1, NULL),
(112, 74, 1, NULL),
(113, 75, 1, NULL),
(114, 76, 1, NULL),
(115, 77, 1, NULL),
(116, 78, 1, NULL),
(117, 79, 1, NULL),
(118, 80, 1, NULL),
(119, 81, 1, NULL),
(120, 82, 1, NULL),
(121, 83, 1, NULL),
(122, 84, 1, NULL),
(123, 85, 1, NULL),
(124, 86, 1, NULL),
(125, 87, 1, NULL),
(126, 88, 1, NULL),
(127, 89, 1, NULL),
(128, 90, 1, NULL),
(129, 91, 1, NULL),
(130, 92, 1, NULL),
(131, 93, 1, NULL),
(132, 94, 1, NULL),
(133, 95, 1, NULL),
(134, 96, 1, NULL),
(135, 97, 1, NULL),
(136, 98, 1, NULL),
(137, 99, 64, NULL),
(138, 100, 64, NULL),
(139, 101, 64, NULL),
(140, 102, 64, NULL),
(141, 103, 64, NULL),
(142, 104, 64, NULL),
(143, 105, 64, NULL),
(144, 106, 64, NULL),
(145, 107, 88, NULL),
(146, 108, 88, NULL),
(147, 109, 88, NULL),
(148, 110, 88, NULL),
(149, 111, 64, NULL),
(150, 112, 64, NULL),
(151, 113, 64, NULL),
(152, 114, 88, NULL),
(153, 115, 64, NULL),
(154, 116, 88, NULL),
(155, 117, 64, NULL),
(156, 118, 64, NULL),
(157, 119, 64, NULL),
(158, 120, 64, NULL),
(159, 121, 64, NULL),
(160, 122, 64, NULL),
(161, 123, 64, NULL),
(162, 124, 64, NULL),
(163, 125, 64, NULL),
(164, 126, 64, NULL),
(165, 127, 64, NULL),
(166, 128, 8, NULL),
(167, 129, 64, NULL),
(168, 130, 64, NULL),
(169, 131, 13, NULL),
(170, 132, 13, NULL),
(171, 133, 13, NULL),
(172, 134, 13, NULL),
(173, 135, 13, NULL),
(174, 136, 13, NULL),
(175, 137, 13, NULL),
(176, 138, 13, NULL),
(177, 139, 13, NULL),
(178, 140, 13, NULL),
(179, 141, 13, NULL),
(180, 142, 13, NULL),
(181, 143, 13, NULL),
(182, 144, 13, NULL),
(183, 145, 13, NULL),
(184, 146, 13, NULL),
(185, 147, 13, NULL),
(186, 148, 13, NULL),
(187, 149, 13, NULL),
(188, 150, 13, NULL),
(189, 151, 13, NULL),
(190, 152, 13, NULL),
(191, 153, 13, NULL),
(192, 154, 13, NULL),
(193, 155, 13, NULL),
(194, 156, 13, NULL),
(195, 157, 13, NULL),
(196, 158, 13, NULL),
(197, 159, 13, NULL),
(198, 160, 13, NULL),
(199, 161, 13, NULL),
(200, 162, 13, NULL),
(201, 163, 17, NULL),
(202, 164, 17, NULL),
(203, 165, 17, NULL),
(204, 166, 17, NULL),
(205, 167, 17, NULL),
(206, 168, 17, NULL),
(207, 169, 17, NULL),
(208, 170, 17, NULL),
(209, 171, 17, NULL),
(210, 172, 17, NULL),
(211, 173, 17, NULL),
(212, 174, 17, NULL),
(213, 175, 17, NULL),
(214, 176, 17, NULL),
(215, 177, 17, NULL),
(216, 178, 17, NULL),
(217, 179, 17, NULL),
(218, 180, 13, NULL),
(219, 181, 17, NULL),
(220, 182, 17, NULL),
(221, 183, 17, NULL),
(222, 184, 17, NULL),
(223, 185, 17, NULL),
(224, 186, 17, NULL),
(225, 187, 17, NULL),
(226, 188, 17, NULL),
(227, 189, 17, NULL),
(228, 190, 17, NULL),
(229, 191, 17, NULL),
(230, 192, 17, NULL),
(231, 193, 17, NULL),
(232, 194, 17, NULL),
(233, 195, 17, NULL),
(234, 196, 17, NULL),
(235, 197, 17, NULL),
(236, 198, 17, NULL),
(237, 199, 3, NULL),
(238, 200, 3, NULL),
(239, 201, 3, NULL),
(240, 202, 3, NULL),
(241, 203, 3, NULL),
(242, 204, 3, NULL),
(243, 205, 3, NULL),
(244, 206, 3, NULL),
(245, 207, 3, NULL),
(246, 208, 3, NULL),
(247, 209, 3, NULL),
(248, 210, 3, NULL),
(249, 211, 3, NULL),
(250, 212, 3, NULL),
(251, 213, 3, NULL),
(252, 214, 3, NULL),
(253, 215, 3, NULL),
(254, 216, 3, NULL),
(255, 217, 3, NULL),
(256, 218, 3, NULL),
(257, 219, 3, NULL),
(258, 220, 3, NULL),
(259, 221, 3, NULL),
(260, 222, 3, NULL),
(261, 223, 3, NULL),
(262, 224, 3, NULL),
(263, 225, 3, NULL),
(264, 226, 3, NULL),
(265, 227, 3, NULL),
(266, 228, 3, NULL),
(267, 229, 3, NULL),
(268, 230, 3, NULL),
(269, 231, 3, NULL),
(270, 232, 3, NULL),
(271, 233, 3, NULL),
(272, 234, 3, NULL),
(273, 235, 3, NULL),
(274, 236, 3, NULL),
(275, 237, 3, NULL),
(276, 238, 3, NULL),
(277, 239, 3, NULL),
(278, 240, 3, NULL),
(279, 241, 3, NULL),
(280, 242, 3, NULL),
(281, 243, 3, NULL),
(282, 244, 3, NULL),
(283, 245, 3, NULL),
(284, 246, 3, NULL),
(285, 247, 3, NULL),
(286, 248, 9, NULL),
(287, 249, 9, NULL),
(288, 250, 9, NULL),
(289, 251, 9, NULL),
(290, 252, 9, NULL),
(291, 253, 9, NULL),
(292, 254, 9, NULL),
(293, 255, 9, NULL),
(294, 256, 9, NULL),
(295, 257, 9, NULL),
(296, 258, 9, NULL),
(297, 259, 9, NULL),
(298, 260, 9, NULL),
(299, 261, 9, NULL),
(300, 262, 9, NULL),
(301, 263, 9, NULL),
(302, 264, 9, NULL),
(303, 265, 9, NULL),
(304, 266, 9, NULL),
(305, 267, 9, NULL),
(306, 268, 9, NULL),
(307, 269, 9, NULL),
(308, 270, 9, NULL),
(309, 271, 9, NULL),
(310, 272, 9, NULL),
(311, 273, 9, NULL),
(312, 274, 9, NULL),
(313, 275, 9, NULL),
(314, 276, 9, NULL),
(315, 277, 9, NULL),
(316, 278, 9, NULL),
(317, 279, 9, NULL),
(318, 280, 9, NULL),
(319, 281, 9, NULL),
(320, 282, 9, NULL),
(321, 283, 9, NULL),
(322, 284, 9, NULL),
(323, 285, 9, NULL),
(324, 286, 9, NULL),
(325, 287, 19, NULL),
(326, 288, 19, NULL),
(327, 289, 19, NULL),
(328, 290, 19, NULL),
(329, 291, 19, NULL),
(330, 292, 19, NULL),
(331, 293, 19, NULL),
(332, 294, 19, NULL),
(333, 295, 19, NULL),
(334, 296, 19, NULL),
(335, 297, 19, NULL),
(336, 298, 19, NULL),
(337, 299, 19, NULL),
(338, 300, 19, NULL),
(339, 301, 19, NULL),
(340, 302, 19, NULL),
(341, 303, 19, NULL),
(342, 304, 19, NULL),
(343, 305, 19, NULL),
(344, 306, 19, NULL),
(345, 307, 19, NULL),
(346, 308, 19, NULL),
(347, 309, 19, NULL),
(348, 310, 19, NULL),
(349, 311, 19, NULL),
(350, 312, 19, NULL),
(351, 313, 19, NULL),
(352, 314, 19, NULL),
(353, 315, 19, NULL),
(354, 316, 19, NULL),
(355, 317, 19, NULL),
(356, 318, 19, NULL),
(357, 319, 19, NULL),
(358, 320, 19, NULL),
(359, 321, 19, NULL),
(360, 322, 19, NULL),
(361, 323, 19, NULL),
(362, 324, 19, NULL),
(363, 325, 19, NULL),
(364, 326, 19, NULL),
(365, 327, 11, NULL),
(366, 328, 11, NULL),
(367, 329, 11, NULL),
(368, 330, 11, NULL),
(369, 331, 11, NULL),
(370, 332, 11, NULL),
(371, 333, 11, NULL),
(372, 334, 11, NULL),
(373, 335, 11, NULL),
(374, 336, 11, NULL),
(375, 337, 11, NULL),
(376, 338, 11, NULL),
(377, 339, 11, NULL),
(378, 340, 11, NULL),
(379, 341, 11, NULL),
(380, 342, 11, NULL),
(381, 343, 11, NULL),
(382, 344, 11, NULL),
(383, 345, 11, NULL),
(384, 346, 11, NULL),
(385, 347, 11, NULL),
(386, 348, 11, NULL),
(387, 349, 11, NULL),
(388, 350, 11, NULL),
(389, 351, 11, NULL),
(390, 352, 11, NULL),
(391, 353, 11, NULL),
(392, 354, 11, NULL),
(393, 355, 11, NULL),
(394, 356, 11, NULL),
(395, 357, 11, NULL),
(396, 358, 11, NULL),
(397, 359, 11, NULL),
(398, 360, 11, NULL),
(399, 361, 11, NULL),
(400, 362, 11, NULL),
(401, 363, 11, NULL),
(402, 365, 11, NULL),
(403, 366, 11, NULL),
(404, 367, 11, NULL),
(405, 368, 11, NULL),
(406, 369, 11, NULL),
(407, 370, 11, NULL),
(408, 371, 11, NULL),
(409, 372, 11, NULL),
(410, 373, 11, NULL),
(411, 374, 11, NULL),
(412, 375, 11, NULL),
(413, 376, 11, NULL),
(414, 377, 11, NULL),
(415, 378, 11, NULL),
(416, 379, 11, NULL),
(417, 380, 11, NULL),
(418, 381, 11, NULL),
(419, 382, 11, NULL),
(420, 383, 11, NULL),
(421, 384, 11, NULL),
(422, 385, 11, NULL),
(423, 386, 11, NULL),
(424, 387, 21, NULL),
(425, 388, 21, NULL),
(426, 389, 21, NULL),
(427, 390, 21, NULL),
(428, 391, 21, NULL),
(429, 392, 21, NULL),
(430, 393, 21, NULL),
(431, 394, 21, NULL),
(432, 395, 21, NULL),
(433, 396, 21, NULL),
(434, 397, 21, NULL),
(435, 398, 21, NULL),
(436, 399, 21, NULL),
(437, 400, 21, NULL),
(438, 401, 21, NULL),
(439, 402, 21, NULL),
(440, 403, 21, NULL),
(441, 404, 21, NULL),
(442, 405, 21, NULL),
(443, 406, 21, NULL),
(444, 407, 21, NULL),
(445, 408, 21, NULL),
(446, 409, 21, NULL),
(447, 410, 21, NULL),
(448, 411, 21, NULL),
(449, 412, 21, NULL),
(450, 413, 21, NULL),
(451, 414, 21, NULL),
(452, 415, 21, NULL),
(453, 416, 21, NULL),
(454, 417, 21, NULL),
(455, 418, 21, NULL),
(456, 419, 21, NULL),
(457, 420, 21, NULL),
(458, 421, 21, NULL),
(459, 422, 21, NULL),
(460, 423, 21, NULL),
(461, 424, 21, NULL),
(462, 425, 21, NULL),
(463, 426, 21, NULL),
(464, 427, 21, NULL),
(465, 428, 21, NULL),
(466, 429, 21, NULL),
(467, 430, 21, NULL),
(468, 431, 33, NULL),
(469, 432, 33, NULL),
(470, 433, 33, NULL),
(471, 434, 33, NULL),
(472, 435, 33, NULL),
(473, 436, 33, NULL),
(474, 437, 33, NULL),
(475, 438, 78, NULL),
(476, 439, 78, NULL),
(477, 440, 78, NULL),
(478, 441, 78, NULL),
(479, 442, 78, NULL),
(480, 443, 78, NULL),
(481, 444, 78, NULL),
(482, 445, 78, NULL),
(483, 446, 33, NULL),
(484, 447, 78, NULL),
(485, 448, 78, NULL),
(486, 449, 78, NULL),
(487, 450, 78, NULL),
(488, 451, 78, NULL),
(489, 452, 78, NULL),
(490, 453, 78, NULL),
(491, 454, 78, NULL),
(492, 455, 78, NULL),
(493, 456, 78, NULL),
(494, 457, 78, NULL),
(495, 458, 78, NULL),
(496, 459, 78, NULL),
(497, 460, 78, NULL),
(498, 461, 78, NULL),
(499, 462, 78, NULL),
(500, 463, 78, NULL),
(501, 464, 78, NULL),
(502, 465, 78, NULL),
(503, 466, 78, NULL),
(504, 467, 78, NULL),
(505, 468, 78, NULL),
(506, 469, 78, NULL),
(507, 470, 78, NULL),
(508, 471, 78, NULL),
(509, 472, 78, NULL),
(510, 473, 78, NULL),
(511, 474, 78, NULL),
(512, 475, 78, NULL),
(513, 476, 78, NULL),
(514, 477, 78, NULL),
(515, 478, 78, NULL),
(516, 479, 78, NULL),
(517, 480, 78, NULL),
(518, 481, 15, NULL),
(519, 482, 15, NULL),
(520, 483, 15, NULL),
(521, 484, 15, NULL),
(522, 485, 15, NULL),
(523, 486, 15, NULL),
(524, 487, 15, NULL),
(525, 488, 15, NULL),
(526, 489, 15, NULL),
(527, 490, 15, NULL),
(528, 491, 15, NULL),
(529, 492, 15, NULL),
(530, 493, 15, NULL),
(531, 494, 15, NULL),
(532, 495, 15, NULL),
(533, 496, 15, NULL),
(534, 497, 15, NULL),
(535, 498, 15, NULL),
(536, 499, 15, NULL),
(537, 500, 15, NULL),
(538, 501, 15, NULL),
(539, 502, 15, NULL),
(540, 503, 15, NULL),
(541, 504, 15, NULL),
(542, 505, 15, NULL),
(543, 506, 15, NULL),
(544, 507, 15, NULL),
(545, 508, 15, NULL),
(546, 509, 15, NULL),
(547, 510, 12, NULL),
(548, 511, 12, NULL),
(549, 512, 12, NULL),
(550, 513, 12, NULL),
(551, 514, 12, NULL),
(552, 515, 12, NULL),
(553, 516, 15, NULL),
(554, 517, 12, NULL),
(555, 518, 12, NULL),
(556, 519, 12, NULL),
(557, 520, 12, NULL),
(558, 521, 12, NULL),
(559, 522, 12, NULL),
(560, 523, 12, NULL),
(561, 524, 12, NULL),
(562, 525, 12, NULL),
(563, 526, 12, NULL),
(564, 527, 12, NULL),
(565, 528, 12, NULL),
(566, 529, 12, NULL),
(567, 530, 12, NULL),
(568, 531, 12, NULL),
(569, 532, 12, NULL),
(570, 533, 12, NULL),
(571, 534, 12, NULL),
(572, 535, 12, NULL),
(573, 536, 12, NULL),
(574, 537, 12, NULL),
(575, 538, 12, NULL),
(576, 539, 12, NULL),
(577, 540, 12, NULL),
(578, 541, 12, NULL),
(579, 542, 12, NULL),
(580, 543, 12, NULL),
(581, 544, 12, NULL),
(582, 545, 12, NULL),
(583, 546, 12, NULL),
(584, 547, 12, NULL),
(585, 548, 12, NULL),
(586, 549, 12, NULL),
(587, 550, 12, NULL),
(588, 551, 12, NULL),
(589, 552, 12, NULL),
(590, 553, 12, NULL),
(591, 554, 12, NULL),
(592, 555, 12, NULL),
(593, 556, 12, NULL),
(594, 557, 12, NULL),
(595, 558, 12, NULL),
(596, 559, 12, NULL),
(597, 560, 12, NULL),
(598, 561, 12, NULL),
(599, 562, 12, NULL),
(600, 563, 12, NULL),
(601, 564, 18, NULL),
(602, 565, 18, NULL),
(603, 566, 18, NULL),
(604, 567, 18, NULL),
(605, 568, 12, NULL),
(606, 569, 18, NULL),
(607, 570, 18, NULL),
(608, 571, 18, NULL),
(609, 572, 18, NULL),
(610, 573, 18, NULL),
(611, 574, 18, NULL),
(612, 575, 18, NULL),
(613, 576, 18, NULL),
(614, 577, 18, NULL),
(615, 578, 18, NULL),
(616, 579, 18, NULL),
(617, 580, 18, NULL),
(618, 581, 18, NULL),
(619, 582, 18, NULL),
(620, 583, 18, NULL),
(621, 584, 18, NULL),
(622, 585, 18, NULL),
(623, 586, 18, NULL),
(624, 587, 18, NULL),
(625, 588, 18, NULL),
(626, 589, 18, NULL),
(627, 590, 18, NULL),
(628, 591, 18, NULL),
(629, 592, 18, NULL),
(630, 593, 18, NULL),
(631, 594, 18, NULL),
(632, 595, 18, NULL),
(633, 596, 18, NULL),
(634, 597, 18, NULL),
(635, 598, 18, NULL),
(636, 599, 18, NULL),
(637, 600, 18, NULL),
(638, 601, 18, NULL),
(639, 602, 18, NULL),
(640, 603, 18, NULL),
(641, 604, 5, NULL),
(642, 605, 5, NULL),
(643, 606, 5, NULL),
(644, 607, 5, NULL),
(645, 608, 5, NULL),
(646, 609, 5, NULL),
(647, 610, 5, NULL),
(648, 611, 5, NULL),
(649, 612, 5, NULL),
(650, 613, 5, NULL),
(651, 614, 5, NULL),
(652, 615, 5, NULL),
(653, 616, 5, NULL),
(654, 617, 5, NULL),
(655, 618, 5, NULL),
(656, 619, 5, NULL),
(657, 620, 5, NULL),
(658, 621, 5, NULL),
(659, 622, 5, NULL),
(660, 623, 5, NULL),
(661, 624, 5, NULL),
(662, 625, 5, NULL),
(663, 626, 5, NULL),
(664, 627, 5, NULL),
(665, 628, 5, NULL),
(666, 629, 5, NULL),
(667, 630, 5, NULL),
(668, 631, 5, NULL),
(669, 632, 5, NULL),
(670, 633, 5, NULL),
(671, 634, 5, NULL),
(672, 635, 5, NULL),
(673, 636, 5, NULL),
(674, 637, 5, NULL),
(675, 638, 5, NULL),
(676, 639, 5, NULL),
(677, 640, 5, NULL),
(678, 641, 5, NULL),
(679, 642, 5, NULL),
(680, 643, 5, NULL),
(681, 644, 5, NULL),
(682, 645, 76, NULL),
(683, 646, 76, NULL),
(684, 647, 76, NULL),
(685, 648, 75, NULL),
(686, 649, 75, NULL),
(687, 650, 75, NULL),
(688, 651, 75, NULL),
(689, 652, 75, NULL),
(690, 653, 75, NULL),
(691, 654, 75, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `idCargo` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `detalleCargo` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `codigo`, `detalleCargo`) VALUES
(1, '01', 'Categoría 1'),
(2, '02', 'Categoría 2'),
(3, '03', 'Categoría 3'),
(4, '04', 'Categoría 4'),
(5, '05', 'Categoría 5'),
(6, '06', 'Categoría 6'),
(7, '07', 'Categoría 7'),
(8, '08', 'Categoría 8'),
(9, '09', 'Categoría 9'),
(10, '10', 'Categoría 10'),
(11, '609/611', 'Director Escuela 1° categoria'),
(12, '614', 'Vicedirector Escuela 1° categoría'),
(13, '625', 'Secretario Escuela 1° categoría'),
(14, '632', 'Preceptor '),
(15, '633', 'Bibliotecario'),
(16, '638', 'Ayudante de Trabajos Prácticos'),
(17, '639', 'Subjefe de Preceptores de 1° categoría'),
(18, '646', 'Ayudante de Clases Prácticas'),
(19, '649', 'Maestro 3° ciclo EGB'),
(20, '652', 'Instructor de Escuela Agropecuaria'),
(21, '657', 'Prosecretario 1° categoría'),
(22, '659', 'Jefe de Preceptores 1° categoría'),
(23, '667', 'Director'),
(24, '670', 'Vicedirector con prolongación de jornada'),
(25, '675', 'Jefe Explotación Agropecuaria 1° categoría'),
(26, '678', 'Jefe Sección Escuela Agropecuaria'),
(27, '679', 'Jefe internado Escuela Agropecuaria'),
(28, '684', 'Preceptor ayudante de internado 1° categoria'),
(29, '738', 'Maestra de Nivel Inicial'),
(30, '749', 'Maestro de Grado y Maestro de Primaria'),
(31, '759', 'Archivista'),
(32, '785', 'Director Jardin de Infantes'),
(33, '799', 'Jefe de Industria para las tareas técnicas'),
(34, '858', 'Profesor Titular Dedicación Exclusiva'),
(35, '859', 'Profesor Asociado Dedicación Exclusiva'),
(36, '860', 'Profesor Adjunto Dedicación Exclusiva'),
(37, '861', 'JTP con Dedicación Exclusiva'),
(38, '862', 'Profesor Auxiliar Exclusiva'),
(39, '863', 'Auxiliar Parcial'),
(40, '864', 'JTP con Dedicación Parcial'),
(41, '868', 'Titular Parcial'),
(42, '869', 'Asociado Parcial'),
(43, '870', 'Adjunto Parcial'),
(44, '871', 'Titular Simple'),
(45, '872', 'Asociado Simple'),
(46, '873', 'Adjunto Simple'),
(47, '874', 'JTP Simple'),
(48, '875', 'Auxiliar Simple'),
(49, '932', 'Rector Instituto Superior'),
(50, '933', 'Secretario Instituto Superior y Secretario de Nive'),
(51, '934', 'Bibliotecario'),
(52, '935', 'Preceptor Instituto Superior'),
(53, '936', 'Bedeles'),
(54, '958', 'Jefe del Departamento Educación Física'),
(55, '970', 'Preceptor Guía de Internado Instituto Superior'),
(56, '983', 'Maestro Departamento Aplicación Lengua'),
(57, '984', 'Maestro Especial Departamento Aplicación LV'),
(58, '986', 'Maestro Especial Jardin de Infantes'),
(59, '987', 'Maestro Jardín de Infantes'),
(60, '991', 'Regente del Departamento Aplicación'),
(61, '995', 'Prosecretario Nivel Superior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idCarrera` int(11) NOT NULL,
  `carrera` varchar(80) CHARACTER SET latin1 DEFAULT NULL,
  `idSede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`idCarrera`, `carrera`, `idSede`) VALUES
(1, 'Licenciatura en Ciencias Sociales', 1),
(2, 'Profesorado en Ciencias Sociales', 1),
(3, 'Licenciatura en Geografía', 1),
(4, 'Profesorado en Geografía', 1),
(5, 'Licenciatura en Psicología', 1),
(7, 'Tecnicatura en Acompañamiento Terapéutico', 1),
(8, 'Tecnicatura en Psicogerontología', 1),
(9, 'Licenciatura en Historia', 1),
(10, 'Profesorado en Historia', 1),
(11, 'Profesorado de Educación Inicial', 1),
(12, 'Profesorado de Educación Primaria', 1),
(13, 'Licenciatura en Filosofía', 1),
(14, 'Profesorado en Filosofía', 1),
(15, 'Profesorado en Portugués', 1),
(16, 'Profesorado en Francés', 1),
(17, 'Traductorado en Francés', 1),
(18, 'Profesorado en Lengua y Literatura', 1),
(19, 'Profesorado en Inglés', 1),
(20, 'Profesorado en Italiano', 1),
(21, 'Traductorado Público de Italiano', 1),
(22, 'Profesorado de Educación Especial', 1),
(23, 'Traductorado Público en Portugués (CCC)*', 1),
(24, 'Traductorado Público en Inglés (CCC)*', 1),
(25, 'Profesorado Universitario (CCC)*', 1),
(26, 'Licenciatura en Lenguas Extranjeras (CCC)*', 1),
(27, 'Licenciatura en Artes Visuales', 4),
(28, 'Profesorado en Artes Visuales', 4),
(29, 'Tecnicatura en Pintura', 4),
(30, 'Tecnicatura en Cerámica', 4),
(31, 'Tecnicatura en Grabado', 4),
(32, 'Tecnicatura en Escultura', 4),
(33, 'Profesorado en Música', 5),
(34, 'Profesorado en Canto Lírico', 5),
(35, 'Profesorado de Instrumento', 5),
(36, 'Tecnicatura Instrumentista Musical', 5),
(37, 'Tecnicatura en Canto Lírico', 5),
(38, 'Licenciatura en Canto Lírico', 5),
(39, 'Licenciatura en Canto Popular', 5),
(40, 'Profesorado de Educ. Primaria con Orientación Rural', 3),
(41, 'Profesorado de Educación Inicial con Orientación Rural', 3),
(42, 'Profesorado de Educ. Primaria con Orientación Rural', 2),
(43, 'Profesorado en Psicología', 1),
(44, 'Tecnicatura en Acompañamiento Terapéutico', 6),
(45, 'Tecnicatura en Psicogerontología', 6),
(46, 'Profesorado de Educación Primaria', 6),
(47, 'Profesorado en Francés', 6),
(48, 'Traductorado en Francés', 6),
(49, 'Profesorado en Geografía', 6),
(50, 'Licenciatura en Geografía', 6),
(51, 'Profesorado en Historia', 6),
(52, 'Licenciatura en Historia', 6),
(53, 'Profesorado en Inglés', 6),
(54, 'Profesorado en Lengua y Literatura', 6),
(55, 'Profesorado en Portugués', 6),
(56, 'Licenciatura en Lenguas Extranjeras (CCC)*', 6),
(57, 'Traductorado Público en Portugués (CCC)*', 6),
(58, 'Traductorado Público en Inglés (CCC)*', 6),
(59, 'Licenciatura en Pedagogía (CCC)*', 6),
(60, 'Profesorado en Música', 7),
(61, 'Tecnicatura Instrumentista Musical (Piano)', 7),
(62, 'Tecnicatura en Canto Lírico', 7),
(63, 'Tecnicatura en Acompañamiento Terapéutico', 8),
(64, 'Tecnicatura en Psicogerontología', 8),
(65, 'Tecnicatura Instrumentista Musical (Piano)', 8),
(66, 'Tecnicatura en Canto Lírico', 8),
(67, 'Profesorado en Teatro', 9),
(68, 'Licenciatura en Pedagogía (CCC)*', 9),
(69, 'Profesorado Universitario (CCC)*', 9),
(70, 'Profesorado de Educación Primaria', 11),
(72, 'Tecnicatura Universitaria en Acompañamiento Terapéutico', 1),
(73, 'Tecnicatura Universitaria en Psicogerontología', 1),
(74, 'Profesorado Universitario de Educación Especial', 1),
(75, 'Trayecto Pedagógico', 1),
(76, 'Tronco Común', 1),
(77, 'Cátedras Comunes', 1),
(78, 'Profesorado Universitario en Música', 5),
(79, 'Profesorado en Teatro', 5),
(81, 'Tecnicatura Universitaria en Acompañamiento Terapéutico', 6),
(82, 'Tecnicatura Universitaria en Psicogerontología', 6),
(83, 'Profesorado en Psicología', 6),
(84, 'Profesorado de Educación Primaria', 6),
(85, 'Tronco Común', 6),
(86, 'Tutorías de Licenciatura en Pedagogía', 9),
(87, 'Tecnicatura Universitaria en Acompañamiento Terapéutico', 8),
(88, 'Tecnicatura Universitaria en Psicogerontología', 8),
(89, 'Tecnicatura Instrumentista Musical (Guitarra)', 8),
(90, 'Tutorías en Tecnicatura en Acompañamiento Terapéutico', 8),
(91, 'Tutorías en Tecnicatura en Psicogerontología', 8),
(92, 'Profesorado  Universitario en Música', 7),
(93, 'Tecnicatura Instrumentista Musical (Guitarra)', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `idCargo` int(11) DEFAULT NULL,
  `detalleCategoria` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `idDedicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `idCargo`, `detalleCategoria`, `horas`, `idDedicacion`) VALUES
(3, 6, 'Titular', 11, 1),
(5, 6, 'Asociado', 10, 1),
(6, 6, 'Adjunto', 9, 1),
(7, 6, 'JTP', 8, 1),
(8, 6, 'Auxiliar Docente', 7, 1),
(9, 7, 'Titular', 11, 1),
(10, 7, 'Asociado', 10, 1),
(11, 7, 'Adjunto', 9, 1),
(12, 7, 'JTP', 8, 1),
(13, 7, 'Auxiliar Docente', 7, 1),
(14, 9, 'Titular', 11, 1),
(15, 9, 'Asociado', 10, 1),
(16, 9, 'Adjunto', 9, 1),
(17, 9, 'JTP', 8, 1),
(18, 9, 'Auxiliar Docente', 7, 1),
(19, 6, 'Titular', 24, 2),
(20, 6, 'Titular', 48, 3),
(21, 6, 'Adjunto', 19, 2),
(22, 6, 'Adjunto', 38, 3),
(23, 6, 'Asociado', 21, 2),
(24, 6, 'Asociados', 43, 3),
(25, 6, 'JTP', 17, 2),
(26, 6, 'JTP', 34, 3),
(27, 6, 'Auxiliar Docente', 15, 2),
(28, 6, 'Auxiliar Docente', 30, 3),
(29, 7, 'Titular', 24, 2),
(30, 7, 'Titular', 48, 3),
(31, 9, 'Titular', 24, 2),
(32, 9, 'Titular', 48, 3),
(33, 7, 'Adjunto', 19, 2),
(34, 7, 'Adjunto', 38, 3),
(35, 9, 'Adjunto', 19, 2),
(36, 9, 'Adjunto', 38, 3),
(37, 7, 'Asociado', 21, 2),
(38, 7, 'Asociado', 43, 3),
(39, 6, 'Asociado', 43, 3),
(40, 9, 'Asociado', 21, 2),
(41, 9, 'Asociado', 43, 3),
(42, 7, 'JTP', 17, 2),
(43, 7, 'JTP', 34, 3),
(44, 9, 'JTP', 17, 2),
(45, 9, 'JTP', 34, 3),
(46, 7, 'Auxiliar Docente', 15, 2),
(47, 7, 'Auxiliar Docente', 30, 3),
(48, 9, 'Auxiliar Docente', 15, 2),
(49, 9, 'Auxiliar Docente', 30, 3),
(50, 7, 'Sin Especificar', 0, 4),
(51, 10, 'Adjunto', 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursado`
--

CREATE TABLE `cursado` (
  `idCursado` int(11) NOT NULL,
  `idSede` int(11) DEFAULT NULL,
  `lugarCursado` varchar(80) DEFAULT NULL,
  `aula` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursado`
--

INSERT INTO `cursado` (`idCursado`, `idSede`, `lugarCursado`, `aula`) VALUES
(2, 1, 'pruebaCursado_1', 'Aula7'),
(3, 2, 'pruebaCursado_2', 'Aula2'),
(4, 3, 'pruebaCursado_3', 'Aula3'),
(5, 4, 'pruebaCursado_4', 'Aula4'),
(6, 5, 'pruebaCursado_5', 'Aula5'),
(7, 6, 'pruebaCursado_6', 'Aula6');

--
-- Disparadores `cursado`
--
DELIMITER $$
CREATE TRIGGER `trg_cursado_delete` AFTER DELETE ON `cursado` FOR EACH ROW BEGIN
     INSERT INTO cursado_log (
     idCursado,
     idSede,
     lugarCursado,
     aula,
     usuarioModificacion,
     fechaModificacion,
     accion
     )
     VALUES(
     old.idCursado,
     old.idSede,
     old.lugarCursado,
     old.aula,
     CURRENT_USER(),
     NOW(),
     'D'
     );
    
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_cursado_insert` AFTER INSERT ON `cursado` FOR EACH ROW BEGIN
     insert into cursado_log (
     idCursado,
     idSede,
     lugarCursado,
     aula,
     usuarioModificacion,
     fechaModificacion,
     accion
     )
     values(
     new.idCursado,
     new.idSede,
     new.lugarCursado,
     new.aula,
     current_user(),
     Now(),
     'I'
     );
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_cursado_update` AFTER UPDATE ON `cursado` FOR EACH ROW BEGIN
     INSERT INTO cursado_log (
     idCursado,
     idSede,
     lugarCursado,
     aula,
     usuarioModificacion,
     fechaModificacion,
     accion
     )
     VALUES(
     new.idCursado,
     new.idSede,
     new.lugarCursado,
     new.aula,
     CURRENT_USER(),
     NOW(),
     'U'
     );
    
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursado_log`
--

CREATE TABLE `cursado_log` (
  `idCursado_log` int(10) UNSIGNED NOT NULL,
  `idCursado` int(11) DEFAULT NULL,
  `idSede` int(11) DEFAULT NULL,
  `lugarCursado` varchar(80) DEFAULT NULL,
  `aula` varchar(25) DEFAULT NULL,
  `usuarioModificacion` int(11) DEFAULT NULL,
  `fechaModificacion` date DEFAULT NULL,
  `accion` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursado_log`
--

INSERT INTO `cursado_log` (`idCursado_log`, `idCursado`, `idSede`, `lugarCursado`, `aula`, `usuarioModificacion`, `fechaModificacion`, `accion`) VALUES
(4, 2, 1, 'pruebaCursado_1', 'Aula1', 0, '2018-09-03', 'I'),
(5, 3, 2, 'pruebaCursado_2', 'Aula2', 0, '2018-09-03', 'I'),
(6, 4, 3, 'pruebaCursado_3', 'Aula3', 0, '2018-09-03', 'I'),
(7, 5, 4, 'pruebaCursado_4', 'Aula4', 0, '2018-09-03', 'I'),
(8, 6, 5, 'pruebaCursado_5', 'Aula5', 0, '2018-09-03', 'I'),
(9, 7, 6, 'pruebaCursado_6', 'Aula6', 0, '2018-09-03', 'I'),
(10, 2, 1, 'pruebaCursado_1', 'Aula10', 0, '2018-09-03', 'U'),
(11, 2, 1, 'pruebaCursado_1', 'Aula7', 0, '2018-09-03', 'U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dedicaciones`
--

CREATE TABLE `dedicaciones` (
  `idDedicacion` int(11) NOT NULL,
  `detalleDedicacion` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dedicaciones`
--

INSERT INTO `dedicaciones` (`idDedicacion`, `detalleDedicacion`) VALUES
(1, 'Simple'),
(2, 'Semi Exclusiva'),
(3, 'Exclusiva'),
(4, '							 								 	Sin Dedicación                  ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `idDependencia` int(11) NOT NULL,
  `idSecretaria` int(11) DEFAULT NULL,
  `Detalle` varchar(80) DEFAULT NULL,
  `esSubSecretaria` char(1) DEFAULT NULL COMMENT 'S:Si, N:No',
  `esDireccion` char(1) DEFAULT NULL COMMENT 'S:Si, N:No',
  `esArea` char(1) DEFAULT NULL COMMENT 'S:Si, N:No',
  `esDepartamento` char(1) DEFAULT NULL COMMENT 'S:Si, N:No',
  `esDivision` char(1) DEFAULT NULL COMMENT 'S:Si, N:No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `dispocision`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `dispocision` (
`idSecretaria` int(11)
,`nombreSecretaria` varchar(80)
,`detalleSede` varchar(80)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `idDocente` int(11) NOT NULL,
  `apellido_nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `dni` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `idTitulo` int(11) DEFAULT NULL,
  `legajo` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `direccion` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `celular` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `localidad` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`idDocente`, `apellido_nombre`, `dni`, `idTitulo`, `legajo`, `email`, `direccion`, `telefono`, `celular`, `localidad`) VALUES
(1, 'Abalos Carina', ' 22976882 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Abud Jorge Natalio', ' 4992866 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Acha Magalí', ' 28306656 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Addiechi  Barraza Erica', ' 18215849 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Aguilar Paula', ' 26268172 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Aguirre Norberto', ' 14188105 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Aguirre Sandra Fabiana', ' 17963366 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Albanece Raul', ' 20361462 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Albano Giorgi Daniel', ' 16510626 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Alby Juan Carlos', ' 12882704 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Aliani Néstor Rubén', ' 22283236 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Allois fabio', ' 22045557 \r', NULL, '', NULL, NULL, NULL, NULL, NULL),
(13, 'Almeida María Eugenia', ' 22837620 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Alonso Fabiana Ceferina', ' 18587295 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Altamirano Stella Maris', ' 17850872 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Altamirano Gisela', ' 28567444 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Alvarez Graciela', ' 17278001 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Alvarez María Silvia', ' 23841605 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Alzugaray Silvina Mariela', ' 30322947 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Amarillo Elvio Matias', ' 31567627 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Amarillo Nestor Sebastian', ' 29883859 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Amata Mariela', ' 20189414 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Andreoli Washington Atencio', ' 31595468 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Angelino María Alfonsina', ' 22511824 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Ansaldi Soledad', ' 24322305 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Anunziatto Alberto Daniel', ' 21912011 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Aranguren Veronica Emma', ' 24958522 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Ardaiz Oscar Anibal', ' 16843057 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Arellano Diego Roberto', ' 26809063 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Arellano Gisela Marisel', ' 29269783 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Arevalo Mariana', ' 27617556 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Arigos María Esperanza', ' 29768727 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Arlettaz Carina', ' 22402197 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Arrigo Jorge Gustavo', ' 17329611 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Artucio Gustavo Eduardo', ' 14357192 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Ascua Pablo', ' 18242252 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Astudilla Conrado Rudy', ' 20969646 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Auch Marcela Carina', ' 25730616 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Aumenta Patricia', ' 17552257 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Aviani Juan Carlos', ' 14093243 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Avveduto Carlos Alberto', ' 17648938 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Azar María Florencia', ' 26639842 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Azc rate María Claudia', ' 25907176 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Badano María del Rosario', ' 10824263 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Bagnis Matias Emiliano', ' 31017782 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Ballesteros Luis Alejandro', ' 17615527 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Barattero Andrea Edit', ' 17962706 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Barbagelata Norma', ' 10229595 \r', 60, '60', NULL, NULL, NULL, NULL, NULL),
(49, 'Barbar  Julieta', ' 26964722 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Barbiero Julia Marina', ' 24264263 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Barbosa Mirta Susana', ' 13182150 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Barisone Ornela', ' 31879359 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'Baron Graciela Beatriz', ' 18006332 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Barreto Alejandra', ' 21512641 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Barreto Ana María', ' 12885811 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Barrios Yamil', ' 30620109 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'Barsanti Liliana Beatriz', ' 16612385 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'Barzola Paola Natalia', ' 25701092 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Bassini Nestor', ' 13188617 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Baucero Verónica', ' 20997422 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'Baudino Silvina Sandra', ' 17868470 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Bauer Claudia Georgina', ' 26787700 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Bayona Sandra Mercedes', ' 21427658 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Bechara Marcelo Alejandro', ' 21789218 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'Beade Adriana Maria Estela', ' 12313987 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Bekes Alfonso Manuel', ' 30691391 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Belloni Osvaldo Francisco Javier', ' 24140680 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Benedetti Maria Gracia', ' 17325181 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Beninca Norma', ' 17954798 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Bergallo Sergio Ventura', ' 14048420 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'Bernasconi Alejandro', ' 21696642 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Berone Lucas', ' 25697959 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'Berrón Manuel', ' 24943761 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'Bertelotti Ecio Antonio', ' 8441577 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'Bertin Fabiana Lidia', ' 17716775 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'Bertozzi Maria Andrea', ' 21512235 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'Betti Belén', ' 28132554 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Bianchi Alejandro', ' 22061892 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'Bianciotto María Laura', ' 28017145 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'Biondi Horacio Jose', ' 7698177 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'Biorda Virginia', ' 29281098 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'Bisa Ramiro', ' 26424422 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'Blanca Emmanuel Martín', ' 30863717 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'Blanco Daniel', ' 23394537 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'Blanco Leonardo', ' 21912206 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'Blanda Guillermina', ' 22026850 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Blestcher Martiniano', ' 24268086 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'Boari Hugo', ' 16182152 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'Boeykens Juliana Ximena', ' 24264578 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'Boffelli Viviana Carolina', ' 21696352 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'Bojarsky Gabriela Betriz', ' 23203981 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'Bolcatto Rafael', ' 29855612 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Bolzán Claudia Leonor', ' 16955118 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'Bonelli Mariana Alejandra', ' 24357547 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'Bonfils Andrea', ' 14718228 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'Bonin Raquel', ' 14936684 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'Borgetto Andres', ' 17963528 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'Borgogno Ariela', ' 25519643 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'Borgogno Cuaranta Monica Beatriz', ' 21600274 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'Bortagaray Ma Angeles', ' 26996744 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'Bourband Luisina', ' 25416616 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'Bovo Mercedes', ' 21512705 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'Boxler Nora', ' 22150666 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'Bregani Roberto', ' 26306428 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'Bressan Analía Liliana', ' 27466040 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'Britos Marcela', ' 20369633 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'Brodsky Sergio Luis', ' 21060260 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'Bruera Maximiliano José', ' 25307533 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'Brunner Valeria', ' 16795857 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'Bruno Florencia', ' 26306663 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'Bulos Nidia', ' 20623625 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'Bulos José', ' 25032343 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'Buselli Maria Patricia', '11071997\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'Bustafan Matías Armando', ' 29882224 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'Bustos Claudia Teresita', ' 17487501 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'Caballero Mirta', ' 22149647 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'Cabral Migno Mariano', ' 7708180 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'Cabrera Cesar Patricio', ' 26150692 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'Cabrera Maria Lorena', ' 26755277 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Cabrera Patricia', ' 27833581 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'Cabrera Morales Roberto', ' 92618664 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'Cabrol Gloria Beatriz', ' 6212794 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'Cáceres José Jesus', ' 11096017 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'Caceres Marcia Alejandra', ' 25993560 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'Calgaro Mariana Natalia', ' 28159977 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'Calgaro Valeria', ' 26966035 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'Calzia Silvana', ' 25025657 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'Camartino Flavio', ' 17963606 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'Camartino Marta', ' 16048040 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'Camino Anahí', ' 32411167 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'Campins Claudia Alejandra', ' 22308932 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'Campos  Laura', ' 18239357 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'Camps Maria Andrea', ' 14893235 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'Canale Fernando Gastón', ' 28257738 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'Cañete Berón Claudio Gabriel', ' 21427822 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'Capello Sandra', ' 20096282 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'Carbone Daniel Alberto', ' 14571478 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'Carmona Silvina Beatriz', ' 17174639 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'Carñel Griselda Elena', ' 12313342 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'Carrancio Lucio Anibal', ' 20369267 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'Carrizo Silvina', ' 23275466 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'Casadoumecq María Inés', ' 12667561 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'Casas Mariana Lorena', ' 26270976 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'Cassaretto Andres Honorio', ' 16611685 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'Castañeda Liliana Alel', ' 14604581 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'Castaño Esteban', ' 24520962 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'Castelnuovo Javier Ricardo', ' 26347960 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'Castelao Gabriel Fernando', ' 16818080 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'Casualde Maria Fernanda', ' 23352187 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'Cattaneo Ricardo', ' 22280183 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'Cavia Manuel', ' 12815356 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'Cejas Agustina', ' 28358079 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'Celestre Carina Patricia', ' 23278795 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'Céparo Martín Luis María', ' 30322230 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'Cerini Lucrecia Constanza', ' 25032418 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'Cerini María Antonella', ' 27346515 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'Cerrudo Luis Angel', ' 16609287 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'César Nancy', ' 22839063 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'Chavepeyre Sandra Mariela', ' 17476790 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'Chernigoy Liliana', ' 12523081 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'Chiappa Carla Tamara', ' 30449930 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'Chiappero Rubén Osvaldo', ' 12437357 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'Chieno Ana María', ' 6727161 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 'Chiozza Maria Cristina', ' 18492830 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'Chudoba Raul', ' 18757680 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'Cicarelli Marcela Guadalupe', ' 18167754 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'Cipria Laura Susana', ' 12499910 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 'Citroni Julieta', ' 30961847 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'Cladera Vanesa', ' 26306489 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'Clementi José Emilio', ' 27006283 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'Cogonosky Elsa', ' 6218971 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'Collet Vanesa', ' 28575040 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 'Colobig Milagros', ' 24717903 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'Colovini María Teresa', ' 6685940 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'Consenza Mónica Graciela', ' 12662353 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'Conte Clelia', ' 5573286 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'Conte Virginia', ' 26964710 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'Corazzini Gastón Fabián', ' 20697466 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'Corfield María Isabel', ' 16182157 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'Correa Barbara', ' 22026746 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 'Cortiñas Liliana Beatriz', ' 24202459 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'Costa Leticia del Carmen', ' 21423403 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'Cot Marta María', ' 13519374 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'Cottet Selva', ' 31394897 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'Coudannes Mariela Alejandra', ' 23929350 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'Crolla Adriana Cristina', ' 11115570 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'Cuadra Adriana', ' 16981457 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'Cuaranta Eduardo', ' 11445929 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'Cuende Graciela Alejandra', ' 14160934 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'Cura Maria Rosana Herminia', ' 20478835 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'Cura Sandra Silvina', ' 20553685 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'Damico Carlos Marcelo', ' 23578118 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'Dahlquist Manuel Alberto', ' 21912026 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'Dalinger Jackeline Daiana', ' 33033891 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'Dalinger Paula Mariana', ' 26540875 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'Dallaglio María Renata', ' 27467336 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'Daneri María Gloria', ' 16795777 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'Dangelo Celia', ' 16843107 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'Daschevsky María Victoria', ' 27804736 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'Dayub María Teresita', ' 14993362 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'De Angelli Maria', ' 12556648 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'De Biaggi María Lidia', ' 18243115 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'De Cesaris Adriana Patricia', ' 21411829 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'De Gracia Laura', ' 22544340 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'De León Marta', ' 21512160 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'De Sousa Frade Silvana', ' 22750888 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'De Zan María Eugenia', ' 24876596 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'Delaloye Amalia Mercedes', ' 13288912 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'Del Prado Leonel', ' 28471633 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'Della Ceca Marcela', ' 18391519 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'Dell\'Acqua Juan Pablo', ' 16854164 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'Delmonte Osvaldo', ' 11057524 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'Demarchi Mariela Georgina', ' 23587061 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'Demonte Mariano Facundo', ' 25546403 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'Díaz Anibal', ' 14128185 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'Diaz Velez María Noelia', ' 33510448 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'Dieci Laura Liliana', ' 22906275 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'Dines Sergio', ' 22761410 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'Dobler María del Pilar', ' 18581668 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'Dobry Marcelo Luis', ' 12944496 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'Donadio Pablo', ' 16166562 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'Dorato Susana', ' 18313361 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'Dorbesi María José', ' 16161419 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'Dri Maria Laura', ' 23368382 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'Drueta Hugo Victor', ' 17664853 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'Duhalde Miguel', ' 16163732 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'Dume Diego', ' 25546951 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'Duran Griselda', ' 17329759 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'Duten Mario', ' 11288338 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'Dutra Silvia Susana', ' 16843070 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'Dutra Alejandro Manuel', ' 26709876 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'Eberle Laura Rosana', ' 24637615 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'Eguiguren Soledad', ' 22737462 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'Elgart Carlos', ' 22975309 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'Emyashev Eugen', ' 18793247 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'Enria Diego Alejandro', ' 13883049 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'Ekertt Maria Ester', ' 13599268 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'Erm cora Jorge Alberto', ' 26773281 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'Eskenazi Matías', ' 26435192 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'Espelosín Erika', ' 30574322 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'Esper María Cecilia', ' 17963339 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'Espindola Andrea Isabel', ' 32305531 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'Espinosa Mirta', ' 17799695 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'Fagetti Ana', ' 14691441 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'Fagetti Elba Noemí', ' 18030439 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'Faingenbaum Gustavo', ' 18024256 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'Federik Celina Margarita', ' 24264023 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'Fernandez Chapo Gabriel', ' 24313359 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 'Fernandez Fabiana Andrea', ' 21414309 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'Fernandez Gabriela Aurora', ' 21907916 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'Fernandez Marcela', ' 13422109 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'Fernandez Roberto', ' 28695519 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'Fernandez Veronica', ' 23458387 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'Fernandez Zulma', ' 29483142 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'Ferrero Antonio', ' 14838230 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'Ferreira Carmela', ' 22342470 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'Ferreyra Maria del Carmen', ' 6293352 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'Ferreyra Patricia', ' 14367661 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'Fiore Maria Eugenia', ' 22342011 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'Firpo Arturo Roberto', ' 8451795 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'Fishbach Veronica', ' 21427727 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'Flematti Brigida', ' 21427891 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'Florenza Rafael Eduardo', ' 11071082 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'Flores Soraya Nélida', ' 14571589 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'Floresta Diana María Araceli', ' 13182451 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'Florin Norma Beatriz', ' 12653682 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'Flory Andrea Violeta', ' 17616086 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, 'Folini Valeria', ' 22276709 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, 'Follín Heraldo', ' 16217040 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'Follonier Laura Mariana', ' 14367703 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'Follonier Leonardo', ' 31732976 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'Formenti Maria Soledad', ' 29720357 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'Fraiman Juan Alberto', ' 27168308 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 'Francia Ignacio', ' 23439626 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 'Francisconi Alfonsina', ' 31229954 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 'Franco Esteban', ' 20096390 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(277, 'Frías Claudio Alejandro', ' 14094742 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'Fuchs Valeria', ' 28959265 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'Fuentes Marcos Martín', ' 17329897 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, 'Gabas Marta', ' 14718167 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(281, 'Gaitán Claudia Patricia', ' 20457040 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'Galarraga Gloria María Isabel', ' 12284118 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'Galarza Vanina Carolina', ' 25546188 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 'Galcer n Maisabel', ' 25416663 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'Galdos María Beatriz', ' 16787468 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'Galeano Mónica Susana', ' 14018115 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'Gallizzi Claudia Alejandra', ' 12451270 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'García Martín Abelardo', ' 18487543 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 'García Hugo Alberto', ' 8441157 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, 'García María Silvina', ' 18489825 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'García Rouseaux Alejandra', ' 26610911 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 'Garrefa Marcelina', ' 17516082 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'Gatti Verónica Andrea', ' 23190563 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 'Gauna Facundo Nicolás', ' 30432160 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(295, 'Gava Solange', ' 25625309 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, 'Geertsen Ingrid', ' 25576025 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'Gelmini Juri Natalia', ' 92860244 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 'Germaniez Luis', ' 18161737 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(299, 'Ghiglione María Eva', ' 23880062 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, 'Gibbons Silvana', ' 25017751 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'Gili Laura Anabella', ' 24919444 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'Gigena Noemi Adriana', ' 13593116 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'Giles Oscar', ' 10280798 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'Gimenez Ana', ' 16787918 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(305, 'Gimenez José', ' 18418362 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(306, 'Gimenez Mónica Carolina', ' 25902306 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(307, 'Giordano Nanci del Carmen', ' 17761087 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(308, 'Gioria Blanca', ' 5912008 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'Giroud Daniela', ' 30175485 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(310, 'Giusti Celia Estela', ' 21427775 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(311, 'Glucklich Carlos Andrés', ' 5955720 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'Godoy Daniela María Cristina', ' 27840091 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'Godoy Gisela', ' 28471619 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'Godoy Hector Maximiliano', ' 31439661 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'Godoy Magdalena', ' 14604850 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'Goettig Carolina Beatriz', ' 20573909 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'Gogniat Sandra Ines', ' 21912618 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'Gomer Adriana Graciela', ' 24899531 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'Gomez Collusi José', ' 31439904 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(320, 'Gomez Delgado María Macarena', ' 29065720 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'Gomez Julian Leonardo', ' 26809816 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'Gomez Manuel Ceferino', ' 26048798 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'Gomez Marta Teresa', ' 12772941 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'Gomez Nestor Javier', ' 24232672 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(325, 'Gomez Walter Rafael', ' 17962763 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(326, 'Gonzales Lowy Ignacio Luis', ' 25910562 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'Gonzalez Adriana Edith', ' 16405359 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(328, 'Gonzalez Mario Ivan', ' 24184406 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'Gonzalez Sergio', ' 20099600 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(330, 'Gonzalez Nicolini Claudio', ' 13404704 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'Gonzalez Luciano Arnoldo', ' 26809052 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'Gonzalez Valeria(Port)', ' 26306338 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 'Gordon Olga Susana', ' 5789197 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, 'Gorischnik Roberta', ' 21425333 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'Gorlero Alejandra', ' 21669506 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(336, 'Gotardo Rita María de la Paz', ' 29759792 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(337, 'Gotte Emiliana Norma', ' 22705593 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'Goya Romina Mariana', ' 29597689 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'Gracia Mariel Viviana', ' 13799151 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'Gramillo María Paula', ' 28533760 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'Grasso María Velia Nora', ' 6211424 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(342, 'Greca Carina Maria', ' 20096383 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'Grianta Maria Luisa', ' 5298642 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'Grillone Marisel', ' 22737308 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'Grinóvero Nora Ines', ' 17788254 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'Grippo Margarita María', ' 18399767 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'Grippo Rodolfo Guillermo', ' 16795784 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'Guarischi Soledad Andrea', ' 25416795 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'Guastavino Patricia Silvina', ' 25956435 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'Guerra Maria Fernanda', ' 24752133 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(351, 'Guerrero Rita', ' 16048124 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'Guevara Lilian Natalia', ' 24054406 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'Guridi Griselda Noemí', ' 14936871 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'Guzm n Elsa', ' 11772824 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'Hadad Mariano Oscar', ' 17963378 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'Hang Laura Virginia', ' 16817838 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 'Hanson Elida Susana', ' 10336412 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 'Harris Nimpsi', ' 30322006 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(359, 'Heinrrich Alejandro Francisco', ' 16056381 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'Hennekens Guillermo', ' 11807572 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'Herbón Andr‚s Beltr n', ' 14772154 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'Hereñu Gabriela', ' 30164401 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'Hermann Norma Beatriz', ' 17036774 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'Herrera Verónica Susana', ' 24648310 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(365, 'Hilbe Maria del Carmen', ' 16647794 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(366, 'Hildt Paola Danisa', ' 30729892 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(367, 'Homar Amalia Lucia', ' 11425974 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'Hormaiztegui Maria Eugenia', ' 11771557 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'Hutt Víctor Hugo', ' 22817467 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'Iconikoff Cynthia Susana', ' 23678957 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(371, 'Iglesias Carlos', ' 13190127 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(372, 'Imoberdoff Carolina', ' 24594504 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'Incorvaia Ivana Noelia', ' 27330411 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(374, 'Ingrasia Franco', ' 25328148 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(375, 'Isaac Eduardo', ' 12284143 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 'Jacobo Carlos Humberto', ' 21425926 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 'Joannas Carolina Andrea', ' 27425734 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(378, 'Joannas Leonardo Ariel', ' 23767021 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 'Juarez Julia Sixta', ' 5937473 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(380, 'Julia Adrian Antonio', ' 17774941 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'Julia Andrea', ' 14957621 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'Juncosa María Elena', ' 11220441 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(383, 'Jurado Gonzalo', ' 31022689 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(384, 'Kay Viviana', ' 14128721 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 'Kindernecht Gabriela Lorena', ' 27836967 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, 'Klocker Dante Eugenio', ' 23190516 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(387, 'Kober Stella Maris', ' 17296991 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(388, 'Kohan Alfonsina', ' 24488988 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'Kovalsky Juliana', ' 26188164 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(390, 'Kozul Pedro Rodolfo', ' 34112558 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'Kunisch Gustavo', ' 14094946 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(392, 'Kunzi Ingrid Viviana', ' 24264058 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(393, 'Laboranti Maria Ines', ' 12944415 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(394, 'Labriola Silvina', ' 24236014 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'Laferrara Mauricio Alejandro', ' 28647827 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 'Laiker Alejandra Anahí', ' 32565009 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'Lallana Nancy Soledad', ' 26992921 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(398, 'Lambruschini Gustavo', ' 7622256 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(399, 'Larrechart Silvia B', ' 18487624 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, 'Larroca Pablo Gastón', ' 31022146 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 'Lastre Ricardo Francisco', ' 16682464 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'Latronico Lilia', ' 14357115 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 'Lazarte Mauro  Germ n', ' 28959411 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'Ledesma Eliana Beatriz', ' 31162466 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'Leibovich Lyda Ruth', ' 14998226 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'Leichner Carina Silvana', ' 20658506 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 'Leiva Maria Margarita', ' 20457696 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'Leiva Francisco Marcelo', ' 17591608 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 'Leiva Maria Laura', ' 25032915 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'Leiva Natalia Martina', ' 26989778 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 'Lenarduzzi Zulma Viviana', ' 18006361 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(412, 'Lencina René', ' 27116874 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(413, 'Leonardi Leticia', ' 17876257 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(414, 'Levín Raúl', ' 18243312 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 'Lizarraga Claudio Horacio', ' 20587750 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(416, 'Lopez Celia', ' 4220616 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(417, 'López María del Pilar', ' 16796289 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(418, 'Lorusso Eduardo', ' 13211298 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(419, 'Lucero Patricia', ' 11272494 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(420, 'Lupi Lautaro', ' 23386810 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 'Maidana Morelli María Carolina', ' 24264222 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, 'Main Miguel Angel', ' 13353433 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, 'Mamani Ariel', ' 23928806 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, 'Mangone Marcelo Luis', ' 16495783 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(425, 'Maragno Marcelo Gabriel', ' 12882881 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(426, 'Maranzana Maria Viviana', ' 16123674 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(427, 'Marclay Stella Maris', ' 20097863 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(428, 'Marek Alejandra Maria Teresita', ' 13586598 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(429, 'Marinoni Betiana', ' 29656182 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 'Marquez Alcira Ana', ' 21041131 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 'Martens Carlos', ' 14832640 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, 'Marti Cristina Isabel', ' 14077335 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 'Martinet Graciela Ana María', ' 5973705 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(434, 'Martinez Maria Eugenia', ' 26276879 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(435, 'Martinez Mónica', ' 16752375 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(436, 'Martínez Viviana Marcela', ' 20882245 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(437, 'Martinez Miriam', ' 23696434 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(438, 'Masariche Nelida  Beatriz', ' 13043706 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(439, 'Masoero Hugo', ' 17160654 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(440, 'Massa Carlos Fernando', ' 11255847 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 'Masutti Mabel Haydee', ' 10618155 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(442, 'Mateo Amanda', ' 22892773 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(443, 'Mateo Claudia', ' 26332795 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 'Matharan Gabriel Augusto', ' 24273769 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(445, 'Maturano Agueda Valentina', ' 16609278 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(446, 'Mayer María Susana', ' 16431271 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 'Mazziteli Malena', ' 25558729 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(448, 'Mazur Gabriel Andres', ' 22598554 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(449, 'Medina Sabrina', ' 29024780 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(450, 'Medina Silvia', ' 16796127 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(451, 'Medina Gerardo Angel', ' 22800887 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(452, 'Mega Aixa', ' 24469470 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(453, 'Melchiori Carolina Mirta', ' 26789336 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, 'Mendez Ernesto', ' 20189287 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 'Mendiburo Anibal Alfredo', ' 28565743 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(456, 'Mendez Marcela', ' 21366847 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 'Menis Maria Alejandra', ' 16166310 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'Menna María de loa Angeles', ' 20392700 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(459, 'Mentasti Sara del Rosario', ' 11200742 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(460, 'Meresmann Guillermo', ' 18521665 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(461, 'Messina Martín Luciano', ' 28678478 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(462, 'Meurer Lydia R', ' 4834462 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(463, 'Mian Luciana Carina', ' 29171845 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 'Milano Glenda Lucía', ' 24264997 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 'Miletich Gustavo Miguel', ' 17329813 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 'Miño Andrea Lorena', ' 31016001 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 'Miotto Patricia Noemí', ' 14571857 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 'Miranda Javier Ignacio', ' 28419811 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 'Montañana Silvia Mabel', ' 20097855 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(470, 'Montefinale Alicia', ' 17552383 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 'Monzalvo Guillermo', ' 13697340 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 'Monzón Gabriela Adriana', ' 20894168 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 'Monzón María Inés', ' 32621026 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 'Morais María Jimena', ' 28109909 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 'Mulone María Virginia', ' 22026846 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 'Munne Guillermo Javier', ' 20806704 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(477, 'Muñoz Graciela Bibiana', ' 12110606 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'Muñoz Norma', ' 5254332 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 'Muñoz Gabriela', ' 35404363 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(480, 'Muñoz Julio Ricardo', ' 20097950 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(481, 'Muñoz Luis Alberto', ' 10380732 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(482, 'Murillo María Paula', ' 31457246 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(483, 'Musich Walter', ' 21912091 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(484, 'Mussi Carlos Miguel', ' 12527772 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(485, 'Muzachiodi Maria Susana', ' 18515381 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(486, 'Muzzachiodi Norberto', ' 18519445 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(487, 'Muzzio Marcó Maria Florencia', ' 21512466 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(488, 'Nadalich Nelci Susana', ' 17964211 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(489, 'Nagy Denise', ' 16240794 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 'Nanni Domingo', ' 8452581 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 'Naput Laura Marcela', ' 20461459 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'Navarrete Gretel Luz', ' 22342622 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'Navoni Maria Gabriela', ' 16107652 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(494, 'Neifert Ivana Walquiria', ' 25902310 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(495, 'Nesa Emanuel', ' 26332421 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(496, 'Nesa Paula', ' 23578937 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(497, 'Nuñez Ana Valeria', ' 23880813 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(498, 'Odelli Ana Karina', ' 18158029 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(499, 'Odetti Veronica Beatriz', ' 25806266 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, 'Olalla Daniel Marcelo', ' 18278177 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(501, 'Olalla Valeria', ' 26276413 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'Olego Miriam', ' 26583157 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'Olivari Gabriela Alejandra', ' 28400905 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(504, 'Olivieri María Paula', ' 23171505 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(505, 'Olivera Diana María', ' 11071276 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506, 'Olmos Marcelo', ' 4992363 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(507, 'Ormache Aranzazú', ' 27833324 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(508, 'Ortiz Ana', ' 22737943 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(509, 'Osán Claudio', ' 16787536 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(510, 'Oviedo Olga Ester', ' 10380857 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(511, 'Paday Alicia Yolanda', ' 20211000 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, 'Pagani Marina Isabel', ' 13188051 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, 'Paggi César Leonardo', ' 25910581 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(514, 'Pagotto Eleonora', ' 21912845 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(515, 'Paira Ileana Lilian', ' 24264151 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(516, 'Pais Laura Gisela', ' 32231192 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(517, 'Palleiro Luciana', ' 29855261 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(518, 'Panizza Nicol s', ' 30107510 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(519, 'Paredes Graciela Beatriz', ' 16166245 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(520, 'Parra Garzon Gabriela', ' 24073138 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, 'Paz Stella Maris', ' 10949821 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(522, 'Pedelhez Javier Amado', ' 17616013 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, 'Perassi Marisol Liliana', ' 27887432 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, 'Percara Antonella', ' 29971067 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(525, 'Pereira Gustavo Alejandro', ' 21427994 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(526, 'Peretti Gustavo', ' 21419312 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(527, 'Pereyra Aníbal Humberto', ' 13631184 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(528, 'Pereyra Liliana In‚s', ' 11584369 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(529, 'PereyraVeronica', ' 22342422 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 'Perez Campos Ana Bella', ' 13360155 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(531, 'Perez Luque Ignacio', ' 17706027 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, 'Perez Gabriel', ' 20369009 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(533, 'Perez Sonia', ' 16465991 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, 'Pesce Maria Marta', ' 20698631 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'Petrucci Liliana', ' 10824449 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(536, 'Piedrabuena Mariela', ' 22524616 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(537, 'Piemonti Maria Gabriela', ' 17462436 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(538, 'Pierotti Lisandro', ' 22342485 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 'Pinget Angelica Teresa', ' 12259748 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(540, 'Pino Adrián Matías', ' 24236477 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(541, 'Pirro Luis María', ' 13668382 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(542, 'Pirro José Alejandro', ' 16787447 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(543, 'Pistrilli Agostina', ' 31232485 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(544, 'Pita Miguel Augusto', ' 8006046 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 'Piter Patricia', ' 30249953 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(546, 'Pizzio Gustavo Javier', ' 24732644 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(547, 'Pletti Bilbao Gastón Moisés', ' 23131853 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(548, 'Poerio Fabian Jesús', ' 17329630 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(549, 'Poggio Maria Cecilia', ' 23051390 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(550, 'Policastro Leonel', ' 27497906 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(551, 'Ponce Carina', ' 25025666 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(552, 'Portillo Norma', ' 18831572 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(553, 'Pressel Griselda Elisa', ' 14094029 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(554, 'Puga Maria de los Dolores', ' 16609297 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(555, 'Puglisi Alejandra', ' 18243267 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(556, 'Puigarnau Norma', ' 14051579 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(557, 'Pujol Gabriela María Laura', ' 28471576 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(558, 'Quiroga Carolina', ' 20882465 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(559, 'Quiroga María Cristina', ' 10399301 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(560, 'Quinodoz Analía', ' 25902377 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(561, 'Quinodoz Pedro', ' 13599038 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(562, 'Rafaelli Graciela', ' 16879941 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(563, 'Raffin Enrique Hermes', ' 24726915 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(564, 'Raffo María Laura Soledad', ' 30166465 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(565, 'Ramayo Salvador', ' 30786803 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(566, 'Ramirez Francisco', ' 23880245 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(567, 'Ramirez Rosana Maricel', ' 25694117 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(568, 'Ramirez Ayelen Gabriela', ' 28913240 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(569, 'Ramirez Ricardo Martin', ' 29620879 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(570, 'Ramos Rosa Elina', ' 20259275 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(571, 'Ramos Estela', ' 13723787 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(572, 'Ramos Hugo Luciano', ' 30152984 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(573, 'Raniolo Lelia', ' 16981035 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(574, 'Ravera Marcela Viviana', ' 16787444 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(575, 'Re Fernando', ' 22800829 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(576, 'Reca Rios Gaspar Ignacio', ' 25861726 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(577, 'Recalde María Delfina', ' 29971425 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(578, 'Ricciardino C‚sar', ' 12142693 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(579, 'Rigotti Sebastián Miguel', ' 28132814 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(580, 'Risso Juan Manuel', ' 25676703 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(581, 'Rodriguez Celestina', ' 17962849 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `docentes` (`idDocente`, `apellido_nombre`, `dni`, `idTitulo`, `legajo`, `email`, `direccion`, `telefono`, `celular`, `localidad`) VALUES
(582, 'Rodriguez María Celina', ' 11540365 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(583, 'Rodriguez Diana Analía', ' 29883889 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(584, 'Rodriguez María A', ' 28610847 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(585, 'Rom n Mario Sebastián', ' 21912395 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(586, 'Ronchi Virgolini Ana', ' 24536606 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(587, 'Ronconi Alejandro Agustin', ' 30950814 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(588, 'Rosa Maria Bernarda', ' 17044312 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(589, 'Ross Nerina', ' 22837636 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(590, 'Rosetti Julia', ' 24202665 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(591, 'Rossanigo Claudina', ' 27134776 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(592, 'Rottoli Carolina Mabel', ' 29315005 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(593, 'Rougier María Elena', ' 16614423 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(594, 'Rozados Mariano', ' 24590717 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(595, 'Ruatta Lautaro Matías', ' 27480896 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(596, 'Rufini Patricia Noemí', ' 17722623 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(597, 'Ruiz Alejandro Pablo', ' 17487219 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(598, 'Sabao Dominguez Maria', ' 22698241 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(599, 'Sabatini Maria de los Milagros', ' 22737904 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(600, 'Sabelotti Jose', ' 16787676 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 'Sack Yanina Andrea', ' 24401273 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 'Saccone Mercedes', ' 31842182 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 'Saint Paul Zuzenegui Mariana', ' 31521126 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 'Salamone Rosa', ' 17476815 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 'Salvarredy Beatriz Herminia', ' 6046728 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 'San Rom n Viviana', ' 6523248 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 'Sanchez Paola de las Mercedes', ' 27618367 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 'Sanchez Claudia Carolina', ' 28533982 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 'Sanchez  Maria de los Angeles', ' 29379133 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 'Sandler Elda Viviana', ' 16466402 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 'Santoianni Patricia Lilian', ' 16924886 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 'Sarlo Juliana Alejandra', ' 21647117 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 'Sarmiento Luciana', ' 28913514 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 'Sartori María Elisa', ' 11029995 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 'Satto Mariela', ' 31052739 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(616, 'Saux María Susana', ' 18502416 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(617, 'Scaramella Christian', ' 22098739 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 'Scardino Mara Elsa', ' 23695778 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(619, 'Scattini Rom n Marcelo', ' 31232016 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(620, 'Scetti Ana Delia', ' 21512318 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(621, 'Schaab Ana Laura', ' 26802114 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 'Schamle Ana Maria', ' 12729966 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, 'Schiavo María Valeria', ' 23696499 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'Schierloh Silvia Beatriz', ' 20855906 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, 'Schimpf Elizabeth Graciela', ' 24613622 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 'Schoj D‚bora', ' 25236797 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, 'Schonfeld Natalia', ' 31848011 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, 'Schvab Brenda', ' 25630346 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, 'Scocco Maria Julia', ' 10499123 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, 'Scrinzi Mariana Maria del L', ' 25470902 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 'Segura Carlos David Salomón', ' 22836912 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 'Seib SIlvia', ' 12756365 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, 'Seija Maria Inés', ' 27607924 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, 'Serra Laura', ' 20778560 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, 'Sesto Carmen', ' 5486042 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, 'Sferco Senda Inés', ' 26142775 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, 'Sforza Maria Mónica', ' 14076040 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 'Siebenhan Martin', ' 30730985 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 'Silguero Silvana', ' 25807210 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, 'Silva Analía Karina', ' 21912110 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 'Silva Gabriel Hector', ' 24596166 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, 'Silva María Luz', ' 27346354 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, 'Silvetti Noelia Nieves', ' 23794303 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, 'Simesen de Bielke Norma Claudia', ' 16784323 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, 'Simioli Leticia', ' 24155921ÿ \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 'Simón Marina', ' 24245263 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, 'Simón Silvina', ' 18193863 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, 'Sione Sandra Carina', ' 24630655 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'Sirota Gustavo Mario', ' 17552049 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, 'Soave Alejandra', ' 22491425 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, 'Soler Ana María', ' 5664563 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, 'Sollier María Laura', ' 32327651 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, 'Solari Ana Clara', ' 29447413 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, 'Soñez Maria Elena', ' 16787302 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, 'Sors Maria Mercedes', ' 25861920 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'Sosa Sofía', ' 34332773 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'Sostar María Eugenia Milagros', ' 27880826 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 'Soto Maria Alejandra', ' 23279895 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, 'Spada María Fernanda', ' 17552119 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, 'Staffolani Claudio Mario', ' 14494545 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, 'Stiefel Ivan Dario', ' 25499863 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, 'Stola Enrique Oscar', ' 7625163 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, 'Strada Vilma Guadalupe', ' 25993553 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'Strappa Graciela Ana', ' 11871859 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 'Suarez Diego', ' 27299035 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'Sunker Liza Mariana', ' 23813690 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, 'Suppo Silvana Carolina', ' 22642963 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'Surraco Mayka', ' 30863628 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 'Taboada Beatriz', ' 23696155 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, 'Talamo Federico', ' 31874279 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, 'Tamayo Isabel', ' 92786147 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, 'Taubas Esteban', ' 26866228 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'Tarulli  Margarita Gloria Ramona', ' 10824134 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'Techera Yanina', ' 26866534 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'Teira Daniel', ' 21060314 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, 'Terpin Amado Brenda Beatriz', ' 30165761 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'Terpin Amado Eunice', ' 25803985 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, 'Tibaldi Carmen María del Huerto', ' 13182516 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, 'Tizzoni Adriana', ' 14604917 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, 'Toledo Marcela Paula', ' 28636101 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'Toniutti Norma', ' 5699960 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'Tourfini María del Carmen', ' 4923656 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 'Tournoud  Raul', ' 20813638 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, 'Tournour Fabio', ' 20724200 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 'Traver German David', ' 21525971 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(686, 'Trevisan Aljandra Marcela', ' 25861063 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(687, 'Triano Jose Maria', ' 11071790 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(688, 'Trujillo Cecilia', ' 25611951 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 'Uboldi Alberto Gabriel', ' 17773079 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 'Unrein Mónica', ' 21529497 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 'Ur n Juan', ' 28533643 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(692, 'Uranga Gallino Francisco', ' 5953493 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'Uranga Juan Domingo', ' 21567417 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(694, 'Uriburu Lilia Mónica', ' 27346369 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(695, 'Uzin Olleros Angelina Elena', ' 14604838 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(696, 'Vaena Estela Beatriz', ' 16346746 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'Vainstub Nancy Corina', ' 18546137 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'Vald‚s Marianela', ' 32096370 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'Valente Ma Luisa', ' 16787053 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(700, 'Valentinuz Susana', ' 20096183 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, 'Valmarrosa María Claudia', ' 11932783 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, 'Varela Jos‚', ' 17963367 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, 'Varela Juan Cruz', ' 18788661 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, 'Varela Javier Patricio', ' 17781565 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'Varisco Mariano', ' 30243129 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'Vazón Silvina', ' 20813166 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, 'Vazquez Natalia', ' 33025102 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(708, 'Velazquez Dario Sebastian', ' 27006189 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(709, 'Venere Maria', ' 27294037 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(710, 'Vergara Ana Ester', ' 5015669 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(711, 'Vergniaud Marta', ' 12259054 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 'Vesco Alfonsina', ' 23578156 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 'Viana Mirta Graciela', ' 16166181 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 'Vianco Vanina Soledad', ' 26615529 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 'Victor Alicia Roxana', ' 14357088 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, 'Victorio Luis', ' 18071925 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(717, 'Villa Claudio Leonardo', ' 22110390 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(718, 'Villagra Maria Inés', ' 10662640 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(719, 'Villamonte Patricia', ' 12729901 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(720, 'Villemur Elina', ' 18099246 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(721, 'Visintini María Laura', ' 23719478 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(722, 'Vitale Nilda Noemí', ' 11807864 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(723, 'Vitali Sonia Beatriz', ' 20553728 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(724, 'Vlasic Verónica Magdalena', ' 27833420 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(725, 'Vuotto Maria Clara', ' 31434588 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(726, 'Wagner Laura Yolanda', ' 20189811 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(727, 'Weimer Sonia', ' 21640637 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(728, 'Wilson Cristian Jorge', ' 28648065 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(729, 'Wustten Marta Verónica', ' 23190488 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(730, 'Yausaz Elsa', ' 6070173 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(731, 'Yob Jimena', ' 28526076 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(732, 'Yuan María Sol', ' 29142452 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(733, 'Yugdar Tofalo Graciela Elizabeth', ' 23190566 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(734, 'Zabalegui Maria Fernanda', ' 27006660 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(735, 'Zaccagnini Maria Alicia', ' 6397650 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(736, 'Zalisak Bernardita', ' 23932305 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(737, 'Zamero Marta', ' 12729942 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(738, 'Zampino Martin Alejandro', ' 22793232 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(739, 'Zamponi Jesus Juan', ' 6186899 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(740, 'Zapata Icart Maximiliano', ' 25546064 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(741, 'Zarate Vanesa Georgina', ' 31246812 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(742, 'Zatti Marcela', ' 20097294 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(743, 'Zenon Pablo Leonidas', ' 17669357 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(744, 'Zeroli Agustín', ' 14629131 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(745, 'Zubiria Alejandra', ' 28783616 \r', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pas`
--

CREATE TABLE `pas` (
  `idPas` int(11) NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `apellido_nombres` varchar(50) DEFAULT NULL,
  `legajo` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `licencia` char(1) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `idTitulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Empleados Administrativos y Serv.Grales.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL,
  `apellido_nombres` varchar(50) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `idTitulo` int(11) DEFAULT NULL,
  `legajo` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `claustro` char(1) DEFAULT NULL COMMENT 'P: Pas, D:docente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planesVigentes`
--

CREATE TABLE `planesVigentes` (
  `idplanvigente` int(11) NOT NULL,
  `descripcionpv` varchar(15) DEFAULT NULL,
  `comentarios` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planesVigentes`
--

INSERT INTO `planesVigentes` (`idplanvigente`, `descripcionpv`, `comentarios`) VALUES
(1, 'RES1024/05MECYT', NULL),
(2, 'RES1039/08MECYT', NULL),
(3, 'RES1068/03MECYT', NULL),
(4, 'RES1070/05MECYT', NULL),
(5, 'RES1170/05MECYT', NULL),
(6, 'RES1172/05MECYT', NULL),
(7, 'RES1181/05MECYT', NULL),
(8, 'RES1393/05MECYT', NULL),
(9, 'RES162/03MECYT', NULL),
(10, 'RES1818/08MECYT', NULL),
(11, 'RES208/03MECYT', NULL),
(12, 'RES239/04MECYT', NULL),
(13, 'RES2891/09FHAYC', NULL),
(14, 'RES2893/09FHACS', NULL),
(15, 'RES304/04_MECYT', NULL),
(16, 'RES339/04MECYT', NULL),
(17, 'RES401/06MECYT', NULL),
(18, 'RES669/03_MECYT', NULL),
(20, 'RES692/03MECYT', NULL),
(21, 'RES724/06_MECYT', NULL),
(22, 'RES751/09MECYT', NULL),
(23, 'TODAS_LAS_CARR.', NULL),
(24, 'TODOS_PROFESORA', NULL),
(25, 'RES390/14CS', NULL),
(26, 'RES388/14CS', ''),
(27, 'RES401/15CS', NULL),
(28, 'RES0400/15CS', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretarias`
--

CREATE TABLE `secretarias` (
  `idSecretaria` int(11) NOT NULL,
  `nombreSecretaria` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `referente` varchar(80) DEFAULT NULL,
  `interno` int(11) DEFAULT NULL,
  `idSede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secretarias`
--

INSERT INTO `secretarias` (`idSecretaria`, `nombreSecretaria`, `email`, `referente`, `interno`, `idSede`) VALUES
(1, 'Secretaría General', NULL, NULL, NULL, 1),
(2, 'Secretaría Académica', NULL, NULL, NULL, 1),
(3, 'Secretaría Administrativa', NULL, NULL, NULL, 1),
(4, 'Secretaría Económico Financiera', NULL, NULL, NULL, 12),
(5, 'Secretaría Extensión Universitaria y Derechos Humanos', NULL, NULL, NULL, 1),
(6, 'Secretaría de Investigación y Postgrado', NULL, NULL, NULL, 12),
(7, 'Secretaría de Bienestar e Inclusión Estudiantil', NULL, NULL, NULL, 1),
(8, 'Secretaría de Escuelas', NULL, NULL, NULL, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `idsede` int(11) NOT NULL,
  `detalleSede` varchar(80) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`idsede`, `detalleSede`, `direccion`) VALUES
(1, 'Sede Escuela Normal', 'Urquiza y Corrientes'),
(2, 'Sede Artes Visuales \"Roberto Lopez Carnelli\"', 'Laprida 331'),
(3, 'Sede Escuela de Música, Danza y Teatro \"Constancio Carminio\"', 'Italia 61'),
(4, 'Sede Concepción del Uruguay', 'Jordana 50'),
(5, 'Escuela de Música Celia Torrá', '25 de mayo 353'),
(6, 'Sede Concordia', 'Libertad 185 (Escuela N° 44)'),
(7, 'Sede Gualeguaychú', 'San Juan 1242 (Esc. Alfredo Villalba)'),
(8, 'Extensión Aulica Federación', 'Las violetas 853 (Esc. Domingo Faustino Sarmiento)'),
(9, 'Esc. Normal Rural Alberdi', 'Ruta Pcial. N° 11 Km 10 y 1/2 - Oro Verde'),
(10, 'Esc. Normal Rural Almafuerte', 'Ruta Nac. 12 Km 23. La Picada'),
(11, 'Esc. Normal \"Jose María Torres\"', 'Corrientes y Andrés Pazos '),
(12, 'Anexo FHAyCS', 'Calle Urquiza 732');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

CREATE TABLE `titulos` (
  `idTitulo` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `nivelAcademico` char(1) DEFAULT NULL COMMENT 'G:Grado, M:Medio, P:Posgrado, R:Pregrado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `titulos`
--

INSERT INTO `titulos` (`idTitulo`, `descripcion`, `nivelAcademico`) VALUES
(1, 'Traductora (Grado) - Contadora Pública Nacional (Maestría)', NULL),
(2, 'Abogado', NULL),
(3, 'Abogada (Grado)', NULL),
(4, 'Abogado (Grado)', NULL),
(5, 'Actriz (Terciario)', NULL),
(6, 'Arquitecto (Grado)', NULL),
(7, 'Arquitecto (Grado) Especialista', NULL),
(8, 'Bióloga (Grado)', NULL),
(9, 'Bioquímica (Grado)', NULL),
(10, 'Calculista Científico (Grado)', NULL),
(11, 'Contador Público Nacional (Grado)', NULL),
(12, 'Diseñador en Comunicación Social (Grado)', NULL),
(13, 'Doctor', NULL),
(14, 'Doctora', NULL),
(15, 'Doctorado', NULL),
(16, 'Doctorado (Especialísta)', NULL),
(17, 'Especializacion (Terciaria)', NULL),
(18, 'Grado', NULL),
(19, 'Ingeniero (Grado)', NULL),
(20, 'Licenciada', NULL),
(21, 'Licenciada (Grado)', NULL),
(22, 'Licenciada (Grado) con Especialidad', NULL),
(23, 'Licenciada en Tecnología Educativa (Grado)', NULL),
(24, 'Licenciada Especialista (Grado)', NULL),
(25, 'Licenciada -Postgrado Especializacion Enseñanza Superior', NULL),
(26, 'Licenciada y Profesora', NULL),
(27, 'Licenciado', NULL),
(28, 'Licenciado - Doctorado', NULL),
(29, 'Licenciado - Doctorado en Filosofía', NULL),
(30, 'Licenciado (Grado)', NULL),
(31, 'Licenciado (Grado) Profesor Nivel Superior (Postgrado)', NULL),
(32, 'Licenciado con Postgrado', NULL),
(33, 'Maestra (Terciario)', NULL),
(34, 'Maestría - Doctorado', NULL),
(35, 'Maestría (Especialista)', NULL),
(36, 'Maestría (posiblemente)', NULL),
(37, 'Maestria y Doctorado', NULL),
(38, 'Maestría y Doctorado', NULL),
(39, 'Maestro (Terciario)', NULL),
(40, 'Magister', NULL),
(41, 'Magister (Doctorado)', NULL),
(42, 'Magister y Doctor', NULL),
(43, 'Master en Enseñanza Inglesa', NULL),
(44, 'Médica (Grado)', NULL),
(45, 'Médica Cirujana (Grado)', NULL),
(46, 'Posgrado', NULL),
(47, 'Postgrado Especialización', NULL),
(48, 'Profesor', NULL),
(49, 'Profesor (con Especialidad - Grado)', NULL),
(50, 'Profesor (Grado)', NULL),
(51, 'Profesor (Grado) Especialista en Docencia Universitaria', NULL),
(52, 'Profesor (Terciario)', NULL),
(53, 'Profesor (Terciario) Abogado (Grado)', NULL),
(54, 'Profesor con Especialidad (Grado)', NULL),
(55, 'Profesor con Maestría y Doctorado en proceso', NULL),
(56, 'Profesor con Postitulo', NULL),
(57, 'Profesor Magister', NULL),
(58, 'Profesora', NULL),
(59, 'Profesora - Master', NULL),
(60, 'Profesora (Grado)', NULL),
(61, 'Profesora (Terciaria)', NULL),
(62, 'Profesora (Terciario)', NULL),
(63, 'Profesora (Terciaro)', NULL),
(64, 'Profesora con Especialización', NULL),
(65, 'Profesora con Postitulo de Especialización (Grado)', NULL),
(66, 'Profesora y Arquitecta', NULL),
(67, 'Profesora y Traductora', NULL),
(68, 'Psicologa (Grado)', NULL),
(69, 'Psicologo (Grado)', NULL),
(70, 'Psiquiatra', NULL),
(71, 'Técnica', NULL),
(72, 'Técnica (Grado)', NULL),
(73, 'Técnica en Acomp. Terapéutico', NULL),
(74, 'Técnica en Psicogerontología', NULL),
(75, 'Técnico (Terciario)', NULL),
(76, 'Terciario', NULL),
(77, 'Traductor (Grado)', NULL),
(78, 'Traductora', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `clave` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipoNivel` char(1) DEFAULT NULL COMMENT 'S:Superior, I:Inicial, P:Primario, M:Media',
  `idsede` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tipoUsuario` char(1) DEFAULT NULL COMMENT 'A:Administrador, O:operador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `clave`, `tipoNivel`, `idsede`, `email`, `tipoUsuario`) VALUES
(1, 'administrador', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1', 1, NULL, NULL),
(3, 'pablo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '3', 1, NULL, NULL),
(12, 'asistencia', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2', 1, NULL, NULL),
(17, 'alumnado', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1', 1, NULL, NULL),
(19, 'escuelas', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '4', 1, NULL, NULL),
(20, 'urquiza', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2', 1, NULL, NULL),
(22, 'transitorio', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '3', 1, NULL, NULL),
(23, 'biblioteca', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2', 1, NULL, NULL),
(24, 'administrativa', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '5', 1, NULL, NULL),
(25, 'personal', '3ec46cd55c3df4686ed5900e54315aecb2620403', '5', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura para la vista `dispocision`
--
DROP TABLE IF EXISTS `dispocision`;

CREATE ALGORITHM=UNDEFINED DEFINER=`hada_owner`@`%` SQL SECURITY DEFINER VIEW `dispocision`  AS  (select `sc`.`idSecretaria` AS `idSecretaria`,`sc`.`nombreSecretaria` AS `nombreSecretaria`,`sd`.`detalleSede` AS `detalleSede` from (`secretarias` `sc` join `sedes` `sd` on((`sd`.`idsede` = `sc`.`idSede`)))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agrupamientos`
--
ALTER TABLE `agrupamientos`
  ADD PRIMARY KEY (`idAgrupamiento`);

--
-- Indices de la tabla `asignacionesDocentes`
--
ALTER TABLE `asignacionesDocentes`
  ADD PRIMARY KEY (`idasignaciondocente`),
  ADD KEY `idDocenteAsignacion` (`idDocente`);

--
-- Indices de la tabla `asignacionesPas`
--
ALTER TABLE `asignacionesPas`
  ADD PRIMARY KEY (`idAsignPas`),
  ADD KEY `idPasAsingaciones` (`idPas`),
  ADD KEY `idPasCargo` (`idCargo`),
  ADD KEY `idDependenciaAsignaciones` (`idDependencia`);

--
-- Indices de la tabla `asignaturaDocente`
--
ALTER TABLE `asignaturaDocente`
  ADD PRIMARY KEY (`idAsignaturaDocente`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`idAsignatura`),
  ADD KEY `idCarreraAsignatura` (`idCarrera`);

--
-- Indices de la tabla `asignaturasCarreras`
--
ALTER TABLE `asignaturasCarreras`
  ADD PRIMARY KEY (`idAsigCarrera`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idCarrera`),
  ADD KEY `fk_sede` (`idSede`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `fk_Cargo` (`idCargo`),
  ADD KEY `idDedicacionFK` (`idDedicacion`);

--
-- Indices de la tabla `cursado`
--
ALTER TABLE `cursado`
  ADD PRIMARY KEY (`idCursado`);

--
-- Indices de la tabla `cursado_log`
--
ALTER TABLE `cursado_log`
  ADD PRIMARY KEY (`idCursado_log`);

--
-- Indices de la tabla `dedicaciones`
--
ALTER TABLE `dedicaciones`
  ADD PRIMARY KEY (`idDedicacion`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`idDependencia`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`idDocente`),
  ADD UNIQUE KEY `Dni_Unico` (`dni`);

--
-- Indices de la tabla `pas`
--
ALTER TABLE `pas`
  ADD PRIMARY KEY (`idPas`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idTituloFK` (`idTitulo`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `planesVigentes`
--
ALTER TABLE `planesVigentes`
  ADD PRIMARY KEY (`idplanvigente`);

--
-- Indices de la tabla `secretarias`
--
ALTER TABLE `secretarias`
  ADD PRIMARY KEY (`idSecretaria`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`idsede`);

--
-- Indices de la tabla `titulos`
--
ALTER TABLE `titulos`
  ADD PRIMARY KEY (`idTitulo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agrupamientos`
--
ALTER TABLE `agrupamientos`
  MODIFY `idAgrupamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `asignacionesDocentes`
--
ALTER TABLE `asignacionesDocentes`
  MODIFY `idasignaciondocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asignacionesPas`
--
ALTER TABLE `asignacionesPas`
  MODIFY `idAsignPas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaturaDocente`
--
ALTER TABLE `asignaturaDocente`
  MODIFY `idAsignaturaDocente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `idAsignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=655;

--
-- AUTO_INCREMENT de la tabla `asignaturasCarreras`
--
ALTER TABLE `asignaturasCarreras`
  MODIFY `idAsigCarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=692;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idCarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `cursado`
--
ALTER TABLE `cursado`
  MODIFY `idCursado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cursado_log`
--
ALTER TABLE `cursado_log`
  MODIFY `idCursado_log` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `dedicaciones`
--
ALTER TABLE `dedicaciones`
  MODIFY `idDedicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `idDependencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=746;

--
-- AUTO_INCREMENT de la tabla `pas`
--
ALTER TABLE `pas`
  MODIFY `idPas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planesVigentes`
--
ALTER TABLE `planesVigentes`
  MODIFY `idplanvigente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `secretarias`
--
ALTER TABLE `secretarias`
  MODIFY `idSecretaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `idsede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `titulos`
--
ALTER TABLE `titulos`
  MODIFY `idTitulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacionesDocentes`
--
ALTER TABLE `asignacionesDocentes`
  ADD CONSTRAINT `idDocenteAsignacion` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`);

--
-- Filtros para la tabla `asignacionesPas`
--
ALTER TABLE `asignacionesPas`
  ADD CONSTRAINT `idDependenciaAsignaciones` FOREIGN KEY (`idDependencia`) REFERENCES `dependencias` (`idDependencia`),
  ADD CONSTRAINT `idPasAsingaciones` FOREIGN KEY (`idPas`) REFERENCES `pas` (`idPas`),
  ADD CONSTRAINT `idPasCargo` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`idCargo`);

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `idCarreraAsignatura` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idCarrera`);

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `idDedicacionFK` FOREIGN KEY (`idDedicacion`) REFERENCES `dedicaciones` (`idDedicacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
