-- Creación Tabla Usuarios
create table Usuarios (
    id serial primary key not null,
    rol varchar(50) not null
);

-- Creación Tabla Materias
create table Materiales (
    id serial primary key not null,
    nombre varchar(50) not null
);

-- Creación Tabla Grados
create table Grados (
    id serial primary key not null,
    grado varchar(50) not null
);-- Creación Tabla Maestros
create table Maestros (
  id serial primary key not null,
  rol int not null,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  email varchar(50) not null,
  telefono varchar(14) not null,
  password varchar(50) not null,
  foreign key (rol) references Usuarios (id)
)
-- Creación Tabla Estudiantes
create table Estudiantes (
  carnet int primary key not null,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  fecha_nacimiento date not null,
  grado int not null,
  id_padre int not null,
  foreign key (grado) references Grados (id),
  foreign key (id_padre) references Padres (id)
)
-- Creación tabla Padres
Create table Padres (
  id serial primary key not null,
  carnet_estudiante int not null, --ver si lo hacemos unique por ser clave de acceso al portal
  rol int not null,
  apellido_estudiante varchar(50) not null,
  email varchar(50) unique not null,
  pasword varchar(50) not null,
  foreign key (carnet_estudiante) references estudiantes (carnet),
  foreign key (rol) references usuarios (id),
  foreign key (apellido_estudiante) references estudiantes (apellido)
)
-- Creación tabla Familia
-- Tabla para relacionar a los padres/tutores con los alumnos
Create table Familias (
  id serial primary key not null,
  id_padre int not null,
  id_estudiante int not null,
  foreign key (id_padre) references padres (id),
  foreign key (id_estudiante) references estudiantes (carnet)
)
-- Creación tabla Administrativos
Create table Administrativos (
  id serial primary key not null,
  rol int not null,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  email varchar(50) unique not null,
  telefono varchar(14) not null,
  pasword varchar(50) not null,
  foreign key (rol) references usuarios (id)
)
-- Creación tabla Secciones
Create table Secciones (
  id serial primary key not null,
  id_estudiante int not null,
  foreign key (id_estudiante) references estudiantes (carnet)
)
-- Creación tabla pagos
Create table Pagos (
	id serial primary key not null,
	id_padre int references Padres(id)
	id_estudiante int references Estudiantes(id)
)
-- Creación tabla solvencias
Create table Solvencias (
	id serial primary key not null,
	id_pagos int references Pagos (id) not null,
	mes_solvencia date not null,
	fecha_pago date not null
)

-- Creación tabla cursos
Create table Cursos (
	id serial primary key not null,
	id_materia int not null references Materias(id),
	id_maestro int not null references Maestros(id),
	id_seccion int not null references Secciones(id),
	id_grado serial not null references Grados(id)
)

-- Creación tabla 
Create table Cursos_tareas (
	id serial primary key not null,
	id_curso int not null references Cursos(id),
	id_tareas int not null references Tareas(id)
)

-- Creación de la tabla Tareas
CREATE TABLE Tareas (
    id SERIAL PRIMARY KEY NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    valor FLOAT NOT NULL, -- Puedes cambiar a INT si los valores son enteros
    fecha_entrega DATE NOT NULL
);

-- Creación de la tabla Asistencia
CREATE TABLE Asistencia (
    id SERIAL PRIMARY KEY NOT NULL,
    id_curso INT NOT NULL,
    id_estudiante INT NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(carnet)
);

-- Creación de la tabla Calificaciones
CREATE TABLE Calificaciones (
    id SERIAL PRIMARY KEY NOT NULL,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    nota FLOAT NOT NULL, -- Se puede cambiar el tipo de dato si se manejan valores enteros
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(carnet),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

-- Creación de la tabla Observaciones
CREATE TABLE Observaciones (
    id SERIAL PRIMARY KEY NOT NULL,
    id_estudiantes INT NOT NULL,
    id_curso INT NOT NULL,
    observaciones TEXT,
    puntos_de_accion TEXT,
    FOREIGN KEY (id_estudiantes) REFERENCES Estudiantes(carnet),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);