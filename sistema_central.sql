-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2022 a las 01:21:18
-- Versión del servidor: 10.4.13-MariaDB-log
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_central`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conectores`
--

CREATE TABLE `conectores` (
  `id_conector` int(11) NOT NULL,
  `id_estacion` int(11) NOT NULL,
  `id_local` int(2) NOT NULL,
  `potencia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `conectores`
--

INSERT INTO `conectores` (`id_conector`, `id_estacion`, `id_local`, `potencia`, `estado`) VALUES
(1, 1, 1, ' 40 Kw', 'Dispomible'),
(2, 1, 2, '30 Kw', 'No disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id_estacion` int(4) NOT NULL,
  `codigo_estacion` varchar(20) NOT NULL,
  `nombre_estacion` varchar(30) DEFAULT NULL,
  `cant_conectores` int(2) NOT NULL,
  `nombre_foto` varchar(60) NOT NULL,
  `potencia_nominal` varchar(10) NOT NULL,
  `potencia_maxima` varchar(10) NOT NULL,
  `voltage_nominal` varchar(10) NOT NULL,
  `voltage_maximo` varchar(10) NOT NULL,
  `corriente_nominal` varchar(10) NOT NULL,
  `corriente_maxima` varchar(10) NOT NULL,
  `fases` int(1) NOT NULL,
  `cargas_simultaneas` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estaciones`
--

INSERT INTO `estaciones` (`id_estacion`, `codigo_estacion`, `nombre_estacion`, `cant_conectores`, `nombre_foto`, `potencia_nominal`, `potencia_maxima`, `voltage_nominal`, `voltage_maximo`, `corriente_nominal`, `corriente_maxima`, `fases`, `cargas_simultaneas`) VALUES
(0, 'navegador', 'Navegador', 1, '', '', '', '', '', '', '', 0, ''),
(1, 'EC0120040002R', 'Estacion 1 Campus Balzay', 2, 'Estacion1.png', '6.5 Kw', '43 Kw', '126 V', '127 V', '3 A', '10 A', 3, 'si'),
(2, 'AAAA', 'Estacion de mi casa', 3, '', '', '', '', '', '', '', 0, ''),
(4, 'EC0120040002L', 'Estacion 1 Campus Balzay', 2, 'Estacion2.png', '6.5 Kw', '43 Kw', '126 V', '127 V', '3 A', '10 A', 3, 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_estaciones`
--

CREATE TABLE `estados_estaciones` (
  `id_estado_est` int(2) NOT NULL,
  `estado_est_ingles` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `estado_est_espanol` varchar(35) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados_estaciones`
--

INSERT INTO `estados_estaciones` (`id_estado_est`, `estado_est_ingles`, `estado_est_espanol`) VALUES
(1, 'Available', 'Disponible'),
(2, 'Preparing', 'Preparando'),
(3, 'Charging', 'Cargando'),
(4, 'SuspendedEV', 'Vehiculo Electrico Suspendido'),
(5, 'SuspendedEVSE', 'Punto de Carga Suspendido'),
(6, 'Finishing', 'Finalizando'),
(7, 'Reserved', 'Reservada'),
(8, 'Unavailable', 'No Disponible'),
(9, 'Faulted', 'Deectuosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meter_values`
--

CREATE TABLE `meter_values` (
  `id_meter_value` int(3) NOT NULL,
  `nombre_meter_value` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `measurand` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `unit` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `meter_values`
--

INSERT INTO `meter_values` (`id_meter_value`, `nombre_meter_value`, `measurand`, `unit`) VALUES
(1, 'voltage', 'Voltage', 'V'),
(2, 'current', 'Current.Import', 'A'),
(3, 'energy', 'Energy.Active.Import.Register', 'kWh'),
(4, 'power', 'Power.Active.Export', 'kW'),
(5, 'frequency', 'Frequency', 'Hz'),
(6, 'temperature', 'Temperature', 'Celcius');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('4aQwnAY5F0Lry1wiE1eGbgg07r5BckOj', 1644786380, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1}}'),
('5mg8BFAT5nEk0QIcl7j50P3w-z45yvPj', 1644774245, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1}}'),
('GqxWy5-Y-_cVyqBGatqLiAg-7Nuzukns', 1644726257, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id_tarjeta` int(7) NOT NULL,
  `codigo_rfid` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`id_tarjeta`, `codigo_rfid`, `estado`) VALUES
(1, '0002020030000813', 'Accepted'),
(2, '0002020030000814', 'Accepted'),
(3, '7240E49A', 'Accepted'),
(4, '63F4CFC7', 'Accepted');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(8) NOT NULL,
  `id_estacion` int(4) NOT NULL,
  `codigo_rfid` varchar(30) NOT NULL,
  `id_conector` int(2) NOT NULL,
  `hora_inicio` timestamp NULL DEFAULT NULL,
  `hora_fin` timestamp NULL DEFAULT NULL,
  `energia_inicio` decimal(10,2) NOT NULL,
  `energia_fin` decimal(10,2) NOT NULL,
  `energia_consumida` decimal(5,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `razon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id_transaccion`, `id_estacion`, `codigo_rfid`, `id_conector`, `hora_inicio`, `hora_fin`, `energia_inicio`, `energia_fin`, `energia_consumida`, `estado`, `razon`) VALUES
(1, 1, '0002020030000813', 1, NULL, NULL, '4.00', '4.00', '0.00', 'Iniciada', 'Iniciada'),
(8, 1, '0002020030000813', 1, NULL, '0000-00-00 00:00:00', '4.00', '5.00', '999.99', 'Finalizada', 'Local'),
(16, 3, '0002020030000813', 1, '2022-01-09 22:54:26', '2022-01-09 22:54:26', '5.00', '5.00', '0.00', 'Initialized', 'Initialized'),
(17, 1, '0002020030000813', 1, NULL, NULL, '4.00', '4.00', '0.00', 'Iniciada', 'Iniciada'),
(18, 1, '0002020030000813', 1, NULL, NULL, '4.00', '4.00', '0.00', 'Iniciada', 'Iniciada'),
(19, 1, '0002020030000813', 1, NULL, NULL, '4.00', '4.00', '0.00', 'Iniciada', 'Iniciada'),
(20, 1, '0002020030000813', 1, NULL, NULL, '4.00', '4.00', '0.00', 'Iniciada', 'Iniciada'),
(21, 1, '0002020030000813', 1, NULL, NULL, '4.00', '4.00', '0.00', 'Iniciada', 'Iniciada'),
(22, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(23, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(24, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(25, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(26, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(27, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(28, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(29, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(30, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(31, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(32, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(33, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(34, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(35, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(36, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(37, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(38, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(39, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(40, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(41, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(42, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(43, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(44, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(45, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(46, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(47, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(48, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(49, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(50, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(51, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(52, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(53, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(54, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(55, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(56, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(57, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(58, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(59, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(60, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(61, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(62, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(63, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(64, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(65, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(66, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(67, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(68, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(69, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(70, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(71, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(72, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(73, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(74, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(75, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(76, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:21:33', '168255.00', '168255.00', '0.00', 'Iniciada', 'Iniciada'),
(77, 1, '7240E49A', 2, '2022-02-12 21:21:33', '2022-02-12 21:31:47', '168255.00', '174322.00', '999.99', 'Finalizada', 'Local'),
(78, 1, '7240E49A', 2, '2022-02-12 22:25:07', '2022-02-12 22:25:51', '174334.00', '174548.00', '999.99', 'Finalizada', 'Local'),
(79, 1, '7240E49A', 2, '2022-02-12 22:29:51', '2022-02-12 22:32:55', '174576.00', '175659.00', '999.99', 'Finalizada', 'Local'),
(80, 1, '7240E49A', 2, '2022-02-12 22:37:17', '2022-02-12 22:43:06', '175683.00', '177204.00', '999.99', 'Finalizada', 'Local'),
(81, 1, '63F4CFC7', 2, '2022-02-12 22:55:20', '2022-02-12 23:04:26', '177212.00', '178398.00', '999.99', 'Finalizada', 'Other');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(3) NOT NULL,
  `nombre_usuario` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`) VALUES
(0, 'navegador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conectores`
--
ALTER TABLE `conectores`
  ADD PRIMARY KEY (`id_conector`);

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id_estacion`);

--
-- Indices de la tabla `estados_estaciones`
--
ALTER TABLE `estados_estaciones`
  ADD PRIMARY KEY (`id_estado_est`);

--
-- Indices de la tabla `meter_values`
--
ALTER TABLE `meter_values`
  ADD PRIMARY KEY (`id_meter_value`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `conectores`
--
ALTER TABLE `conectores`
  MODIFY `id_conector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados_estaciones`
--
ALTER TABLE `estados_estaciones`
  MODIFY `id_estado_est` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `meter_values`
--
ALTER TABLE `meter_values`
  MODIFY `id_meter_value` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
