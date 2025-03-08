-- Crear base de datos (Opcional, si no tienes una)
CREATE DATABASE IF NOT EXISTS AhorroDB;
USE AhorroDB;

-- Crear tabla para almacenar la simulación de ahorro
CREATE TABLE IF NOT EXISTS SimulacionAhorro (
    NumeroMes INT,
    MontoAhorrado DECIMAL(10,2),
    SaldoAcumulado DECIMAL(10,2)
);

-- Eliminar el procedimiento si ya existe
DROP PROCEDURE IF EXISTS SimuladorAhorro;

DELIMITER $$
-- Crear el procedimiento almacenado
CREATE PROCEDURE SimuladorAhorro(IN monto DECIMAL(10,2), IN meses INT)
BEGIN
    -- Declarar variables
    DECLARE i INT DEFAULT 1;
    DECLARE saldo DECIMAL(10,2) DEFAULT 0;
    
    -- Limpiar la tabla antes de insertar datos
    DELETE FROM SimulacionAhorro;
    
    -- Bucle para calcular los ahorros mensuales
    WHILE i <= meses DO
        SET saldo = saldo + monto;
        
        INSERT INTO SimulacionAhorro (NumeroMes, MontoAhorrado, SaldoAcumulado)
        VALUES (i, monto, saldo);
        
        SET i = i + 1;
    END WHILE;
    
    -- Mostrar los resultados
    SELECT * FROM SimulacionAhorro;
END $$

DELIMITER ;

-- Llamar al procedimiento con un ejemplo
CALL SimuladorAhorro(500, 6);
