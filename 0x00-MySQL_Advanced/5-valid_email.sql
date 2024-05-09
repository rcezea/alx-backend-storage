-- create trigger to update email validation
DROP TRIGGER IF EXISTS validate;
CREATE TRIGGER IF NOT EXISTS validate
    AFTER UPDATE ON users
    FOR EACH ROW
    BEGIN
        IF OLD.email != NEW.email THEN
            UPDATE users SET valid_email = false WHERE id = OLD.id;
        END IF;
    END