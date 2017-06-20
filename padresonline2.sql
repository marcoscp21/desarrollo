-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2017 a las 06:18:39
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `padresonline2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `matricula` int(11) NOT NULL,
  `idprofesor` int(10) DEFAULT NULL,
  `idtutor` int(11) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_p` varchar(45) NOT NULL,
  `apellido_m` varchar(45) DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `fecha_nac` varchar(30) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`matricula`, `idprofesor`, `idtutor`, `nombre`, `apellido_p`, `apellido_m`, `sexo`, `fecha_nac`, `curp`, `direccion`, `estado`, `ciudad`, `fecha_registro`) VALUES
(201330999, 2, 2, 'SCARLETT', 'HERNANDEZ', 'SANCHEZ DE LA VEGA', 'FEMENINO', '02-10-1995', 'HESO950302HTLRRM05', 'PRIVADA COLINAS DEL SUR, FRACCIONAMIENTO COLINAS DEL SUR', 'Tlaxcala', 'TLAXCALA', '2017-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `idcalificacion` int(11) NOT NULL,
  `matricula` int(11) DEFAULT NULL,
  `idmateria` int(11) DEFAULT NULL,
  `espanol` varchar(10) DEFAULT NULL,
  `matematicas` varchar(10) DEFAULT NULL,
  `ciencias_n` varchar(10) DEFAULT NULL,
  `computacion` varchar(10) DEFAULT NULL,
  `historia` varchar(10) DEFAULT NULL,
  `bimestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`idcalificacion`, `matricula`, `idmateria`, `espanol`, `matematicas`, `ciencias_n`, `computacion`, `historia`, `bimestre`) VALUES
(6, 201330999, NULL, '10', '8', '8', '10', '8', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `idDirector` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidop` varchar(60) DEFAULT NULL,
  `apellidom` varchar(45) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`idDirector`, `idusuario`, `nombre`, `apellidop`, `apellidom`, `email`) VALUES
(1, 1, 'ALEXIS', 'DOMINGUEZ', 'ROMERO', 'alex@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `grado` varchar(10) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  `ciclo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_asistencia`
--

CREATE TABLE `historial_asistencia` (
  `idhistorial` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `asistencia` varchar(2) NOT NULL,
  `lunes` varchar(10) DEFAULT NULL,
  `martes` varchar(10) DEFAULT NULL,
  `miercoles` varchar(10) DEFAULT NULL,
  `jueves` varchar(10) DEFAULT NULL,
  `viernes` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial_asistencia`
--

INSERT INTO `historial_asistencia` (`idhistorial`, `matricula`, `asistencia`, `lunes`, `martes`, `miercoles`, `jueves`, `viernes`, `fecha`) VALUES
(2, 201330999, '', 'A', 'A', 'F', 'F', '', '2017-06-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `justificante`
--

CREATE TABLE `justificante` (
  `idfalta` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `fecha_enviada` date NOT NULL,
  `fecha_falta` date NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `imagen` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `grado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `idmensaje` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `idtutor` int(11) NOT NULL,
  `remitente` varchar(50) NOT NULL,
  `mensaje` longtext,
  `fecha_sistema` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`idmensaje`, `idprofesor`, `idtutor`, `remitente`, `mensaje`, `fecha_sistema`) VALUES
(25, 2, 2, 'PROFESOR', 'Hola padre de familia, te recuerdo asistir con nosotros el dia del padre...', '2017-06-13 09:00:00'),
(26, 2, 2, 'PROFESOR', 'hola padre', '2017-06-14 08:33:35'),
(27, 2, 2, 'PADRE DE FAMILIA', 'HOLA PROFE', '2017-06-14 08:43:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacion`
--

CREATE TABLE `observacion` (
  `idobservacion` int(11) NOT NULL,
  `idprofesor` int(10) NOT NULL,
  `matricula` int(11) NOT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_sistema` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre`
--

CREATE TABLE `padre` (
  `idtutor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_p` varchar(45) NOT NULL,
  `apellido_m` varchar(45) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `ocupacion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(220) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `padre`
--

INSERT INTO `padre` (`idtutor`, `idusuario`, `nombre`, `apellido_p`, `apellido_m`, `sexo`, `ocupacion`, `ciudad`, `estado`, `telefono`, `direccion`, `email`, `status`) VALUES
(2, 3, 'ANGEL', 'LOPEZ', 'VISCAINO', 'MASCULINO', '', 'PUEBLA', 'Puebla', '1234567890', 'PUEBLA, PUEBLA', 'angel@correo.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `idprofesor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_p` varchar(45) NOT NULL,
  `apellido_m` varchar(45) DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `fecha_nac` varchar(45) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `direccion` varchar(220) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `estudios` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idprofesor`, `idusuario`, `nombre`, `apellido_p`, `apellido_m`, `sexo`, `fecha_nac`, `curp`, `rfc`, `direccion`, `ciudad`, `estado`, `telefono`, `estudios`, `email`, `status`) VALUES
(2, 2, 'OMAR', 'HERNANDEZ', 'SARMIENTO', 'MASCULINO', '02-03-1995', 'HESO950302HTLRRM05', 'HESO950302CI0', 'PRIVADA COLINAS DEL SUR, FRACCIONAMIENTO COLINAS DEL SUR', 'TLAXCALA', 'Tlaxcala', '2461740490', 'LICENCIATURA', 'omar_350_hs@hotmail.com', 1),
(3, NULL, 'MARCOS', 'CUELLAR', 'PEREZ', 'MASCULINO', '21-11-1995', 'CUPM951121HHLLR07', '', 'PUEBLA, PUEBLA', 'PUEBLA', 'Puebla', '2227140061', 'licenciatura', 'marcos.cp21@hotmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `idreporte` int(200) NOT NULL,
  `idprofesor` int(200) NOT NULL,
  `idtutor` int(200) NOT NULL,
  `remitente` varchar(200) NOT NULL,
  `mensaje` longtext,
  `fecha_sistema` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`idreporte`, `idprofesor`, `idtutor`, `remitente`, `mensaje`, `fecha_sistema`) VALUES
(1, 2, 2, 'PROFESOR', 'Pedro golpeo a su compaÃ±ero y se quedara toda la semana a cumplir su sanciÃ³n ', '2017-06-14 23:03:15.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `idtarea` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(35) NOT NULL,
  `permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `password`, `permiso`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(2, 'profe', '1145cbf42070c6704b66d6ac75347726', 2),
(3, 'padre', '41409f34ee49036ad153fa10b374747e', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `fk_alumno_tutor_idx` (`idtutor`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`idcalificacion`),
  ADD KEY `fk_alumno_has_materia_materia1_idx` (`idmateria`),
  ADD KEY `fk_alumno_has_materia_alumno1_idx` (`matricula`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`idDirector`,`idusuario`),
  ADD KEY `fk_director_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idgrupo`,`matricula`,`idprofesor`),
  ADD KEY `fk_grupo_alumno1_idx` (`matricula`),
  ADD KEY `fk_grupo_profesor1_idx` (`idprofesor`);

--
-- Indices de la tabla `historial_asistencia`
--
ALTER TABLE `historial_asistencia`
  ADD PRIMARY KEY (`idhistorial`,`matricula`),
  ADD KEY `fk_historial_asistencia_alumno1_idx` (`matricula`);

--
-- Indices de la tabla `justificante`
--
ALTER TABLE `justificante`
  ADD PRIMARY KEY (`idfalta`),
  ADD KEY `fk_justificante_alumno1_idx` (`matricula`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`idmensaje`),
  ADD KEY `fk_mensaje_profesor1_idx` (`idprofesor`),
  ADD KEY `fk_mensaje_tutor1_idx` (`idtutor`);

--
-- Indices de la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD PRIMARY KEY (`idobservacion`),
  ADD KEY `fk_observacion_alumno1_idx` (`matricula`);

--
-- Indices de la tabla `padre`
--
ALTER TABLE `padre`
  ADD PRIMARY KEY (`idtutor`),
  ADD KEY `fk_tutor_usuario1_idx` (`idusuario`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`idprofesor`),
  ADD KEY `fk_profesor_usuario1_idx` (`idusuario`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`idreporte`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`idtarea`),
  ADD KEY `fk_tarea_alumno1_idx` (`matricula`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201331000;
--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `idcalificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `idDirector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `historial_asistencia`
--
ALTER TABLE `historial_asistencia`
  MODIFY `idhistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `justificante`
--
ALTER TABLE `justificante`
  MODIFY `idfalta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `idmensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `observacion`
--
ALTER TABLE `observacion`
  MODIFY `idobservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `padre`
--
ALTER TABLE `padre`
  MODIFY `idtutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `idprofesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `idreporte` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `idtarea` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `fk_alumno_tutor` FOREIGN KEY (`idtutor`) REFERENCES `padre` (`idtutor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `fk_alumno_has_materia_alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumno_has_materia_materia1` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `fk_director_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_profesor1` FOREIGN KEY (`idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial_asistencia`
--
ALTER TABLE `historial_asistencia`
  ADD CONSTRAINT `fk_historial_asistencia_alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `justificante`
--
ALTER TABLE `justificante`
  ADD CONSTRAINT `fk_justificante_alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `fk_mensaje_profesor1` FOREIGN KEY (`idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mensaje_tutor1` FOREIGN KEY (`idtutor`) REFERENCES `padre` (`idtutor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `fk_observacion_alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `padre`
--
ALTER TABLE `padre`
  ADD CONSTRAINT `fk_tutor_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_profesor_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `fk_tarea_alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
