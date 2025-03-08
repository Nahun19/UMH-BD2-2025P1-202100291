
CREATE DATABASE IF NOT EXISTS AhorroDB;
USE AhorroDB;


CREATE TABLE IF NOT EXISTS SimulacionAhorro (
    NumeroMes INT,
    MontoAhorrado DECIMAL(10,2),
    SaldoAcumulado DECIMAL(10,2)
);


DROP PROCEDURE IF EXISTS SimuladorAhorro;

DELIMITER $$

CREATE PROCEDURE SimuladorAhorro(IN monto DECIMAL(10,2), IN meses INT)
BEGIN
  
    DECLARE i INT DEFAULT 1;
    DECLARE saldo DECIMAL(10,2) DEFAULT 0;
    
    
    DELETE FROM SimulacionAhorro;
    
   
    WHILE i <= meses DO
        SET saldo = saldo + monto;
        
        INSERT INTO SimulacionAhorro (NumeroMes, MontoAhorrado, SaldoAcumulado)
        VALUES (i, monto, saldo);
        
        SET i = i + 1;
    END WHILE;
    
   
    SELECT * FROM SimulacionAhorro;
END $$

DELIMITER ;


CALL SimuladorAhorro(500, 6);
