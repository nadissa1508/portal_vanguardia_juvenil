-- Tabla Metodo_pago
CREATE TABLE Metodo_pago (
    id serial PRIMARY KEY NOT NULL,
    metodo_pago varchar(20)
);

-- Tabla Grado_seccion
CREATE TABLE Grado_seccion (
    id serial PRIMARY KEY NOT NULL,
    id_grado int NOT NULL REFERENCES Grados(id),
    id_seccion int NOT NULL REFERENCES Secciones(id)
);

-- Tabla Estudiante_grado_seccion
CREATE TABLE Estudiante_grado_seccion (
    id serial PRIMARY KEY NOT NULL,
    id_estudiante int NOT NULL REFERENCES Estudiantes(carnet),
    id_grado_seccion int NOT NULL REFERENCES Grado_seccion(id),
    fecha DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Tabla Trimestres
CREATE TABLE Trimestres (
    id serial PRIMARY KEY NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);

-- Tabla Boleta_calificaciones
CREATE TABLE Boleta_calificaciones (
    id serial PRIMARY KEY NOT NULL,
    carnet_estudiante int NOT NULL REFERENCES Estudiantes(carnet),
    fecha date NOT NULL,
    ciclo_escolar varchar(4),
    trimestre_id int REFERENCES Trimestres(id)
);


-- Modificar tabla Padres
ALTER TABLE Padres
    RENAME COLUMN apellido_estudiante TO apellido;

ALTER TABLE Padres
    RENAME COLUMN pasword TO password;

-- Modificar tabla Estudiantes
ALTER TABLE Estudiantes
    ADD COLUMN id_grado_seccion int REFERENCES Grado_seccion(id),
    DROP CONSTRAINT estudiantes_grado_fkey,
    DROP COLUMN grado;

-- Modificar tabla Administrativos
ALTER TABLE Administrativos
    RENAME COLUMN pasword TO password;

-- Modificar tabla Secciones
ALTER TABLE Secciones
    ADD COLUMN seccion varchar(5),
    DROP CONSTRAINT secciones_carnet_estudiante_fkey,
    DROP COLUMN carnet_estudiante;

--Modificar la tabla Solvencias
ALTER TABLE Solvencias
    ADD COLUMN no_boleta int NOT NULL,
    ADD COLUMN id_metodo_pago int NOT NULL REFERENCES Metodo_pago(id),
    ADD COLUMN monto decimal (10,2),
    DROP COLUMN mes_solvencia,
    ADD COLUMN mes_solvencia_new VARCHAR(15) NOT NULL CHECK (
        mes_solvencia_new IN (
            'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
        )
    );

-- Modificar tabla Cursos
ALTER TABLE Cursos
    ADD COLUMN id_grado_seccion int NOT NULL REFERENCES Grado_seccion(id),
    DROP CONSTRAINT cursos_id_seccion_fkey,
    DROP COLUMN id_seccion,
    DROP CONSTRAINT cursos_id_grado_fkey,
    DROP COLUMN id_grado;

-- esto no es necesario, ver si lo agregamos
-- Modificar tabla Cursos
ALTER TABLE Tareas
    ADD COLUMN id_trimestres int NOT NULL REFERENCES Trimestres(id);

-- Modificar tabla Grados
ALTER TABLE Grados
    ALTER COLUMN grado TYPE varchar(255);


-- Modificar tabla Calificaciones
ALTER TABLE Calificaciones
    ADD COLUMN id_boleta int NOT NULL REFERENCES Boleta_calificaciones(id),
    ADD COLUMN id_tarea int NOT NULL REFERENCES Tareas(id);

-- Modificar tabla Tareas
ALTER TABLE Tareas
    ADD COLUMN trimestre_id int REFERENCES Trimestres(id);

-- Modificar tabla Observaciones
ALTER TABLE Observaciones
    ADD COLUMN id_calificacion int NOT NULL REFERENCES Calificaciones(id);