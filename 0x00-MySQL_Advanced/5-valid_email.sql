-- create trigger to update email validation
DROP TRIGGER IF EXISTS validate;
DELIMITER $$;
CREATE TRIGGER validate BEFORE UPDATE
    ON users FOR EACH ROW
    BEGIN
        IF !(NEW.email <=> OLD.email) THEN
            SET NEW.valid_email = 0;
        END IF;
    END;
DELIMITER ;$$
