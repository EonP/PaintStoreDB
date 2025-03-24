CREATE OR REPLACE PROCEDURE DiscountInactiveProducts(IN max_discount INT)
    BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE current_pid INT;
        DECLARE current_discount INT;
    
        DECLARE product_cursor CURSOR FOR
            SELECT p_id, COALESCE(discount_pourcentage, 0)
            FROM Product
            WHERE COALESCE(discount_pourcentage, 0) < max_discount;
    
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
        OPEN product_cursor;
    
        FETCH product_cursor INTO current_pid, current_discount;
    
        WHILE done = 0 DO
    
            IF NOT EXISTS (
                SELECT 1
                FROM Contains_purchase cp
                JOIN Purchase pur 
                ON cp.p_id = pur.p_id
                WHERE cp.product_id = current_pid
                    AND pur.p_date >= CURRENT DATE - 6 MONTHS
            ) THEN
                IF (current_discount + 10 > max_discount) THEN
                    SET current_discount = max_discount;
                ELSE 
                    SET current_discount = current_discount + 10;
                END IF;
    
                UPDATE Product
                SET discount_pourcentage = current_discount
                WHERE p_id = current_pid;
            END IF;
    
            FETCH product_cursor INTO current_pid, current_discount;
    
        END WHILE;
    
        CLOSE product_cursor;
    END
    $