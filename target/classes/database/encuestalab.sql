-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 02:20:20
-- Versión del servidor: 10.4.21-MariaDB-log
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `encuestalab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` int(1) NOT NULL,
  `dep_fav` int(11) NOT NULL,
  `nivel_estudio` int(11) NOT NULL,
  `tema_fav` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`id`, `id_usuario`, `date`, `time`, `nombre`, `sexo`, `dep_fav`, `nivel_estudio`, `tema_fav`) VALUES
(1, 2, '2022-11-08', '17:54:25', 'Mario Quezada mod', 1, 1, 2, 3),
(2, 4, '2022-11-08', '18:01:31', 'Carla Maria', 0, 2, 3, 1),
(7, 6, '2022-11-09', '23:17:26', 'Jose Israel Sandoval Perez', 1, 6, 3, 5),
(11, 7, '2022-11-10', '00:17:06', 'Andres Felipe Gonzales', 1, 1, 1, 1),
(19, 3, '2022-11-10', '03:24:47', 'Pedro Lopez', 1, 1, 2, 1),
(20, 8, '2022-11-10', '09:29:54', 'Jose Miguel Fernandez', 1, 5, 3, 2),
(21, 23, '2022-11-10', '15:30:22', 'Ignacio Mendez Moran', 1, 3, 1, 3),
(23, 5, '2022-11-10', '19:08:57', 'prueba user', 0, 2, 3, 4),
(24, 24, '2022-11-10', '19:11:09', 'Patricia Mendez', 0, 5, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'administrador'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` int(11) NOT NULL,
  `encuestado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `username`, `password`, `id_rol`, `encuestado`) VALUES
(1, 'Marco Esquivel Juarez', 'admin', 'adminpass', 1, 0),
(2, 'Mario Quezada mod', 'marioq', 'marioqpass', 2, 1),
(3, 'Pedro Lopez', 'pedrol', 'pedropass', 2, 1),
(4, 'Carla Maria', 'carla', 'carlapass', 2, 1),
(5, 'prueba user', 'prueba', 'pruebapass', 2, 1),
(6, 'Jose Israel Sandoval Perez', 'josesan', 'josepass', 2, 1),
(7, 'Andres Felipe Gonzales', 'andres', 'andrespass', 2, 1),
(8, 'Jose Miguel Fernandez', 'josemiguel', 'josemiguelpass', 2, 1),
(23, 'Ignacio Mendez Moran', 'ignacio', 'ignaciopass', 2, 1),
(24, 'Patricia Mendez', 'patricia', 'patriciapass', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
