INSERT INTO Usuarios (rol) VALUES 
('SUP'),
('Padre'),
('Maestro'),
('Administrativo'),
('Padre'),
('Maestro'),
('Administrativo'),
('Padre'),
('Maestro'),
('Administrativo');

INSERT INTO Padres (carnet_estudiante, rol, apellido, email, telefono, password) VALUES 
(1001, 2, 'Gomez', 'padre1@example.com', '1234567890', 'password1'),
(1002, 5, 'Lopez', 'padre2@example.com', '2345678901', 'password2'),
(1003, 8, 'Martinez', 'padre3@example.com', '3456789012', 'password3'),
(1004, 2, 'Perez', 'padre4@example.com', '4567890123', 'password4'),
(1005, 5, 'Gonzalez', 'padre5@example.com', '5678901234', 'password5'),
(1006, 8, 'Rodriguez', 'padre6@example.com', '6789012345', 'password6'),
(1007, 2, 'Fernandez', 'padre7@example.com', '7890123456', 'password7'),
(1008, 5, 'Sanchez', 'padre8@example.com', '8901234567', 'password8'),
(1009, 8, 'Ramirez', 'padre9@example.com', '9012345678', 'password9'),
(1010, 2, 'Torres', 'padre10@example.com', '0123456789', 'password10');

INSERT INTO Estudiantes (carnet, nombre, apellido, fecha_nacimiento, id_grado_seccion) VALUES 
(1001, 'Juan', 'Gomez', '2010-05-15', 1),
(1002, 'Maria', 'Lopez', '2011-06-20', 2),
(1003, 'Carlos', 'Martinez', '2010-07-25', 3),
(1004, 'Ana', 'Perez', '2011-08-30', 4),
(1005, 'Luis', 'Gonzalez', '2010-09-10', 5),
(1006, 'Sofia', 'Rodriguez', '2011-10-15', 6),
(1007, 'Diego', 'Fernandez', '2010-11-20', 7),
(1008, 'Laura', 'Sanchez', '2011-12-25', 8),
(1009, 'Pedro', 'Ramirez', '2010-01-30', 9),
(1010, 'Lucia', 'Torres', '2011-02-05', 10);

INSERT INTO Familias (id_padre, carnet_estudiante) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(4, 1004),
(5, 1005),
(6, 1006),
(7, 1007),
(8, 1008),
(9, 1009),
(10, 1010);

INSERT INTO Materias (nombre) VALUES 
('Matemáticas'),
('Ciencias'),
('Historia'),
('Literatura'),
('Inglés'),
('Arte'),
('Educación Física'),
('Geografía'),
('Biología'),
('Química');

INSERT INTO Pagos (id_padre, carnet_estudiante) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(4, 1004),
(5, 1005),
(6, 1006),
(7, 1007),
(8, 1008),
(9, 1009),
(10, 1010);

INSERT INTO Metodo_pago (metodo_pago) VALUES 
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia'),
('Cheque'),
('PayPal'),
('Bitcoin'),
('Apple Pay'),
('Google Pay'),
('Pago Móvil');

INSERT INTO Solvencias (id_pagos, no_boleta, id_metodo_pago, monto, mes_solvencia_new, fecha_pago) VALUES
(1, 12345, 1, 500.00, 'Enero', '2023-01-15'),
(2, 12346, 2, 500.00, 'Febrero', '2023-02-15'),
(3, 12347, 1, 500.00, 'Marzo', '2023-03-15'),
(4, 12348, 2, 500.00, 'Abril', '2023-04-15'),
(5, 12349, 1, 500.00, 'Mayo', '2023-05-15'),
(6, 12350, 2, 500.00, 'Junio', '2023-06-15'),
(7, 12351, 1, 500.00, 'Julio', '2023-07-15'),
(8, 12352, 2, 500.00, 'Agosto', '2023-08-15'),
(9, 12353, 1, 500.00, 'Septiembre', '2023-09-15'),
(10, 12354, 2, 500.00, 'Octubre', '2023-10-15');

INSERT INTO Grados (grado) VALUES 
('Primer Grado'),
('Segundo Grado'),
('Tercer Grado'),
('Cuarto Grado'),
('Quinto Grado'),
('Sexto Grado'),
('Séptimo Grado'),
('Octavo Grado'),
('Noveno Grado'),
('Décimo Grado');

INSERT INTO Secciones (seccion) VALUES 
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('G'),
('H'),
('I'),
('J');

INSERT INTO Grado_seccion (id_grado, id_seccion) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);