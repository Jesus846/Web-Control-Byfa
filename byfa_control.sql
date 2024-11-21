-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 21:55:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `byfa_control`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `ID` int(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Area` varchar(50) NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Observaciones` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`ID`, `Nombre`, `Area`, `Hora_Entrada`, `Hora_Salida`, `Fecha`, `Observaciones`) VALUES
(1, 'Antonio juares', 'Almacen', '00:00:00', '23:42:35', '2024-10-22', 'n'),
(2, 'Antonio juares', 'Almacen', '23:42:06', '23:42:35', '2024-10-22', 'n'),
(3, 'Peres juan', 'Cargador', '10:26:21', '10:30:21', '2024-10-23', 'n'),
(4, 'Peres juan', 'Cargador', '10:32:35', '10:33:47', '2024-10-23', 'n'),
(5, 'Peres juan', 'Cargador', '10:40:54', '10:42:34', '2024-10-23', 'n'),
(6, 'Toledo gomez', 'procesos', '10:43:00', NULL, '2024-10-23', 'n'),
(7, 'Peres juan', 'Cargador', '11:09:47', '11:11:18', '2024-10-23', 'N'),
(8, 'Toledo gomez', 'procesos', '11:10:27', NULL, '2024-10-23', 'moto'),
(9, 'Antonio juares', 'Almacen', '11:10:42', NULL, '2024-10-23', 'Coche'),
(10, 'Venesa Gonzales', 'Recursos Humanos', '22:48:06', '01:01:39', '2024-10-30', 'Nada'),
(11, 'Jesus Jiemenez', 'Sistemas', '15:09:50', '01:08:31', '2024-10-31', 'Nada'),
(12, 'Melvin Jhafet Vazquez Hernandez', 'TI', '00:37:54', '01:01:09', '2024-11-05', 'Moto'),
(13, 'Venesa Gonzales', 'Recursos Humanos', '01:01:50', '01:03:34', '2024-11-06', 'nada'),
(14, 'Jesus Jiemenez', 'Sistemas', '01:03:40', '01:08:31', '2024-11-06', 'n'),
(15, 'Jesus Jiemenez', 'Sistemas', '01:07:59', '01:08:31', '2024-11-06', 'n+'),
(16, 'Venesa Gonzales', 'Recursos Humanos', '01:08:41', '01:08:50', '2024-11-06', 'n'),
(17, 'Venesa Gonzales', 'Recursos Humanos', '01:15:22', '01:15:33', '2024-11-06', 'n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `Cargo` varchar(30) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Nombre`, `Usuario`, `Contrasena`, `Cargo`, `Fecha`) VALUES
(1, 'Jesus Alejandro Jimenez Jimenez', 'Sistemas', 'Overlord#1', 'Admin', '2024-10-19'),
(2, 'Vanesa Gonzales', 'RH', '123456', 'Recursos Humanos', '2024-10-19'),
(3, 'Victor Abigail', 'Seguridad1', '123456', 'Seguridad', '2024-10-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `ID` int(200) NOT NULL,
  `Numero_de_tarjeta` int(50) NOT NULL,
  `Usuario_General` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Area` varchar(50) NOT NULL,
  `Observaciones` varchar(50) NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`ID`, `Numero_de_tarjeta`, `Usuario_General`, `Nombre`, `Area`, `Observaciones`, `Hora_Entrada`, `Hora_Salida`, `Fecha`) VALUES
(1, 1, 'Visitante1', 'Jesus Alejandro', 'Almacén', '', '00:00:00', NULL, '2024-10-30'),
(2, 1, 'Visitante1', 'Juan Alejandro', 'Recepción', '', '00:00:00', NULL, '2024-10-30'),
(3, 1, 'Visitante1', 'Juan antonio', 'Producción', '', '00:00:00', NULL, '2024-10-30'),
(4, 1, 'Visitante1', 'Juan Alejandro', 'Recepción', '', '00:00:00', NULL, '2024-10-30'),
(5, 1, 'Visitante1', 'Juan andres', 'Almacén', '', '00:00:00', NULL, '2024-10-30'),
(6, 1, 'Visitante1', 'Jesus', 'Recepción', '', '00:00:00', NULL, '2024-10-30'),
(7, 1, 'Visitante1', 'chuz', 'Oficinas', '', '14:18:51', NULL, '2024-10-30'),
(8, 1, 'Visitante1', 'Jesus Alejandro', 'Oficinas', 'Nada', '14:27:21', NULL, '2024-10-30'),
(9, 23, 'General2', 'Juan antonio', 'Almacén', '', '15:12:47', NULL, '2024-10-31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `ID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
