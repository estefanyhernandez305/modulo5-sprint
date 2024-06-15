CREATE DATABASE SoporteDB;

USE SoporteDB;

CREATE TABLE Usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Edad INT,
    Email VARCHAR(100) NOT NULL,
    NumUso INT DEFAULT 1
);

CREATE TABLE Operario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Edad INT,
    Email VARCHAR(100) NOT NULL,
    NumSoporte INT DEFAULT 1
);

CREATE TABLE Soporte (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    OperarioID INT,
    Fecha DATE,
    Evaluacion INT CHECK(Evaluacion >= 1 AND Evaluacion <= 7),
    Comentario TEXT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID),
    FOREIGN KEY (OperarioID) REFERENCES Operario(ID)
);

-- Insertar datos en las tablas
INSERT INTO Usuario (Nombre, Apellido, Edad, Email, NumUso) VALUES
('Juan', 'Pérez', 25, 'juan.perez@correo.com', 2),
('María', 'López', 30, 'maria.lopez@correo.com', 1),
('Carlos', 'Gómez', 22, 'carlos.gomez@correo.com', 3),
('Ana', 'Martínez', 28, 'ana.martinez@correo.com', 4),
('Luis', 'Sánchez', 35, 'luis.sanchez@correo.com', 5);

INSERT INTO Operario (Nombre, Apellido, Edad, Email, NumSoporte) VALUES
('Miguel', 'Díaz', 40, 'miguel.diaz@correo.com', 10),
('Sofía', 'Morales', 33, 'sofia.morales@correo.com', 15),
('Javier', 'Hernández', 29, 'javier.hernandez@correo.com', 20),
('Lucía', 'Torres', 31, 'lucia.torres@correo.com', 25),
('Pedro', 'Ramírez', 27, 'pedro.ramirez@correo.com', 30);

INSERT INTO Soporte (UsuarioID, OperarioID, Fecha, Evaluacion, Comentario) VALUES
(1, 1, '2024-01-01', 5, 'Buen servicio'),
(2, 2, '2024-01-02', 4, 'Aceptable'),
(3, 3, '2024-01-03', 6, 'Muy bueno'),
(4, 4, '2024-01-04', 3, 'Regular'),
(5, 5, '2024-01-05', 7, 'Excelente'),
(1, 2, '2024-01-06', 2, 'Malo'),
(2, 3, '2024-01-07', 1, 'Muy malo'),
(3, 4, '2024-01-08', 7, 'Excelente'),
(4, 5, '2024-01-09', 6, 'Muy bueno'),
(5, 1, '2024-01-10', 4, 'Aceptable');

SELECT * FROM Soporte ORDER BY Evaluacion DESC LIMIT 3;

SELECT * FROM Soporte ORDER BY Evaluacion ASC LIMIT 3;

SELECT OperarioID, COUNT(*) AS NumSoportes 
FROM Soporte 
GROUP BY OperarioID 
ORDER BY NumSoportes DESC 
LIMIT 1;

SELECT * FROM Usuario ORDER BY NumUso ASC LIMIT 1;

UPDATE Usuario SET Edad = Edad + 10 WHERE ID IN (1, 2, 3);

-- Renombrar la columna en la tabla Usuario
ALTER TABLE Usuario RENAME COLUMN `Email` TO `email`;

-- Renombrar la columna en la tabla Operario
ALTER TABLE Operario RENAME COLUMN `Email` TO `email`;

SELECT * FROM Operario WHERE Edad > 20;


