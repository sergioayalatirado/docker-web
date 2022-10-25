-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2022 a las 18:43:17
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdd_urgencias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actualizacion_turno`
--

CREATE TABLE `actualizacion_turno` (
  `id_actualizacion_turno` int(11) NOT NULL,
  `turno_actualizado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `actualizacion_turno`
--

INSERT INTO `actualizacion_turno` (`id_actualizacion_turno`, `turno_actualizado`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `nombre_ciudad` varchar(45) NOT NULL,
  `estatus_ciudad` varchar(45) NOT NULL,
  `fk_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `nombre_ciudad`, `estatus_ciudad`, `fk_estado`) VALUES
(1, 'ESCUINAPA DE HIDALGO', '1', 28),
(2, 'MAZATLAN', '1', 28),
(3, 'CONCORDIA', '1', 28),
(4, 'CONCORDIA', '1', 28),
(5, 'VILLA UNION', '1', 28),
(6, 'VILLA UNION', '1', 28),
(7, 'd', '1', 4),
(8, 'MAZATLAN', '1', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinica`
--

CREATE TABLE `clinica` (
  `id_clinica` int(11) NOT NULL,
  `folio_clinica` varchar(50) NOT NULL,
  `nombre_clinica` varchar(150) NOT NULL,
  `estatus_clinica` smallint(6) NOT NULL,
  `fk_datos_contacto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clinica`
--

INSERT INTO `clinica` (`id_clinica`, `folio_clinica`, `nombre_clinica`, `estatus_clinica`, `fk_datos_contacto`) VALUES
(1, '2201', 'CLINICA ESCUINAPA', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonia`
--

CREATE TABLE `colonia` (
  `id_colonia` int(11) NOT NULL,
  `nombre_colonia` varchar(150) NOT NULL,
  `estatus_colonia` smallint(6) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `fk_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `colonia`
--

INSERT INTO `colonia` (`id_colonia`, `nombre_colonia`, `estatus_colonia`, `codigo_postal`, `fk_ciudad`) VALUES
(1, 'CENTRO', 1, '82400', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `folio_consulta` varchar(50) NOT NULL,
  `fecha_hora_inicio` datetime DEFAULT NULL,
  `fecha_hora_final` datetime DEFAULT NULL,
  `tipo_consulta` smallint(6) NOT NULL,
  `fk_paciente` int(11) NOT NULL,
  `fk_empleado` int(11) DEFAULT NULL,
  `fk_consultorio` int(11) DEFAULT NULL,
  `fk_turno` int(11) NOT NULL,
  `fk_parametros_paciente` int(11) NOT NULL,
  `diagnostico_consulta` text DEFAULT 'Ningún diagnostico hasta el momento ',
  `diagnostico_id_diagnostico` int(11) DEFAULT NULL,
  `fk_encuesta_consulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `folio_consulta`, `fecha_hora_inicio`, `fecha_hora_final`, `tipo_consulta`, `fk_paciente`, `fk_empleado`, `fk_consultorio`, `fk_turno`, `fk_parametros_paciente`, `diagnostico_consulta`, `diagnostico_id_diagnostico`, `fk_encuesta_consulta`) VALUES
(60, '79532281', '2022-08-05 10:33:29', '2022-08-05 10:33:41', 1, 39, 2, 1, 212, 274, NULL, NULL, 306),
(61, '32167290', '2022-08-05 10:43:24', '2022-08-05 10:43:55', 2, 40, 2, 1, 213, 275, 'tiene gripe', NULL, 307),
(62, '7058999', NULL, NULL, 2, 8, 2, 1, 214, 281, 'Ningún diagnostico hasta el momento ', NULL, 312),
(63, '21042648', NULL, NULL, 2, 29, 2, 1, 215, 282, 'Ningún diagnostico hasta el momento ', NULL, 313),
(64, '39315633', '2022-08-05 11:19:58', '2022-08-05 11:20:13', 2, 42, 2, 1, 216, 283, 'fdgdg', NULL, 314),
(65, '62327180', '2022-08-05 11:32:36', '2022-08-05 11:32:57', 1, 43, 2, 1, 217, 284, 'gdgd', NULL, 315),
(66, '65307742', '2022-08-05 11:46:10', '2022-08-05 11:46:27', 1, 44, 2, 1, 218, 285, 'gdgd', NULL, 316),
(67, '46657268', '2022-08-05 11:56:02', '2022-08-05 11:59:08', 1, 45, 2, 1, 219, 286, 'vdh', NULL, 317),
(68, '17491750', '2022-08-05 12:15:01', '2022-08-05 12:15:46', 1, 46, 2, 1, 220, 287, 'ES PRIETO', NULL, 318);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `id_consultorio` int(11) NOT NULL,
  `nombre_consultorio` varchar(45) NOT NULL,
  `numero_consultorio` varchar(45) NOT NULL,
  `estado_consultorio` int(11) DEFAULT NULL,
  `estatus_consulta` int(11) DEFAULT NULL,
  `fk_clinica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`id_consultorio`, `nombre_consultorio`, `numero_consultorio`, `estado_consultorio`, `estatus_consulta`, `fk_clinica`) VALUES
(1, 'Consultorio 1', '1', 0, 0, 1),
(2, 'Consultorio 2', '2', 0, 0, 1),
(3, 'Consultorio 3', '3', 1, 0, 1),
(4, 'Consultorio 4', '4', 1, 0, 1),
(5, 'Consultorio 5', '5', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio_doctor`
--

CREATE TABLE `consultorio_doctor` (
  `id_consultorio_doctor` int(11) NOT NULL,
  `fk_consultorio` int(11) DEFAULT NULL,
  `fk_empleado` int(11) DEFAULT NULL,
  `ocupado` int(11) DEFAULT NULL,
  `ultima_actualizacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `consultorio_doctor`
--

INSERT INTO `consultorio_doctor` (`id_consultorio_doctor`, `fk_consultorio`, `fk_empleado`, `ocupado`, `ultima_actualizacion`) VALUES
(1, 1, 2, 1, '2022-07-20 21:28:40'),
(2, 2, NULL, 0, '2022-07-20 21:29:09'),
(3, 3, NULL, 0, '2022-07-20 21:29:09'),
(4, 4, NULL, 0, '2022-07-20 21:29:09'),
(5, 5, NULL, 0, '2022-07-20 21:29:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_contacto`
--

CREATE TABLE `datos_contacto` (
  `id_datos_contacto` int(11) NOT NULL,
  `direccion1` text NOT NULL,
  `direccion2` text DEFAULT NULL,
  `no_casa` varchar(45) DEFAULT NULL,
  `telefono1` varchar(20) DEFAULT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `fk_colonia` int(11) NOT NULL,
  `fk_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos_contacto`
--

INSERT INTO `datos_contacto` (`id_datos_contacto`, `direccion1`, `direccion2`, `no_casa`, `telefono1`, `telefono2`, `fk_colonia`, `fk_persona`) VALUES
(1, 'AV INTERNACIONAL', NULL, '2292', '4492201192', NULL, 1, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id_diagnostico` int(11) NOT NULL,
  `titulo_diagnostico` varchar(50) NOT NULL,
  `descripcion_diagnostico` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`id_diagnostico`, `titulo_diagnostico`, `descripcion_diagnostico`) VALUES
(1, 'FIEBRE', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico_enfermedad`
--

CREATE TABLE `diagnostico_enfermedad` (
  `fk_diagnostico` int(11) NOT NULL,
  `fk_enfermedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `no_empleado` varchar(50) NOT NULL,
  `fk_persona` int(11) NOT NULL,
  `estatus_empleado` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `no_empleado`, `fk_persona`, `estatus_empleado`) VALUES
(1, '0102', 1, 1),
(2, '033944', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_especialidad`
--

CREATE TABLE `empleado_especialidad` (
  `fk_empleado` int(11) NOT NULL,
  `fk_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado_especialidad`
--

INSERT INTO `empleado_especialidad` (`fk_empleado`, `fk_especialidad`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_consulta`
--

CREATE TABLE `encuesta_consulta` (
  `id_encuesta` int(11) NOT NULL,
  `folio_encuesta` varchar(45) NOT NULL,
  `fecha_hora_encuesta` datetime NOT NULL,
  `resultado_encuesta` varchar(45) NOT NULL,
  `evidencia_encuesta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuesta_consulta`
--

INSERT INTO `encuesta_consulta` (`id_encuesta`, `folio_encuesta`, `fecha_hora_encuesta`, `resultado_encuesta`, `evidencia_encuesta`) VALUES
(1, '100200300', '0000-00-00 00:00:00', '120', NULL),
(2, '14971079', '2022-07-20 13:31:11', '62', NULL),
(3, '19684205', '2022-07-20 13:34:28', '82', NULL),
(4, '45683469', '2022-07-20 13:35:55', '77', NULL),
(5, '53030749', '2022-07-20 13:36:40', '72', NULL),
(6, '42355944', '2022-07-20 13:37:14', '72', NULL),
(7, '31134366', '2022-07-20 13:45:52', '67', NULL),
(8, '31134366', '2022-07-20 13:47:39', '67', NULL),
(9, '47763382', '2022-07-20 13:48:10', '62', NULL),
(10, '11289954', '2022-07-20 14:27:04', '72', NULL),
(11, '11289954', '2022-07-20 14:32:19', '72', NULL),
(12, '63599365', '2022-07-21 12:07:08', '72', NULL),
(13, '63599365', '2022-07-21 12:08:21', '77', NULL),
(14, '63599365', '2022-07-21 12:09:06', '72', NULL),
(15, '77376274', '2022-07-21 12:10:40', '72', NULL),
(16, '77376274', '2022-07-21 12:10:59', '72', NULL),
(17, '77376274', '2022-07-21 12:12:54', '67', NULL),
(18, '77376274', '2022-07-21 12:17:36', '77', NULL),
(19, '77376274', '2022-07-21 12:17:42', '82', NULL),
(20, '77376274', '2022-07-21 13:04:17', '72', NULL),
(21, '77376274', '2022-07-21 13:05:18', '67', NULL),
(22, '77376274', '2022-07-21 13:07:17', '72', NULL),
(23, '69888', '2022-07-21 13:09:01', '55', NULL),
(24, '91266001', '2022-07-21 13:09:47', '62', NULL),
(25, '86677012', '2022-07-21 13:13:03', '80', NULL),
(26, '77590447', '2022-07-21 13:17:50', '75', NULL),
(27, '98253412', '2022-07-21 13:38:17', '80', NULL),
(28, '67730833', '2022-07-21 13:39:39', '75', NULL),
(29, '94510131', '2022-07-21 13:40:08', '80', NULL),
(30, '81289546', '2022-07-21 13:40:48', '75', NULL),
(31, '7115801', '2022-07-21 13:42:12', '100', NULL),
(32, '54593169', '2022-07-21 13:42:48', '95', NULL),
(33, '75313497', '2022-07-21 13:45:22', '100', NULL),
(34, '99662586', '2022-07-21 13:46:31', '95', NULL),
(35, '87027436', '2022-07-21 13:46:54', '100', NULL),
(36, '78564983', '2022-07-21 13:47:47', '95', NULL),
(37, '23223658', '2022-07-21 13:48:37', '100', NULL),
(38, '44644095', '2022-07-21 13:48:58', '95', NULL),
(39, '76666582', '2022-07-21 13:50:05', '100', NULL),
(40, '47028301', '2022-07-21 13:50:29', '95', NULL),
(41, '66878617', '2022-07-21 13:59:11', '100', NULL),
(42, '5039161', '2022-07-21 13:59:58', '95', NULL),
(43, '46640052', '2022-07-21 14:00:10', '100', NULL),
(44, '62057491', '2022-07-21 14:01:08', '95', NULL),
(45, '24576709', '2022-07-21 14:01:32', '100', NULL),
(46, '96643121', '2022-07-21 14:01:41', '95', NULL),
(47, '7708530', '2022-07-21 14:02:49', '82', NULL),
(48, '34023126', '2022-07-21 14:04:40', '100', NULL),
(49, '62867363', '2022-07-21 14:04:58', '95', NULL),
(50, '32871115', '2022-07-21 14:09:55', '95', NULL),
(51, '83649488', '2022-07-21 14:10:12', '100', NULL),
(52, '39153151', '2022-07-21 14:10:28', '95', NULL),
(53, '28703951', '2022-07-21 14:12:03', '100', NULL),
(54, '94275818', '2022-07-21 15:10:05', '100', NULL),
(55, '23158229', '2022-07-21 15:10:16', '95', NULL),
(56, '5377311', '2022-07-21 15:10:38', '100', NULL),
(57, '33111391', '2022-07-21 15:11:48', '95', NULL),
(58, '11744466', '2022-07-21 15:12:27', '100', NULL),
(59, '53909723', '2022-07-21 15:14:08', '95', NULL),
(60, '90322989', '2022-07-21 15:14:44', '100', NULL),
(61, '82395715', '2022-07-21 15:16:05', '95', NULL),
(62, '74760509', '2022-07-21 15:17:13', '100', NULL),
(63, '82484197', '2022-07-21 15:18:00', '95', NULL),
(64, '19938239', '2022-07-21 15:19:50', '100', NULL),
(65, '16639640', '2022-07-21 15:20:30', '95', NULL),
(66, '60467228', '2022-07-21 15:22:59', '100', NULL),
(67, '66492162', '2022-07-21 15:23:28', '95', NULL),
(68, '77291179', '2022-07-21 15:24:07', '100', NULL),
(69, '62230653', '2022-07-21 15:25:05', '95', NULL),
(70, '93497051', '2022-07-21 15:29:33', '100', NULL),
(71, '91584353', '2022-07-21 15:30:13', '95', NULL),
(72, '73757235', '2022-07-21 15:31:13', '100', NULL),
(73, '27458649', '2022-07-21 15:31:59', '95', NULL),
(74, '89806030', '2022-07-21 15:32:29', '100', NULL),
(75, '43410032', '2022-07-21 15:32:49', '95', NULL),
(76, '48924915', '2022-07-21 15:52:13', '100', NULL),
(77, '89280337', '2022-07-21 15:54:44', '95', NULL),
(78, '73861175', '2022-07-21 15:55:38', '100', NULL),
(79, '81211367', '2022-07-21 16:00:04', '95', NULL),
(80, '70272288', '2022-07-21 16:03:17', '100', NULL),
(81, '8268999', '2022-07-21 16:05:48', '95', NULL),
(82, '15873409', '2022-07-21 16:08:13', '100', NULL),
(83, '68852041', '2022-07-21 16:11:06', '95', NULL),
(84, '30357770', '2022-07-21 16:11:27', '100', NULL),
(85, '81110192', '2022-07-21 16:12:00', '95', NULL),
(86, '19919278', '2022-07-21 16:13:02', '100', NULL),
(87, '3409014', '2022-07-21 16:15:32', '95', NULL),
(88, '72241448', '2022-07-21 16:16:58', '100', NULL),
(89, '39961853', '2022-07-21 16:18:46', '95', NULL),
(90, '87569829', '2022-07-21 16:19:55', '100', NULL),
(91, '35030719', '2022-07-21 16:20:27', '95', NULL),
(92, '95935495', '2022-07-21 16:22:04', '100', NULL),
(93, '7554194', '2022-07-21 16:24:44', '95', NULL),
(94, '78581330', '2022-07-21 16:25:49', '100', NULL),
(95, '91520347', '2022-07-21 16:26:43', '95', NULL),
(96, '47685065', '2022-07-21 16:28:45', '100', NULL),
(97, '53042967', '2022-07-21 16:56:32', '95', NULL),
(98, '76422833', '2022-07-21 16:57:58', '85', NULL),
(99, '48028159', '2022-07-21 17:18:39', '90', NULL),
(100, '93523725', '2022-07-21 17:20:45', '100', NULL),
(101, '23764506', '2022-07-21 17:22:25', '95', NULL),
(102, '14091763', '2022-07-21 17:23:05', '100', NULL),
(103, '99621397', '2022-07-21 17:23:34', '95', NULL),
(104, '19208675', '2022-07-21 17:23:55', '100', NULL),
(105, '69648498', '2022-07-21 17:24:12', '95', NULL),
(106, '35865275', '2022-07-21 17:25:01', '100', NULL),
(107, '29367141', '2022-07-21 17:25:27', '95', NULL),
(108, '17434008', '2022-07-21 17:27:16', '100', NULL),
(109, '73094620', '2022-07-21 17:27:56', '95', NULL),
(110, '64705725', '2022-07-21 17:28:41', '100', NULL),
(111, '42411282', '2022-07-21 17:29:11', '95', NULL),
(112, '97184440', '2022-07-21 17:30:13', '100', NULL),
(113, '21837818', '2022-07-21 17:33:19', '95', NULL),
(114, '81513794', '2022-07-22 00:13:35', '85', NULL),
(115, '63766757', '2022-07-22 00:14:07', '80', NULL),
(116, '50544875', '2022-07-22 00:24:24', '42', NULL),
(117, '87591814', '2022-07-22 00:30:02', '47', NULL),
(118, '5251404', '2022-07-22 00:32:11', '42', NULL),
(119, '38319900', '2022-07-22 00:34:03', '47', NULL),
(120, '96515649', '2022-07-22 00:36:57', '42', NULL),
(121, '14506616', '2022-07-22 00:50:52', '95', NULL),
(122, '41327636', '2022-07-22 00:51:53', '90', NULL),
(123, '3032801', '2022-07-22 00:52:27', '95', NULL),
(124, '5266360', '2022-07-22 00:52:49', '90', NULL),
(125, '29613729', '2022-07-22 00:54:57', '95', NULL),
(126, '61781239', '2022-07-22 00:55:34', '90', NULL),
(127, '88444726', '2022-07-22 00:56:18', '95', NULL),
(128, '88305836', '2022-07-22 00:58:16', '42', NULL),
(129, '42088499', '2022-07-22 00:59:34', '47', NULL),
(130, '75342909', '2022-07-22 01:02:18', '67', NULL),
(131, '18824329', '2022-07-22 01:02:55', '62', NULL),
(132, '93978987', '2022-07-22 01:03:28', '67', NULL),
(133, '14548293', '2022-07-22 01:05:22', '62', NULL),
(134, '16765725', '2022-07-22 01:05:40', '67', NULL),
(135, '86951466', '2022-07-22 01:05:48', '62', NULL),
(136, '72787208', '2022-07-22 01:07:31', '67', NULL),
(137, '23893093', '2022-07-22 01:07:56', '62', NULL),
(138, '17188420', '2022-07-22 01:08:28', '67', NULL),
(139, '25823124', '2022-07-22 01:08:40', '62', NULL),
(140, '50993252', '2022-07-22 01:09:14', '67', NULL),
(141, '37977937', '2022-07-22 01:12:16', '62', NULL),
(142, '97488540', '2022-07-22 02:06:08', '67', NULL),
(143, '4500461', '2022-07-22 02:06:21', '62', NULL),
(144, '85236475', '2022-07-22 02:07:01', '67', NULL),
(145, '61770944', '2022-07-22 02:13:24', '62', NULL),
(146, '94372699', '2022-07-22 02:14:51', '67', NULL),
(147, '45797730', '2022-07-22 02:16:15', '62', NULL),
(148, '41187361', '2022-07-22 02:16:29', '67', NULL),
(149, '1883388', '2022-07-22 02:16:32', '62', NULL),
(150, '57619530', '2022-07-22 02:19:05', '67', NULL),
(151, '20433113', '2022-07-22 02:20:36', '62', NULL),
(152, '22328656', '2022-07-22 02:21:30', '67', NULL),
(153, '880093', '2022-07-22 02:22:10', '62', NULL),
(154, '38072866', '2022-07-22 02:25:27', '67', NULL),
(155, '98926330', '2022-07-22 02:29:23', '62', NULL),
(156, '24902397', '2022-07-22 02:30:28', '67', NULL),
(157, '24930350', '2022-07-22 02:30:46', '62', NULL),
(158, '68155388', '2022-07-22 02:33:18', '67', NULL),
(159, '67108646', '2022-07-22 02:35:16', '62', NULL),
(160, '79989517', '2022-07-22 02:37:26', '67', NULL),
(161, '52608127', '2022-07-22 02:37:46', '62', NULL),
(162, '29834971', '2022-07-22 02:38:00', '67', NULL),
(163, '44525008', '2022-07-22 02:44:13', '62', NULL),
(164, '38755101', '2022-07-22 03:12:24', '67', NULL),
(165, '92355595', '2022-07-22 03:12:50', '62', NULL),
(166, '56844452', '2022-07-22 03:14:07', '67', NULL),
(167, '42042799', '2022-07-22 03:15:09', '62', NULL),
(168, '3651889', '2022-07-22 03:15:31', '67', NULL),
(169, '24800704', '2022-07-22 03:16:08', '62', NULL),
(170, '47155115', '2022-07-22 03:16:35', '67', NULL),
(171, '49744369', '2022-07-22 03:17:30', '62', NULL),
(172, '98897727', '2022-07-22 03:18:50', '67', NULL),
(173, '64284430', '2022-07-22 03:19:12', '62', NULL),
(174, '8452343', '2022-07-22 03:20:58', '67', NULL),
(175, '89671621', '2022-07-22 03:21:51', '62', NULL),
(176, '97912729', '2022-07-22 03:22:06', '67', NULL),
(177, '55366997', '2022-07-22 03:22:52', '62', NULL),
(178, '85169903', '2022-07-22 03:23:58', '67', NULL),
(179, '74558981', '2022-07-22 03:24:45', '62', NULL),
(180, '27063017', '2022-07-22 03:25:02', '67', NULL),
(181, '28710845', '2022-07-22 03:29:06', '62', NULL),
(182, '22922177', '2022-07-22 03:29:17', '67', NULL),
(183, '82621507', '2022-07-22 03:30:00', '62', NULL),
(184, '6244863', '2022-07-22 03:30:09', '67', NULL),
(185, '6694785', '2022-07-22 03:44:11', '62', NULL),
(186, '63154563', '2022-07-22 03:44:45', '67', NULL),
(187, '93891045', '2022-07-22 03:45:13', '62', NULL),
(188, '61772064', '2022-07-22 03:45:52', '67', NULL),
(189, '79626535', '2022-07-22 03:46:14', '62', NULL),
(190, '69227469', '2022-07-22 03:49:29', '67', NULL),
(191, '74386360', '2022-07-22 03:50:02', '62', NULL),
(192, '96021614', '2022-07-22 03:52:42', '67', NULL),
(193, '38680864', '2022-07-22 03:58:19', '62', NULL),
(194, '12682971', '2022-07-22 04:01:06', '67', NULL),
(195, '7199957', '2022-07-22 04:01:32', '62', NULL),
(196, '37823888', '2022-07-22 04:18:50', '67', NULL),
(197, '39937064', '2022-07-22 04:21:23', '62', NULL),
(198, '79025452', '2022-07-22 04:22:26', '67', NULL),
(199, '95485601', '2022-07-22 04:25:18', '62', NULL),
(200, '82012236', '2022-07-22 04:26:37', '67', NULL),
(201, '4991414', '2022-07-22 04:27:44', '62', NULL),
(202, '86653417', '2022-07-22 04:28:31', '67', NULL),
(203, '51463757', '2022-07-22 04:29:17', '62', NULL),
(204, '55514015', '2022-07-22 04:35:09', '67', NULL),
(205, '32276004', '2022-07-22 04:37:08', '62', NULL),
(206, '66511828', '2022-07-22 04:38:31', '67', NULL),
(207, '83149866', '2022-07-22 04:39:19', '62', NULL),
(208, '39182814', '2022-07-22 04:39:59', '67', NULL),
(209, '29195563', '2022-07-22 04:41:36', '92', NULL),
(210, '92685902', '2022-07-22 04:46:38', '50', NULL),
(211, '75756278', '2022-07-22 04:50:23', '55', NULL),
(212, '65206135', '2022-07-22 04:50:35', '55', NULL),
(213, '83939827', '2022-07-22 04:54:17', '50', NULL),
(214, '15471147', '2022-07-22 04:54:26', '55', NULL),
(215, '27891300', '2022-07-22 04:55:14', '50', NULL),
(216, '2921553', '2022-07-22 04:56:31', '55', NULL),
(217, '6995573', '2022-07-22 04:57:21', '50', NULL),
(218, '48539336', '2022-07-22 04:59:34', '55', NULL),
(219, '52328524', '2022-07-22 05:02:49', '50', NULL),
(220, '67832043', '2022-07-22 05:03:05', '55', NULL),
(221, '83093037', '2022-07-22 05:12:04', '50', NULL),
(222, '66076423', '2022-07-22 05:13:56', '55', NULL),
(223, '1919974', '2022-07-22 05:14:54', '50', NULL),
(224, '52949413', '2022-07-22 05:15:41', '55', NULL),
(225, '48384800', '2022-07-22 05:16:38', '50', NULL),
(226, '31963706', '2022-07-22 05:16:59', '55', NULL),
(227, '87830506', '2022-07-22 05:17:56', '50', NULL),
(228, '97706534', '2022-07-22 05:19:55', '100', NULL),
(229, '63002630', '2022-07-22 05:22:58', '95', NULL),
(230, '23950133', '2022-07-22 05:28:39', '100', NULL),
(231, '1588256', '2022-07-22 05:29:05', '95', NULL),
(232, '63923465', '2022-07-22 05:29:21', '100', NULL),
(233, '53839618', '2022-07-22 05:31:08', '95', NULL),
(234, '4305091', '2022-07-22 05:32:30', '100', NULL),
(235, '11491972', '2022-07-22 05:33:54', '95', NULL),
(236, '77390834', '2022-07-22 05:34:34', '92', NULL),
(237, '97696421', '2022-07-22 05:36:25', '87', NULL),
(238, '44064314', '2022-07-22 05:39:13', '92', NULL),
(239, '18898543', '2022-07-22 05:39:22', '87', NULL),
(240, '68363005', '2022-07-22 05:39:51', '92', NULL),
(241, '30581685', '2022-07-22 05:40:20', '87', NULL),
(242, '13706190', '2022-07-22 05:41:44', '92', NULL),
(243, '76350384', '2022-07-22 05:43:16', '87', NULL),
(244, '25722760', '2022-07-22 05:45:03', '92', NULL),
(245, '7814518', '2022-07-22 05:45:25', '87', NULL),
(246, '68686562', '2022-07-22 05:47:42', '92', NULL),
(247, '96165867', '2022-07-22 05:54:06', '87', NULL),
(248, '37254999', '2022-07-22 05:55:35', '92', NULL),
(249, '7128593', '2022-07-22 05:56:37', '87', NULL),
(250, '94237070', '2022-07-22 05:58:03', '92', NULL),
(251, '96691518', '2022-07-22 05:58:53', '87', NULL),
(252, '36415264', '2022-07-22 05:59:31', '92', NULL),
(253, '17580095', '2022-07-22 06:01:10', '87', NULL),
(254, '14645956', '2022-07-22 06:09:00', '92', NULL),
(255, '68358289', '2022-07-22 06:09:38', '87', NULL),
(256, '95005299', '2022-07-22 06:10:11', '92', NULL),
(257, '75823520', '2022-07-22 06:11:14', '87', NULL),
(258, '92946000', '2022-07-22 06:11:24', '92', NULL),
(259, '85204456', '2022-07-22 06:12:46', '87', NULL),
(260, '92751903', '2022-07-22 06:12:58', '92', NULL),
(261, '63934644', '2022-07-22 06:13:12', '87', NULL),
(262, '4308396', '2022-07-22 06:13:47', '92', NULL),
(263, '12434019', '2022-07-22 06:16:02', '87', NULL),
(264, '95890545', '2022-07-22 06:16:42', '92', NULL),
(265, '189948', '2022-07-22 06:18:09', '87', NULL),
(266, '14118810', '2022-07-22 06:19:58', '92', NULL),
(267, '49209905', '2022-07-22 06:20:15', '87', NULL),
(268, '26530395', '2022-07-22 06:21:04', '92', NULL),
(269, '10638740', '2022-07-22 06:21:23', '87', NULL),
(270, '94777611', '2022-07-22 06:22:10', '95', NULL),
(271, '5091401', '2022-07-22 06:23:06', '90', NULL),
(272, '12764355', '2022-07-22 06:23:32', '95', NULL),
(273, '22321389', '2022-07-22 06:24:19', '90', NULL),
(274, '55840681', '2022-07-22 06:24:48', '95', NULL),
(275, '39392277', '2022-07-22 06:25:47', '90', NULL),
(276, '37098353', '2022-07-22 06:26:25', '95', NULL),
(277, '59038103', '2022-07-22 06:29:12', '90', NULL),
(278, '24034006', '2022-07-22 06:29:42', '95', NULL),
(279, '88508713', '2022-07-22 06:31:35', '90', NULL),
(280, '94768116', '2022-07-22 06:34:55', '95', NULL),
(281, '49272353', '2022-07-22 06:36:00', '90', NULL),
(282, '27040935', '2022-07-22 06:36:42', '95', NULL),
(283, '205833', '2022-07-22 06:37:29', '42', NULL),
(284, '79174059', '2022-07-22 06:37:56', '47', NULL),
(285, '98157915', '2022-07-26 11:33:31', '62', NULL),
(286, '11306774', '2022-07-26 11:38:30', '95', NULL),
(287, '1591227', '2022-07-26 11:42:06', '95', NULL),
(288, '10238871', '2022-07-26 11:59:42', '72', NULL),
(289, '83471374', '2022-07-26 12:08:24', '77', NULL),
(290, '35163366', '2022-07-26 13:09:35', '82', NULL),
(291, '8392648', '2022-07-26 13:24:24', '75', NULL),
(292, '84904421', '2022-07-26 13:30:04', '75', NULL),
(293, '79712329', '2022-07-26 13:31:32', '60', NULL),
(294, '29709578', '2022-07-26 13:49:41', '67', NULL),
(295, '57074624', '2022-07-26 14:49:32', '70', NULL),
(296, '89528894', '2022-07-26 14:58:30', '80', NULL),
(297, '29717686', '2022-07-26 17:17:55', '72', NULL),
(298, '22039074', '2022-07-26 17:21:26', '95', NULL),
(299, '30477940', '2022-07-26 17:24:22', '70', NULL),
(300, '19814457', '2022-07-26 18:54:32', '92', NULL),
(301, '87067276', '2022-07-26 19:01:05', '87', '62e08e51dc708.png'),
(302, '1883746', '2022-07-26 19:36:03', '92', '62e09683af0c1.png'),
(303, '71366930', '2022-07-27 11:42:20', '52', '62e178fc26a93.png'),
(304, '89912954', '2022-07-27 11:47:23', '75', '62e17a2b87177.png'),
(305, '38395389', '2022-07-27 12:00:36', '72', '62e17d4485e52.png'),
(306, '15994075', '2022-08-05 10:32:04', '57', '62ed4604cb4c9.png'),
(307, '29654674', '2022-08-05 10:42:32', '52', '62ed487831dfb.png'),
(308, '88654446', '2022-08-05 10:55:09', '67', '62ed4b6d233ca.png'),
(309, '61482244', '2022-08-05 10:56:43', '82', '62ed4bcb5479e.png'),
(310, '34120018', '2022-08-05 10:59:14', '82', '62ed4c622c675.png'),
(311, '14776376', '2022-08-05 11:00:25', '82', '62ed4ca945752.png'),
(312, '52636172', '2022-08-05 11:04:52', '72', '62ed4db4c9d78.png'),
(313, '29517659', '2022-08-05 11:06:31', '67', '62ed4e17eba93.png'),
(314, '77172450', '2022-08-05 11:18:43', '67', '62ed50f3dd347.png'),
(315, '12016843', '2022-08-05 11:29:40', '72', '62ed53844b8fa.png'),
(316, '32177186', '2022-08-05 11:42:55', '52', '62ed569f31080.png'),
(317, '80850714', '2022-08-05 11:54:50', '52', '62ed596a764e5.png'),
(318, '26048424', '2022-08-05 12:12:21', '90', '62ed5d8530dfc.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `id_enfermedad` int(11) NOT NULL,
  `nombre_enfermedad` varchar(150) NOT NULL,
  `descripcion_enfermedad` text DEFAULT NULL,
  `fk_tipo_enfermedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombre_especialidad` varchar(45) NOT NULL,
  `identificador_especialidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombre_especialidad`, `identificador_especialidad`) VALUES
(1, 'DOCTOR FAMILIAR', 'XAXXX00X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(150) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `estatus_estado` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`, `codigo`, `estatus_estado`) VALUES
(4, 'Aguascalientes', 'Ags.', 1),
(5, 'Baja California', 'BC', 1),
(6, 'Baja California Sur', 'BCS', 1),
(7, 'Campeche', 'Camp.', 1),
(8, 'Coahuila de Zaragoza', 'Coah.', 1),
(9, 'Colima', 'Col.', 1),
(10, 'Chiapas', 'Chis.', 1),
(11, 'Chihuahua', 'Chih.', 1),
(12, 'Ciudad de México', 'CDMX', 1),
(13, 'Durango', 'Dgo.', 1),
(14, 'Guanajuato', 'Gto.', 1),
(15, 'Guerrero', 'Gro.', 1),
(16, 'Hidalgo', 'Hgo.', 1),
(17, 'Jalisco', 'Jal.', 1),
(18, 'México', 'Mex.', 1),
(19, 'Michoacán de Ocampo', 'Mich.', 1),
(20, 'Morelos', 'Mor.', 1),
(21, 'Nayarit', 'Nay.', 1),
(22, 'Nuevo León', 'NL', 1),
(23, 'Oaxaca', 'Oax.', 1),
(24, 'Puebla', 'Pue.', 1),
(25, 'Querétaro', 'Qro.', 1),
(26, 'Quintana Roo', 'Q. Roo', 1),
(27, 'San Luis Potosí', 'SLP', 1),
(28, 'Sinaloa', 'Sin.', 1),
(29, 'Sonora', 'Son.', 1),
(30, 'Tabasco', 'Tab.', 1),
(31, 'Tamaulipas', 'Tamps.', 1),
(32, 'Tlaxcala', 'Tlax.', 1),
(33, 'Veracruz de Ignacio de la Llave', 'Ver.', 1),
(34, 'Yucatán', 'Yuc.', 1),
(35, 'Zacatecas', 'Zac.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `no_paciente` varchar(50) NOT NULL,
  `estatus` smallint(6) NOT NULL,
  `fk_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `no_paciente`, `estatus`, `fk_persona`) VALUES
(1, '08101997', 1, 1),
(2, '3225602216512444143', 0, 25),
(3, '0602163362115340442', 1, 26),
(4, '12306605535146343135', 1, 27),
(5, '4624151214210113211', 1, 28),
(6, '7348997', 1, 29),
(7, '20181958', 1, 30),
(8, '32759741', 1, 31),
(9, '95057411', 1, 32),
(10, '36480903', 1, 33),
(11, '60798576', 1, 35),
(12, '48006338', 1, 36),
(13, '617226', 1, 37),
(14, '85394543', 1, 46),
(15, '92952755', 1, 52),
(16, '94937679', 1, 53),
(17, '14362325', 1, 54),
(18, '56732661', 1, 55),
(19, '16520327', 1, 56),
(20, '08101997223', 1, 57),
(21, '18733628', 1, 58),
(22, '92007645', 1, 59),
(23, '47856917', 1, 60),
(24, '50458683', 1, 61),
(25, '74382085', 1, 62),
(26, '96181687', 1, 63),
(27, '47900319', 1, 64),
(28, '43849923', 1, 65),
(29, '91832547', 1, 66),
(30, '18064254', 1, 67),
(31, '32957944', 1, 68),
(32, '42317158', 1, 69),
(33, '20381015', 1, 70),
(34, '37213464', 1, 71),
(35, '41622001', 1, 72),
(36, '72457106', 1, 73),
(37, '25380136', 1, 74),
(38, '90980750', 1, 75),
(39, '60072696', 1, 76),
(40, '6911406', 1, 77),
(41, '15585777', 1, 78),
(42, '87295033', 1, 79),
(43, '47734745', 1, 80),
(44, '31461031', 1, 81),
(45, '77714979', 1, 82),
(46, '7869719', 1, 83);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_parametros`
--

CREATE TABLE `paciente_parametros` (
  `id_paciente_parametros` int(11) NOT NULL,
  `fk_paciente` int(11) NOT NULL,
  `fk_parametros` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `paciente_parametros`
--

INSERT INTO `paciente_parametros` (`id_paciente_parametros`, `fk_paciente`, `fk_parametros`, `fecha_hora`) VALUES
(5, 25, 104, '2022-07-19 18:15:30'),
(6, 25, 105, '2022-07-19 18:17:19'),
(27, 8, 187, '2022-07-19 18:53:52'),
(28, 8, 188, '2022-07-19 18:54:29'),
(29, 26, 189, '2022-07-19 18:54:54'),
(30, 21, 190, '2022-07-19 18:55:52'),
(31, 9, 191, '2022-07-19 18:56:32'),
(32, 9, 192, '2022-07-19 18:56:57'),
(33, 9, 193, '2022-07-19 19:01:32'),
(34, 26, 194, '2022-07-19 19:01:59'),
(35, 26, 195, '2022-07-19 19:05:29'),
(36, 26, 196, '2022-07-19 19:06:49'),
(37, 26, 197, '2022-07-19 19:07:19'),
(38, 26, 198, '2022-07-19 19:12:22'),
(39, 26, 199, '2022-07-19 19:13:19'),
(40, 26, 200, '2022-07-19 20:09:50'),
(41, 28, 201, '2022-07-20 11:11:50'),
(42, 20, 202, '2022-07-20 13:07:26'),
(43, 28, 203, '2022-07-20 13:07:59'),
(44, 20, 204, '2022-07-20 13:08:07'),
(45, 8, 205, '2022-07-20 13:36:58'),
(46, 23, 206, '2022-07-20 13:45:28'),
(47, 23, 207, '2022-07-20 13:47:55'),
(48, 10, 208, '2022-07-20 14:26:42'),
(49, 21, 209, '2022-07-21 11:57:25'),
(50, 22, 210, '2022-07-21 12:17:18'),
(51, 19, 211, '2022-07-21 13:04:08'),
(52, 21, 212, '2022-07-21 13:08:42'),
(53, 21, 213, '2022-07-21 13:09:26'),
(54, 21, 214, '2022-07-21 13:12:23'),
(55, 21, 215, '2022-07-21 13:41:32'),
(56, 21, 216, '2022-07-21 14:02:21'),
(57, 21, 217, '2022-07-21 14:03:47'),
(58, 21, 218, '2022-07-21 14:04:34'),
(59, 21, 219, '2022-07-21 15:09:35'),
(60, 23, 223, '2022-07-21 15:28:44'),
(61, 10, 224, '2022-07-21 16:15:25'),
(62, 8, 225, '2022-07-21 16:57:25'),
(63, 7, 226, '2022-07-21 17:20:20'),
(64, 17, 227, '2022-07-22 00:13:08'),
(65, 23, 229, '2022-07-22 00:23:56'),
(66, 9, 230, '2022-07-22 00:50:20'),
(67, 21, 231, '2022-07-22 04:41:08'),
(68, 22, 232, '2022-07-22 05:17:49'),
(69, 21, 233, '2022-07-22 05:34:16'),
(70, 23, 234, '2022-07-22 06:21:49'),
(71, 19, 235, '2022-07-25 11:17:26'),
(72, 29, 236, '2022-07-26 11:32:49'),
(73, 29, 237, '2022-07-26 12:08:06'),
(74, 14, 238, '2022-07-26 13:20:29'),
(75, 14, 239, '2022-07-26 13:25:29'),
(76, 14, 241, '2022-07-26 13:26:36'),
(77, 14, 243, '2022-07-26 13:29:37'),
(78, 14, 244, '2022-07-26 13:30:24'),
(79, 14, 245, '2022-07-26 13:31:10'),
(80, 32, 246, '2022-07-26 13:42:04'),
(81, 33, 247, '2022-07-26 13:44:21'),
(82, 34, 248, '2022-07-26 13:47:19'),
(83, 35, 249, '2022-07-26 14:21:12'),
(84, 35, 250, '2022-07-26 14:27:17'),
(85, 35, 251, '2022-07-26 14:29:00'),
(86, 35, 252, '2022-07-26 14:34:57'),
(87, 32, 253, '2022-07-26 14:37:46'),
(88, 32, 254, '2022-07-26 14:40:42'),
(89, 32, 255, '2022-07-26 14:43:30'),
(90, 32, 256, '2022-07-26 14:45:35'),
(91, 32, 257, '2022-07-26 14:48:44'),
(92, 35, 258, '2022-07-26 14:57:22'),
(93, 23, 259, '2022-07-26 16:06:50'),
(94, 23, 260, '2022-07-26 16:12:06'),
(95, 23, 261, '2022-07-26 16:15:00'),
(96, 23, 262, '2022-07-26 16:16:44'),
(97, 23, 263, '2022-07-26 17:17:34'),
(98, 23, 264, '2022-07-26 17:21:08'),
(99, 23, 265, '2022-07-26 17:24:05'),
(100, 22, 266, '2022-07-26 18:43:45'),
(101, 22, 267, '2022-07-26 18:45:35'),
(102, 22, 268, '2022-07-26 18:54:18'),
(103, 22, 269, '2022-07-26 19:00:43'),
(104, 35, 270, '2022-07-26 19:35:41'),
(105, 36, 271, '2022-07-27 11:40:59'),
(106, 36, 272, '2022-07-27 11:46:24'),
(107, 37, 273, '2022-07-27 11:59:01'),
(108, 39, 274, '2022-08-05 10:31:14'),
(109, 40, 275, '2022-08-05 10:41:16'),
(110, 29, 276, '2022-08-05 10:53:50'),
(111, 41, 277, '2022-08-05 10:56:25'),
(112, 29, 278, '2022-08-05 10:58:56'),
(113, 13, 279, '2022-08-05 11:00:10'),
(114, 8, 281, '2022-08-05 11:04:32'),
(115, 29, 282, '2022-08-05 11:06:11'),
(116, 42, 283, '2022-08-05 11:17:40'),
(117, 43, 284, '2022-08-05 11:28:41'),
(118, 44, 285, '2022-08-05 11:41:29'),
(119, 45, 286, '2022-08-05 11:53:07'),
(120, 46, 287, '2022-08-05 12:11:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_paciente`
--

CREATE TABLE `parametros_paciente` (
  `id_parametros_paciente` int(11) NOT NULL,
  `temperatura` varchar(45) DEFAULT NULL,
  `estatura` varchar(45) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `presion` varchar(50) DEFAULT NULL,
  `talla_medidas` varchar(50) DEFAULT NULL,
  `respiracion` varchar(50) DEFAULT NULL,
  `pulso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `parametros_paciente`
--

INSERT INTO `parametros_paciente` (`id_parametros_paciente`, `temperatura`, `estatura`, `peso`, `presion`, `talla_medidas`, `respiracion`, `pulso`) VALUES
(28, '22', '2230', '23', '244', '22', 'Eficiente', '223'),
(29, '22', '2230', '23', '244', NULL, 'Eficiente', '223'),
(30, NULL, '2230', '23', '244', NULL, 'Eficiente', '223'),
(31, NULL, '2230', NULL, '244', NULL, 'Eficiente', '223'),
(32, NULL, '2230', NULL, NULL, NULL, 'Eficiente', '223'),
(33, NULL, '2230', NULL, NULL, NULL, 'Eficiente', NULL),
(34, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(35, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(36, 'asd', 'asd', 'asd', 'asd', 'sad', 'Eficiente', 'asda'),
(37, 'asdas', 'adasdas', 'asdasdasd', 'asdsadas', 'asddsaa', 'Eficiente', 'adsada'),
(38, 'asdas', 'adasdas', 'asdasdasd', 'asdsa', 'asddsaa', 'Eficiente', 'adsada'),
(39, 'asdas', 'adasdas', 'asdas', 'asdsa', 'asddsaa', 'Eficiente', 'adsada'),
(40, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(41, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(42, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(43, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(44, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(45, '199', '199', '199', '199', '199', 'Eficiente', '199'),
(46, 'adsdas', 'asdad', 'asdasdas', 'asdassdas', 'zvzxas', 'Deficiente', 'asdasdas'),
(47, 'sdas', 'das', 'sadasd', 'sadas', 'asdas', 'Eficiente', 'asdas'),
(48, 'dsaad', 'sdas', 'dsad', 'asdas', 'asdad', 'Eficiente', 'asddas'),
(49, 'das', 'dsa', 'dsasd', 'adasda', 'daa', 'Eficiente', 'asdas'),
(50, 'dasda', 'adsa', 'asddas', 'asdas', 'sdda', 'Eficiente', 'dsadas'),
(51, 'dasda', 'adsa', 'asddas', 'asdas', 'sdda', 'Deficiente', 'dsadas'),
(52, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(53, 'das', 'adsa', 'asd', 'asd', 'asd', 'Eficiente', 'asd'),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(58, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(59, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(60, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(61, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(62, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(63, '229', '30', '229', '39', '29', 'Eficiente', '39'),
(64, '229', '30', '229', '39', '29', 'Eficiente', '39'),
(65, '229', '30', '229', '39', '29', 'Eficiente', '39'),
(66, '229', '30', '229', '39', '29', 'Eficiente', '39'),
(67, '229', '30', '229', '39', '29', 'Eficiente', '39'),
(68, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(73, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(75, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(76, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'dasda', 'asdasdsadasdasd', 'sadasdas', 'dasdasd', 'asdas', 'Eficiente', 'adassadas'),
(79, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(84, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(85, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(100, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(101, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(102, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(103, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(104, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(105, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(106, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'dsaadas', 'asddasd', 'saddads', 'saddas', 'asdasda', 'Eficiente', 'dasdas'),
(134, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(135, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(138, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(139, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(140, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'dasda', 'asdas', 'dsaasd', 'asdas', 'zdsa', 'Eficiente', 'sadasd'),
(156, 'dasda', 'asdas', 'dsaasd', 'asdas', 'zdsa', 'Eficiente', 'sadasd'),
(157, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(162, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(163, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(175, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'dsadasdsa', 'asdsadas', 'adsdasdsa', 'asdasdas', 'asdadsa', 'Eficiente', 'asdsadasd'),
(194, 'dasdasdsada', 'asdsadadsas', 'asdasdasdas', 'dasasdasdsa', 'asdsad', 'Eficiente', 'sadasdas'),
(195, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(199, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'dsda', 'asd', 'dsada', 'dsada', 'dsa', 'Deficiente', 'adsada'),
(202, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(204, '33', '1.63', '80', '120', '13', 'Eficiente', '2'),
(205, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(206, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(207, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(208, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(209, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(210, 'asdsa', 'asdsad', 'asdasd', 'sadas', 'asdsa', 'Eficiente', 'asdsa'),
(211, NULL, NULL, NULL, NULL, 'asdas', 'Eficiente', NULL),
(212, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, NULL, NULL, NULL, NULL, 'asdas', 'Deficiente', NULL),
(216, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, '36.5', '1.80', '107', '80-120', '102-120', 'Deficiente', '0'),
(237, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(238, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(239, '23', NULL, NULL, NULL, '10', 'Deficiente', NULL),
(240, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(250, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(251, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(252, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'ASDA', 'ASDA', 'ASDAS', NULL, 'DASD', 'Deficiente', 'ASDA'),
(256, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, NULL, NULL, NULL, NULL, NULL, 'No estable', NULL),
(258, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(259, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, '02', '23333', '920', '9229', '2039', 'Deficiente', '0229'),
(262, '22', '1.69', '203KG', '303', '203', 'Eficiente', '022'),
(263, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, '38', '1.58', '125', '120-100', '199', 'No estable', '100-100'),
(272, NULL, NULL, NULL, NULL, NULL, 'Deficiente', NULL),
(273, '36.5', '1.87', '100', '70-100', '120-250', 'No estable', NULL),
(274, '38.5', '1.63', '86', '120-20', '85-102', 'No estable', '105-120'),
(275, '37.6', '1.67', '75', '200', '80-106', 'Deficiente', '150-2500'),
(276, '38', '1.80', '100kg', '100-120', '36', 'Eficiente', '0'),
(277, '37', '1.80', '100KG', '0', '34', 'Eficiente', '120'),
(278, '38.5', '1.80', '100', '120-200', '102', 'Eficiente', '200'),
(279, '36.5', '1.77', '80KG', '120', '80-100', 'Eficiente', '120'),
(280, NULL, NULL, NULL, NULL, NULL, 'Eficiente', NULL),
(281, '38.6', NULL, '108', NULL, '34', 'Eficiente', NULL),
(282, '38.5', '1.80', '100', NULL, '34', 'Eficiente', NULL),
(283, '38', '1.73', '71', '0', '32', 'Eficiente', '0'),
(284, '36.5', '1.70', '67', '80-120', '9', 'Eficiente', '0'),
(285, '36.5', '1.65', '75', '100', '85-110', 'Eficiente', '0'),
(286, '36.5', '1.80', '75', '0', '36', 'Eficiente', '0'),
(287, '37.5', '1.73', '65', '0', '32', 'Eficiente', '120-80');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apaterno` varchar(70) NOT NULL,
  `amaterno` varchar(80) DEFAULT NULL,
  `edad` varchar(3) NOT NULL,
  `fnac` date NOT NULL,
  `estatus_persona` smallint(6) NOT NULL,
  `estatus_cuenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apaterno`, `amaterno`, `edad`, `fnac`, `estatus_persona`, `estatus_cuenta`) VALUES
(1, 'SERGIO ADA', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 1),
(2, 'PRUEBA', 'PRUEBA', 'JAJAJAA', '24', '2001-10-10', 1, 0),
(3, 'KAROLINA', 'DEGOLLADO XD', 'ORONIA XD', '21', '2001-01-18', 1, 1),
(4, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(25, 'HUGO GUSTAVO', 'RUIZ', 'SANCHEZ', '31', '1991-01-01', 1, 0),
(26, 'GABRIEL', 'LOPEZ', 'GUZMAN', '22', '2000-09-02', 1, 0),
(27, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 1),
(28, 'JESUS', 'SALCIDO', 'AGUILAR', '25', '1994-10-08', 1, 0),
(29, 'MARIA SOLEDAD', 'AYALA', 'TIRADO', '18', '2003-02-25', 1, 0),
(30, 'ALAN', 'URIBE', 'LOPEZ', '24', '2001-02-22', 1, 0),
(31, 'JESUS', 'MARTINEZ', 'CASTRO', '20', '2001-12-07', 1, 0),
(32, 'USUARIO', 'USUARIO', 'USUARIO', '14', '2008-08-08', 1, 0),
(33, 'ELIZABETH', 'CARRILLO', 'CASILLAS', '29', '1994-02-02', 1, 0),
(34, 'LENIN ALBERTO', 'GOMEZ', 'DURAN', '19', '2002-01-24', 1, 1),
(35, 'LENIN ALBERTO', 'GOMEZ', 'DURAN', '19', '2002-01-24', 1, 0),
(36, 'JOSE HILARIO', 'ULIBARRIA', 'AVIÑA', '22', '1998-07-10', 1, 1),
(37, 'JESUS ALFREDO', 'MARTINEZ', 'CASTRO', '20', '2001-12-07', 1, 1),
(38, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(39, 'SERGIO ADAN G', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(40, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(41, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(42, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(43, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(44, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(45, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(46, 'MONTSERRAT', 'DEGOLLADO', 'ORONIA', '21', '2001-02-10', 1, 0),
(47, 'KAROLINA', 'DEGOLLADO', 'ORONIA', '21', '2001-01-18', 1, 0),
(48, 'KAROLINA MONTSERRAT', 'DEGOLLADO', 'ORONIA', '21', '2001-01-18', 1, 0),
(49, 'KAROLINA', 'DEGOLLADO', 'ORONIA', '21', '2001-01-18', 1, 0),
(50, 'PANCHITA', 'DEGOLLADO', 'ORONIA', '21', '2001-01-18', 1, 0),
(51, 'SERGIO ADAX', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(52, 'SERGIO ADAN', 'AYALA', 'TIRADO', '18', '1997-10-08', 1, NULL),
(53, 'KAROLINA', 'DEGOLLADO', 'ORONIA', '22', '2002-01-22', 1, NULL),
(54, 'Alfredo', 'Gomez', NULL, '30', '1993-10-08', 1, NULL),
(55, 'KAROLINA MONTSERRAT', 'DEGOLLADO', 'ORONIA', '23', '1996-10-08', 1, 0),
(56, 'LUZ', 'LOPEZ', 'GARCIA', '24', '1997-10-01', 1, 0),
(57, 'lsdas', 'asdas', 'dsadas', '12', '2001-01-01', 1, 0),
(58, 'SERGIO ADAN', 'AYALA', 'TIRADO', '23', '1999-04-21', 1, 1),
(59, 'SERGIO', 'AYALA', NULL, '24', '1997-10-08', 1, 0),
(60, 'Ricardo', 'gomez', 'asdsadas', '20', '2001-01-01', 1, 0),
(61, 'dasda', 'asdasd', 'asdasd', '20', '2001-01-01', 1, 0),
(62, 'adas', 'sadas', 'sadas', '22', '2000-01-01', 1, 0),
(63, 'SDASD', 'ASDSA', 'ASDSA', '23', '1997-10-08', 1, 1),
(64, 'SERGIO ADAN', 'AYALA', 'TIRADO', '24', '1997-10-08', 1, 0),
(65, 'adaads', 'asda', 'sdad', '32', '1997-10-08', 1, 0),
(66, 'OMAR', 'MUÑOZ', 'AVILA', '45', '1976-12-02', 1, 0),
(67, 'ss', 's', 's', '2', '2222-02-22', 1, 0),
(68, 'q', 'q', 'q', '23', '2001-01-12', 1, 0),
(69, 'kar', 'j', 'j', '12', '1222-12-12', 1, 0),
(70, 'a', 'd', 'd', '12', '1222-12-12', 1, 0),
(71, 'qq', 'q', 'qqq', '12', '1222-12-12', 1, 0),
(72, 'JESUS MANUEL', 'AGUILAR', 'SALCIDO', '20', '2022-07-26', 1, 0),
(73, 'ELIZABETH', 'CARRILLO', 'CASILLAS', '33', '1989-04-03', 1, 0),
(74, 'JOSE ANGEL', 'RODRIGUEZ', 'CORONA', '22', '1999-11-15', 1, 0),
(75, 'MICHELL', 'GUZMAN', 'TOLEDO', '23', '2002-02-23', 1, 0),
(76, 'ANA VICTORIA', 'DEGOLLADO', 'ORONIA', '19', '2003-03-08', 1, 0),
(77, 'ALBERTO FRANCISCO', 'PARTIDA', 'LUGO', '19', '2003-06-12', 1, 0),
(78, 'OMAR FRANCISCO', 'MUÑOZ', 'AVILA', '45', '1977-12-02', 1, 0),
(79, 'JOEL', 'ZAVALA', 'asdsadas', '20', '2001-08-31', 1, 0),
(80, 'LIZETH', 'CEJA', 'PEREZ', '27', '1995-01-15', 1, 0),
(81, 'IGOR PIOTR', 'BERAUD', 'MARTINEZ', '45', '1976-09-23', 1, 0),
(82, 'PAVEL', 'GUZMAN', NULL, '33', '1989-01-27', 1, 0),
(83, 'Ruben', 'Peraza', 'Esquer', '19', '2003-04-01', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_enfermedad`
--

CREATE TABLE `tipo_enfermedad` (
  `id_tipo_enfermedad` int(11) NOT NULL,
  `nombre_tipo_enfermedad` varchar(150) NOT NULL,
  `descripcion_tipo_enfermedad` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `folio_agenda_turno` varchar(45) NOT NULL,
  `turno` int(45) NOT NULL,
  `fecha_hora_turno` datetime NOT NULL,
  `estatus_turno` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `folio_agenda_turno`, `turno`, `fecha_hora_turno`, `estatus_turno`) VALUES
(212, '79532281', 1, '2022-08-05 10:32:04', 4),
(213, '32167290', 2, '2022-08-05 10:42:32', 4),
(214, '7058999', 7, '2022-08-05 11:04:52', 2),
(215, '21042648', 8, '2022-08-05 11:06:31', 2),
(216, '39315633', 5, '2022-08-05 11:18:43', 4),
(217, '62327180', 3, '2022-08-05 11:29:40', 4),
(218, '65307742', 4, '2022-08-05 11:42:55', 4),
(219, '46657268', 5, '2022-08-05 11:54:50', 4),
(220, '17491750', 6, '2022-08-05 12:12:21', 4);

--
-- Disparadores `turno`
--
DELIMITER $$
CREATE TRIGGER `actualizacion_turno_delete` AFTER DELETE ON `turno` FOR EACH ROW UPDATE `actualizacion_turno` SET `turno_actualizado` = '1' WHERE `actualizacion_turno`.`id_actualizacion_turno` = 1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actualizacion_turno_insercion` AFTER INSERT ON `turno` FOR EACH ROW UPDATE `actualizacion_turno` SET `turno_actualizado` = '1' WHERE `actualizacion_turno`.`id_actualizacion_turno` = 1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actualizacion_turno_update` AFTER UPDATE ON `turno` FOR EACH ROW UPDATE `actualizacion_turno` SET `turno_actualizado` = '1' WHERE `actualizacion_turno`.`id_actualizacion_turno` = 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(150) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `tipo_usuario` varchar(50) NOT NULL,
  `estatus_usuario` smallint(6) NOT NULL,
  `fk_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `contrasena`, `correo`, `tipo_usuario`, `estatus_usuario`, `fk_persona`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'admin', 1, 1),
(2, '@admin', '@admin', 'mea@admin.mx', '1', 1, 27),
(3, 'karolina', 'karolina', 'kmontserrat@mail.mx', 'doctor', 1, 3),
(4, 'megacable', 'megacable', 'megacable@atn.mx', 'admin', 1, 34),
(5, 'hilario@ut.com', 'hilario', 'hilario@ut.com', 'admin', 1, 36),
(6, 'alfredo@admin.com', 'alfredoadmin', 'alfredo@admin.com', 'admin', 1, 37),
(7, 'prueba@prueba.com', 'prueba', 'prueba@prueba.com', 'paciente', 1, 58),
(8, 'admin@gmail.com', 'admin', 'admin@gmail.com', 'paciente', 1, 74),
(10, 'ana@gmail.com', 'ana', 'ana@gmail.com', 'paciente', 1, 76);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actualizacion_turno`
--
ALTER TABLE `actualizacion_turno`
  ADD PRIMARY KEY (`id_actualizacion_turno`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `fk_ciudad_estado1` (`fk_estado`);

--
-- Indices de la tabla `clinica`
--
ALTER TABLE `clinica`
  ADD PRIMARY KEY (`id_clinica`),
  ADD KEY `fk_clinica_datos_contacto1` (`fk_datos_contacto`);

--
-- Indices de la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD PRIMARY KEY (`id_colonia`),
  ADD KEY `fk_colonia_ciudad1` (`fk_ciudad`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `fk_consulta_empleado1` (`fk_empleado`),
  ADD KEY `fk_consulta_consultorio1` (`fk_consultorio`),
  ADD KEY `fk_consulta_turno1` (`fk_turno`),
  ADD KEY `fk_consulta_parametros_paciente1` (`fk_parametros_paciente`),
  ADD KEY `fk_consulta_diagnostico1` (`diagnostico_id_diagnostico`),
  ADD KEY `fk_consulta_encuesta_consulta1` (`fk_encuesta_consulta`),
  ADD KEY `fk_paciente` (`fk_paciente`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id_consultorio`),
  ADD KEY `fk_consultorio_clinica1` (`fk_clinica`);

--
-- Indices de la tabla `consultorio_doctor`
--
ALTER TABLE `consultorio_doctor`
  ADD PRIMARY KEY (`id_consultorio_doctor`),
  ADD KEY `fk_consultorio` (`fk_consultorio`),
  ADD KEY `fk_empleado` (`fk_empleado`);

--
-- Indices de la tabla `datos_contacto`
--
ALTER TABLE `datos_contacto`
  ADD PRIMARY KEY (`id_datos_contacto`),
  ADD KEY `fk_datos_contacto_colonia1` (`fk_colonia`),
  ADD KEY `fk_datos_contacto_persona1` (`fk_persona`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diagnostico`);

--
-- Indices de la tabla `diagnostico_enfermedad`
--
ALTER TABLE `diagnostico_enfermedad`
  ADD PRIMARY KEY (`fk_diagnostico`,`fk_enfermedad`),
  ADD KEY `fk_diagnostico_has_enfermedad_enfermedad1` (`fk_enfermedad`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_empleado_persona1` (`fk_persona`);

--
-- Indices de la tabla `empleado_especialidad`
--
ALTER TABLE `empleado_especialidad`
  ADD PRIMARY KEY (`fk_empleado`,`fk_especialidad`),
  ADD KEY `fk_empleado_has_especialidad_especialidad1` (`fk_especialidad`);

--
-- Indices de la tabla `encuesta_consulta`
--
ALTER TABLE `encuesta_consulta`
  ADD PRIMARY KEY (`id_encuesta`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`id_enfermedad`),
  ADD KEY `fk_enfermedad_tipo_enfermedad1` (`fk_tipo_enfermedad`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_paciente_persona1` (`fk_persona`);

--
-- Indices de la tabla `paciente_parametros`
--
ALTER TABLE `paciente_parametros`
  ADD PRIMARY KEY (`id_paciente_parametros`),
  ADD KEY `fk_paciente` (`fk_paciente`),
  ADD KEY `fk_parametros` (`fk_parametros`);

--
-- Indices de la tabla `parametros_paciente`
--
ALTER TABLE `parametros_paciente`
  ADD PRIMARY KEY (`id_parametros_paciente`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `tipo_enfermedad`
--
ALTER TABLE `tipo_enfermedad`
  ADD PRIMARY KEY (`id_tipo_enfermedad`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_persona1` (`fk_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actualizacion_turno`
--
ALTER TABLE `actualizacion_turno`
  MODIFY `id_actualizacion_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clinica`
--
ALTER TABLE `clinica`
  MODIFY `id_clinica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colonia`
--
ALTER TABLE `colonia`
  MODIFY `id_colonia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `id_consultorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `consultorio_doctor`
--
ALTER TABLE `consultorio_doctor`
  MODIFY `id_consultorio_doctor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `datos_contacto`
--
ALTER TABLE `datos_contacto`
  MODIFY `id_datos_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `encuesta_consulta`
--
ALTER TABLE `encuesta_consulta`
  MODIFY `id_encuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `id_enfermedad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `paciente_parametros`
--
ALTER TABLE `paciente_parametros`
  MODIFY `id_paciente_parametros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `parametros_paciente`
--
ALTER TABLE `parametros_paciente`
  MODIFY `id_parametros_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `tipo_enfermedad`
--
ALTER TABLE `tipo_enfermedad`
  MODIFY `id_tipo_enfermedad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_estado1` FOREIGN KEY (`fk_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clinica`
--
ALTER TABLE `clinica`
  ADD CONSTRAINT `fk_clinica_datos_contacto1` FOREIGN KEY (`fk_datos_contacto`) REFERENCES `datos_contacto` (`id_datos_contacto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD CONSTRAINT `fk_colonia_ciudad1` FOREIGN KEY (`fk_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`fk_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `fk_consulta_consultorio1` FOREIGN KEY (`fk_consultorio`) REFERENCES `consultorio` (`id_consultorio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_diagnostico1` FOREIGN KEY (`diagnostico_id_diagnostico`) REFERENCES `diagnostico` (`id_diagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_empleado1` FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_encuesta_consulta1` FOREIGN KEY (`fk_encuesta_consulta`) REFERENCES `encuesta_consulta` (`id_encuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_parametros_paciente1` FOREIGN KEY (`fk_parametros_paciente`) REFERENCES `parametros_paciente` (`id_parametros_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_turno1` FOREIGN KEY (`fk_turno`) REFERENCES `turno` (`id_turno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD CONSTRAINT `fk_consultorio_clinica1` FOREIGN KEY (`fk_clinica`) REFERENCES `clinica` (`id_clinica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `consultorio_doctor`
--
ALTER TABLE `consultorio_doctor`
  ADD CONSTRAINT `consultorio_doctor_ibfk_1` FOREIGN KEY (`fk_consultorio`) REFERENCES `consultorio` (`id_consultorio`),
  ADD CONSTRAINT `consultorio_doctor_ibfk_2` FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `datos_contacto`
--
ALTER TABLE `datos_contacto`
  ADD CONSTRAINT `fk_datos_contacto_colonia1` FOREIGN KEY (`fk_colonia`) REFERENCES `colonia` (`id_colonia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_datos_contacto_persona1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `diagnostico_enfermedad`
--
ALTER TABLE `diagnostico_enfermedad`
  ADD CONSTRAINT `fk_diagnostico_has_enfermedad_diagnostico1` FOREIGN KEY (`fk_diagnostico`) REFERENCES `diagnostico` (`id_diagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_diagnostico_has_enfermedad_enfermedad1` FOREIGN KEY (`fk_enfermedad`) REFERENCES `enfermedad` (`id_enfermedad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_persona1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado_especialidad`
--
ALTER TABLE `empleado_especialidad`
  ADD CONSTRAINT `fk_empleado_has_especialidad_empleado1` FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_has_especialidad_especialidad1` FOREIGN KEY (`fk_especialidad`) REFERENCES `especialidad` (`id_especialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD CONSTRAINT `fk_enfermedad_tipo_enfermedad1` FOREIGN KEY (`fk_tipo_enfermedad`) REFERENCES `tipo_enfermedad` (`id_tipo_enfermedad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_paciente_persona1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paciente_parametros`
--
ALTER TABLE `paciente_parametros`
  ADD CONSTRAINT `paciente_parametros_ibfk_1` FOREIGN KEY (`fk_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `paciente_parametros_ibfk_2` FOREIGN KEY (`fk_parametros`) REFERENCES `parametros_paciente` (`id_parametros_paciente`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
