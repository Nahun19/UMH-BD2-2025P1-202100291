DELIMITER //

CREATE PROCEDURE sp_upd_currency(
    IN p_tasa DECIMAL(15,6),
    IN p_currency_id INT
)
BEGIN
    -- Validar que la tasa de cambio sea mayor que 0 y no nula, y que el currency_id sea mayor que 0
    IF p_tasa > 0 AND p_tasa IS NOT NULL AND p_currency_id > 0 THEN
        -- Actualizar la tasa de cambio
        UPDATE db_demo.currencies 
        SET exchange_rate = p_tasa 
        WHERE currency_id = p_currency_id;

        -- Confirmar la transacción
        COMMIT;

        -- Mensaje de éxito
        SELECT 'Tasa de cambio actualizada correctamente' AS mensaje;
    ELSE
        -- Mensaje de advertencia
        SELECT 'Advertencia: No se realizó ninguna actualización. Verifique los valores ingresados.' AS mensaje;
    END IF;
END //

DELIMITER ;
