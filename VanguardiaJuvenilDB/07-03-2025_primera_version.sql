-- Creación Tabla Usuarios
create table Usuarios (
    id int primary key not null,
    rol varchar(50) not null
);

-- Creación Tabla Materiales
create table Materiales (
    id int primary key not null,
    nombre varchar(50) not null
);

-- Creación Tabla Grados
create table Grados (
    id int primary key not null,
    grado varchar(50) not null
);

-- Creación Tabla Maestros
create table Maestros (
    id int primary key not null,
    rol int not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    email varchar(50) not null,
    telefono varchar(14) not null,
    password varchar(50) not null,
    foreign key (rol) references Usuarios(id)
)

-- Creación Tabla Estudiantes
create table Estudiantes (
    carnet int primary key not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fecha_nacimiento date not null,
    grado int not null,
    id_padre int not null,
    foreign key (grado) references Grados(id),
    foreign key (id_padre) references Padres(id)
)