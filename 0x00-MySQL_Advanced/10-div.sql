-- create a function safeDiv
DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(
    a INT,
    b INT
) RETURNS FLOAT DETERMINISTIC READS SQL DATA
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a/b;
    END IF;
END;

