-- create trigger to update email validation
DROP TRIGGER IF EXISTS validate;
CREATE TRIGGER IF NOT EXISTS validate
    BEFORE UPDATE ON users
    FOR EACH ROW
    BEGIN
        IF OLD.email != NEW.email THEN
            SET NEW.valid_email = false;
        END IF;
    END