-- create trigger to update email validation
DROP TRIGGER IF EXISTS validate;
CREATE TRIGGER IF NOT EXISTS validate
    BEFORE UPDATE ON users
    FOR EACH ROW
    BEGIN
        IF !(NEW.email <=> OLD.email) THEN
            SET NEW.valid_email = 0;
        END IF;
    END
