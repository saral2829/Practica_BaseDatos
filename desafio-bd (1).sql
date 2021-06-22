-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2021 a las 09:34:51
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio-bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `num_dep` tinyint(4) NOT NULL,
  `nom_departamento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `presupuesto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`num_dep`, `nom_departamento`, `presupuesto`) VALUES
(11, 'Calidad', 40000),
(14, 'Informática', 80000),
(15, 'Gestión', 95000),
(16, 'Comunicación', 75000),
(37, 'Desarrollo', 65000),
(77, 'Investigación', 40000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `dni` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`dni`, `nombre`, `apellido`, `departamento`) VALUES
('31096675', 'Martin', 'Zarabia', 77),
('31096678', 'Juan', 'Lopez', 14),
('31236985', 'Maria', 'diamante', 14),
('32145698', 'Guadalupe', 'Perez', 77),
('32369854', 'Bernardo', 'pantera', 37),
('32698546', 'Carmen', 'barbieri', 16),
('32698547', 'Mariana ', 'Lopez', 15),
('33698521', 'Pedro', 'Perez', 14),
('34269854', 'Jose', 'Velez', 77),
('36125896', 'Marti', 'Julia', 14),
('36125965', 'Lucia', 'Pesaro', 14),
('36985471', 'Omar', 'Díaz', 15),
('41369852', 'Paula', 'Madariaga', 77),
('42369854', 'Abril', 'Sanchez', 37),
('89267109', 'Esther', 'Vazquez', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`num_dep`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`dni`);
COMMIT;

--
-- Consultas 
--

2.1 obtener los apellidos de los empleados

	SELECT apellido FROM `empleado`

2.2 obtener los apellidos de los empleados sin repeticiones

	SELECT DISTINCT apellido FROM `empleado`

2.3 obtener los datos de los empleados que tengan el apellido Lopez

	SELECT * FROM `empleado` WHERE apellido = 'Lopez'

2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez


	SELECT * FROM `empleado` WHERE apellido = 'Lopez' OR apellido = 'Perez'

2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14

	SELECT * FROM `empleado` WHERE departamento = '14'

2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77

	SELECT * FROM `empleado` WHERE departamento = '77' OR departamento = '37'

2.7 Obtener los datos de los empleados cuyo apellido comience con P

	SELECT * FROM `empleado` WHERE apellido LIKE 'P%'


2.8 Obtener el presupuesto total de todos los departamentos

	SELECT SUM(presupuesto) AS PresupuestoTotal FROM `departamentos`

2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado
y de su departamento

SELECT *FROM `empleado` INNER JOIN `departamentos` on empleado.departamento= departamentos.num_dep

2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto
al nombre y presupuesto de su departamento

	SELECT empleado.nombre,apellido, departamentos.nom_departamento,presupuesto FROM `empleado` INNER JOIN `departamentos` on empleado.departamento= departamentos.num_dep

2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo
presupuesto sea mayor de 60000


	SELECT empleado.nombre,apellido FROM `empleado` INNER JOIN `departamentos` ON empleado.departamento= departamentos.num_dep AND departamentos.presupuesto>60000

2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un
empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109

	INSERT INTO `departamentos` VALUES('11', 'Calidad', '40000')

	INSERT INTO `empleado` VALUES('89267109', 'Esther', 'Vazquez', 11)












/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
