-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2024 a las 20:45:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restorant`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cat_cod` char(5) NOT NULL,
  `cat_nom` varchar(30) DEFAULT NULL,
  `cat_pre` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`cat_cod`, `cat_nom`, `cat_pre`) VALUES
('t0001', 'Desayuno', 1.50),
('t0002', 'Entrada', 4.00),
('t0003', 'Segundo', 7.00),
('t0004', 'Extra', 20.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_cod` varchar(10) NOT NULL,
  `cli_nom` varchar(35) DEFAULT NULL,
  `cli_dni` varchar(35) DEFAULT NULL,
  `cli_tel` varchar(10) DEFAULT NULL,
  `cli_cor` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_cod`, `cli_nom`, `cli_dni`, `cli_tel`, `cli_cor`) VALUES
('C0001', 'Juan Pérez', '12345678', '972055610', 'juan.perez@example.com'),
('C0002', 'María García', '87654321', '972055611', 'maria.garcia@example.com'),
('C0003', 'Carlos Sánchez', '11223344', '972055612', 'carlos.sanchez@example.com'),
('C0004', 'Ana Rodríguez', '44332211', '972055613', 'ana.rodriguez@example.com'),
('C0005', 'Luis Fernández', '55667788', '972055614', 'luis.fernandez@example.com'),
('C0006', 'Marta López', '88776655', '972055615', 'marta.lopez@example.com'),
('C0007', 'José González', '99887766', '972055616', 'jose.gonzalez@example.com'),
('C0008', 'Laura Martínez', '66554433', '972055617', 'laura.martinez@example.com'),
('C0009', 'Pedro Díaz', '33445566', '972055618', 'pedro.diaz@example.com'),
('C0010', 'Sofía Ramírez', '77665544', '972055619', 'sofia.ramirez@example.com'),
('C0011', 'Elena Torres', '11224466', '972055620', 'elena.torres@example.com'),
('C0012', 'Miguel Vargas', '22113344', '972055621', 'miguel.vargas@example.com'),
('C0013', 'Raquel Moreno', '33446677', '972055622', 'raquel.moreno@example.com'),
('C0014', 'Javier Navarro', '44557788', '972055623', 'javier.navarro@example.com'),
('C0015', 'Patricia Reyes', '55668899', '972055624', 'patricia.reyes@example.com'),
('C0016', 'Andrés Silva', '66779900', '972055625', 'andres.silva@example.com'),
('C0017', 'Isabel Soto', '77880011', '972055626', 'isabel.soto@example.com'),
('C0018', 'Tomás Vega', '88991122', '972055627', 'tomas.vega@example.com'),
('C0019', 'Verónica Gil', '99002233', '972055628', 'veronica.gil@example.com'),
('C0020', 'Francisco Herrera', '10111234', '972055629', 'francisco.herrera@example.com'),
('C0021', 'shrek', '1234567', '934680273', 'gato@123.com'),
('C0022', 'gato con botas', '45986532', '934680273', 'gato@777.com'),
('C0023', 'dragona', '1234567', '934680273', 'susi@123.com'),
('C0024', 'fiona', '45986532', '987654321', 'ona@one.com'),
('C0025', 'nantes', '45986532', '934680273', 'susi@123.com'),
('C0026', 'raposa', '45986532', '934680273', 'susi@123.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `com_cod` char(5) NOT NULL DEFAULT '',
  `com_nom` varchar(30) DEFAULT NULL,
  `com_stk` int(11) DEFAULT NULL,
  `cat_cod` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`com_cod`, `com_nom`, `com_stk`, `cat_cod`) VALUES
('c0001', 'Ceviche', 50, 't0002'),
('c0002', 'Causa', 50, 't0002'),
('c0003', 'Tequeños', 50, 't0002'),
('c0004', 'Pan rebosado', 30, 't0001'),
('c0005', 'Pan con palta', 50, 't0001'),
('c0006', 'Quinua', 30, 't0001'),
('c0007', 'Pescado con Garbanzos', 35, 't0003'),
('c0008', 'Pescado con Lentejas', 35, 't0003'),
('c0009', 'Asado con pure', 35, 't0003'),
('c0010', 'arroz con pollo', 33, 't0003'),
('c0011', 'Bisteck a lo pobre', 30, 't0004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `emp_cod` char(7) NOT NULL DEFAULT '',
  `emp_nom` varchar(35) DEFAULT NULL,
  `emp_ape` varchar(35) DEFAULT NULL,
  `emp_dni` varchar(10) DEFAULT NULL,
  `emp_tel` varchar(9) DEFAULT NULL,
  `emp_cor` varchar(35) DEFAULT NULL,
  `emp_car` varchar(35) DEFAULT NULL,
  `emp_tur` varchar(10) DEFAULT NULL,
  `usr_cod` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`emp_cod`, `emp_nom`, `emp_ape`, `emp_dni`, `emp_tel`, `emp_cor`, `emp_car`, `emp_tur`, `usr_cod`) VALUES
('e0001', 'julia', 'jimenez', '78451296', '987654321', 'juji@123.com', 'Ayudante', 'Mañana', 'u0001'),
('e0002', 'carol', 'diaz', '78451265', '123456789', 'cadi@123.com', 'Ayudante', 'Tarde', 'u0002'),
('e0003', 'Juan', 'Ramirez', '78653246', '123456789', 'jura@123.com', 'Mesero', 'Tarde', 'u0003'),
('e0004', 'Cusi', 'Cusa', '78456598', '123456789', 'cuca@123.com', 'Cocinero', 'Tarde', 'u0004'),
('e0005', 'Mero', 'Loco', '78659854', '123456789', 'melo@123.com', 'Cocinero', 'Mañana', 'u0005'),
('e0006', 'pablito', 'ramirez', '87659887', '123456789', 'para@123.com', 'Cocinero', 'Noche', 'u0006');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `msa_cod` char(5) NOT NULL DEFAULT '',
  `msa_num` varchar(3) DEFAULT NULL,
  `msa_pis` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`msa_cod`, `msa_num`, `msa_pis`) VALUES
('M0001', '001', '01'),
('M0002', '002', '01'),
('M0003', '003', '01'),
('M0004', '004', '01'),
('M0005', '005', '01'),
('M0006', '006', '01'),
('M0007', '007', '01'),
('M0008', '008', '01'),
('M0009', '009', '01'),
('M0010', '010', '01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peddets`
--

CREATE TABLE `peddets` (
  `pdt_cod` char(5) NOT NULL DEFAULT '',
  `ped_cod` char(5) DEFAULT NULL,
  `com_cod` char(5) DEFAULT NULL,
  `com_can` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peddets`
--

INSERT INTO `peddets` (`pdt_cod`, `ped_cod`, `com_cod`, `com_can`) VALUES
('d0001', 'p0001', 'c0002', 3),
('d0002', 'p0002', 'c0004', 2),
('d0003', 'p0003', 'c0007', 4),
('d0004', 'p0004', 'c0001', 3),
('d0005', 'p0005', 'c0002', 2),
('d0006', 'p0006', 'c0003', 1),
('d0007', 'p0007', 'c0004', 4),
('d0008', 'p0008', 'c0005', 3),
('d0009', 'p0009', 'c0006', 2),
('d0010', 'p0010', 'c0007', 5),
('d0011', 'p0011', 'c0008', 1),
('d0012', 'p0012', 'c0009', 4),
('d0013', 'p0013', 'c0010', 3),
('d0014', 'p0014', 'c0001', 2),
('d0015', 'p0015', 'c0002', 1),
('d0016', 'p0016', 'c0003', 5),
('d0017', 'p0017', 'c0004', 4),
('d0018', 'p0018', 'c0005', 2),
('d0019', 'p0019', 'c0006', 1),
('d0020', 'p0020', 'c0007', 3),
('d0021', 'p0021', 'c0008', 5),
('d0022', 'p0022', 'c0009', 4),
('d0023', 'p0023', 'c0010', 3),
('d0024', 'p0024', 'c0001', 3),
('d0025', 'p0025', 'c0002', 2),
('d0026', 'p0026', 'c0003', 1),
('d0027', 'p0027', 'c0004', 4),
('d0028', 'p0028', 'c0005', 3),
('d0029', 'p0029', 'c0006', 2),
('d0030', 'p0030', 'c0007', 5),
('d0031', 'p0031', 'c0008', 1),
('d0032', 'p0032', 'c0009', 4),
('d0033', 'p0033', 'c0010', 3),
('d0034', 'p0034', 'c0001', 2),
('d0035', 'p0035', 'c0002', 1),
('d0036', 'p0036', 'c0003', 5),
('d0037', 'p0037', 'c0004', 4),
('d0038', 'p0038', 'c0005', 2),
('d0039', 'p0039', 'c0006', 1),
('d0040', 'p0040', 'c0007', 3),
('d0041', 'p0041', 'c0008', 5),
('d0042', 'p0042', 'c0009', 4),
('d0043', 'p0043', 'c0010', 3),
('d0044', 'p0044', 'c0001', 3),
('d0045', 'p0045', 'c0002', 2),
('d0046', 'p0046', 'c0003', 1),
('d0047', 'p0047', 'c0004', 4),
('d0048', 'p0048', 'c0005', 3),
('d0049', 'p0049', 'c0006', 2),
('d0050', 'p0050', 'c0007', 5),
('d0051', 'p0051', 'c0008', 1),
('d0052', 'p0052', 'c0009', 4),
('d0053', 'p0053', 'c0010', 3),
('d0054', 'p0054', 'c0009', 1),
('d0055', 'p0055', 'c0001', 2),
('d0056', 'p0056', 'c0008', 1),
('d0057', 'p0057', 'c0005', 2),
('d0058', 'p0058', 'c0005', 8),
('d0059', 'p0059', 'c0005', 2),
('d0060', 'p0060', 'c0003', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ped_cod` char(5) NOT NULL DEFAULT '',
  `msa_cod` varchar(10) DEFAULT NULL,
  `cli_cod` varchar(35) DEFAULT NULL,
  `ped_fec` datetime DEFAULT NULL,
  `ped_igv` decimal(10,2) DEFAULT NULL,
  `emp_cod` varchar(10) DEFAULT NULL,
  `ped_est` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`ped_cod`, `msa_cod`, `cli_cod`, `ped_fec`, `ped_igv`, `emp_cod`, `ped_est`) VALUES
('p0001', 'M0001', 'patricio', '2024-05-26 22:40:49', 0.18, 'e0003', 'Pendiente'),
('p0002', 'M0005', 'bob', '2024-05-26 22:41:29', 0.18, 'e0006', 'Pendiente'),
('p0003', 'M0010', 'arenita', '2024-05-26 22:42:16', 0.18, 'e0001', 'Pendiente'),
('p0004', 'M0002', 'susi diaz', '2024-05-20 12:34:56', 0.18, 'e0001', 'Pendiente'),
('p0005', 'M0003', 'Juan Perez', '2024-05-21 14:20:10', 0.18, 'e0002', 'Pendiente'),
('p0006', 'M0004', 'Maria Lope', '2024-05-22 18:10:45', 0.18, 'e0003', 'Pendiente'),
('p0007', 'M0005', 'Carlos Mar', '2024-05-23 11:05:30', 0.18, 'e0004', 'Pendiente'),
('p0008', 'M0006', 'Luisa Fern', '2024-05-24 16:50:15', 0.18, 'e0005', 'Pendiente'),
('p0009', 'M0007', 'Ana Ramire', '2024-05-25 13:45:00', 0.18, 'e0006', 'Pendiente'),
('p0010', 'M0008', 'Miguel Tor', '2024-05-26 10:30:00', 0.18, 'e0001', 'Pendiente'),
('p0011', 'M0009', 'Rosa Casti', '2024-05-20 09:25:00', 0.18, 'e0002', 'Pendiente'),
('p0012', 'M0010', 'Fernando G', '2024-05-21 17:15:00', 0.18, 'e0003', 'Pendiente'),
('p0013', 'M0001', 'Elena Roja', '2024-05-22 12:00:00', 0.18, 'e0004', 'Pendiente'),
('p0014', 'M0002', 'Diego Hern', '2024-05-23 18:45:00', 0.18, 'e0005', 'Pendiente'),
('p0015', 'M0003', 'Lucia Guti', '2024-05-24 15:30:00', 0.18, 'e0006', 'Pendiente'),
('p0016', 'M0004', 'Jorge Ruiz', '2024-05-25 11:20:00', 0.18, 'e0001', 'Pendiente'),
('p0017', 'M0005', 'Patricia M', '2024-05-26 14:10:00', 0.18, 'e0002', 'Pendiente'),
('p0018', 'M0006', 'Pedro Sanc', '2024-05-20 10:15:00', 0.18, 'e0003', 'Pendiente'),
('p0019', 'M0007', 'Sofia Mora', '2024-05-21 19:05:00', 0.18, 'e0004', 'Pendiente'),
('p0020', 'M0008', 'Gabriel Or', '2024-05-22 13:55:00', 0.18, 'e0005', 'Pendiente'),
('p0021', 'M0009', 'Monica Var', '2024-05-23 09:45:00', 0.18, 'e0006', 'Pendiente'),
('p0022', 'M0010', 'Raul Vega', '2024-05-24 16:35:00', 0.18, 'e0001', 'Pendiente'),
('p0023', 'M0001', 'Adriana Sa', '2024-05-25 12:25:00', 0.18, 'e0002', 'Pendiente'),
('p0024', 'M0002', 'susi diaz', '2022-01-15 12:34:56', 0.18, 'e0001', 'Pendiente'),
('p0025', 'M0003', 'Juan Perez', '2022-02-20 14:20:10', 0.18, 'e0002', 'Pendiente'),
('p0026', 'M0004', 'Maria Lope', '2022-03-18 18:10:45', 0.18, 'e0003', 'Pendiente'),
('p0027', 'M0005', 'Carlos Mar', '2022-04-22 11:05:30', 0.18, 'e0004', 'Pendiente'),
('p0028', 'M0006', 'Luisa Fern', '2022-05-30 16:50:15', 0.18, 'e0005', 'Pendiente'),
('p0029', 'M0007', 'Ana Ramire', '2022-06-10 13:45:00', 0.18, 'e0006', 'Pendiente'),
('p0030', 'M0008', 'Miguel Tor', '2022-07-25 10:30:00', 0.18, 'e0001', 'Pendiente'),
('p0031', 'M0009', 'Rosa Casti', '2022-08-17 09:25:00', 0.18, 'e0002', 'Pendiente'),
('p0032', 'M0010', 'Fernando G', '2022-09-10 17:15:00', 0.18, 'e0003', 'Pendiente'),
('p0033', 'M0001', 'Elena Roja', '2022-10-05 12:00:00', 0.18, 'e0004', 'Pendiente'),
('p0034', 'M0002', 'Diego Hern', '2022-11-22 18:45:00', 0.18, 'e0005', 'Pendiente'),
('p0035', 'M0003', 'Lucia Guti', '2022-12-01 15:30:00', 0.18, 'e0006', 'Pendiente'),
('p0036', 'M0004', 'Jorge Ruiz', '2022-12-15 11:20:00', 0.18, 'e0001', 'Pendiente'),
('p0037', 'M0005', 'Patricia M', '2022-12-25 14:10:00', 0.18, 'e0002', 'Pendiente'),
('p0038', 'M0006', 'Pedro Sanc', '2022-12-30 10:15:00', 0.18, 'e0003', 'Pendiente'),
('p0039', 'M0007', 'Sofia Mora', '2022-12-31 19:05:00', 0.18, 'e0004', 'Pendiente'),
('p0040', 'M0008', 'Gabriel Or', '2022-12-28 13:55:00', 0.18, 'e0005', 'Pendiente'),
('p0041', 'M0009', 'Monica Var', '2023-01-15 09:45:00', 0.18, 'e0006', 'Pendiente'),
('p0042', 'M0010', 'Raul Vega', '2023-02-20 16:35:00', 0.18, 'e0001', 'Pendiente'),
('p0043', 'M0001', 'Adriana Sa', '2023-03-18 12:25:00', 0.18, 'e0002', 'Pendiente'),
('p0044', 'M0002', 'susi diaz', '2023-04-22 12:34:56', 0.18, 'e0003', 'Pendiente'),
('p0045', 'M0003', 'Juan Perez', '2023-05-30 14:20:10', 0.18, 'e0004', 'Pendiente'),
('p0046', 'M0004', 'Maria Lope', '2023-06-10 18:10:45', 0.18, 'e0005', 'Pendiente'),
('p0047', 'M0005', 'Carlos Mar', '2023-07-25 11:05:30', 0.18, 'e0006', 'Pendiente'),
('p0048', 'M0006', 'Luisa Fern', '2023-08-17 16:50:15', 0.18, 'e0001', 'Pendiente'),
('p0049', 'M0007', 'Ana Ramire', '2023-09-10 13:45:00', 0.18, 'e0002', 'Pendiente'),
('p0050', 'M0008', 'Miguel Tor', '2023-10-05 10:30:00', 0.18, 'e0003', 'Pendiente'),
('p0051', 'M0009', 'Rosa Casti', '2023-11-22 09:25:00', 0.18, 'e0004', 'Pendiente'),
('p0052', 'M0010', 'Fernando G', '2023-12-01 17:15:00', 0.18, 'e0005', 'Pendiente'),
('p0053', 'M0001', 'Elena Roja', '2023-12-15 12:00:00', 0.18, 'e0006', 'Pendiente'),
('p0054', 'M0007', 'Pricila', '2024-05-31 20:06:17', 0.18, 'e0002', 'Pendiente'),
('p0055', 'M0001', 'burro', '2024-06-01 18:09:14', 0.18, 'e0001', 'Pendiente'),
('p0056', 'M0001', 'burro2', '2024-06-01 18:16:23', 0.18, 'e0001', 'Pendiente'),
('p0057', 'M0003', 'shrek', '2024-06-01 18:18:44', 0.18, 'e0003', 'Pendiente'),
('p0058', 'M0004', 'fiona', '2024-06-01 18:27:07', 0.18, 'e0003', 'Pendiente'),
('p0059', 'M0007', 'C0025', '2024-06-01 18:41:42', 0.18, 'e0001', 'Pendiente'),
('p0060', 'M0010', 'C0026', '2024-06-01 18:45:29', 0.18, 'e0003', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usr_cod` char(7) NOT NULL DEFAULT '',
  `usr_nom` varchar(35) DEFAULT NULL,
  `usr_con` varchar(35) DEFAULT NULL,
  `usr_rol` varchar(20) DEFAULT NULL,
  `usr_est` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usr_cod`, `usr_nom`, `usr_con`, `usr_rol`, `usr_est`) VALUES
('u0001', 'juji@123.com', '1234567', 'User', 'Activo'),
('u0002', 'cadi@123.com', '1234567', 'User', 'Activo'),
('u0003', 'jura@123.com', '1234567', 'User', 'Activo'),
('u0004', 'cuca@123.com', '1234567', 'User', 'Activo'),
('u0005', 'melo@123.com', '1234567', 'User', 'Activo'),
('u0006', 'para@123.com', '1234567', 'User', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cat_cod`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_cod`);

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`com_cod`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`emp_cod`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`msa_cod`);

--
-- Indices de la tabla `peddets`
--
ALTER TABLE `peddets`
  ADD PRIMARY KEY (`pdt_cod`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ped_cod`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usr_cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
