-- create trigger to update email validation
DROP TRIGGER IF EXISTS validate;
CREATE TRIGGER IF NOT EXISTS validate
    AFTER UPDATE ON users
    FOR EACH ROW
    BEGIN
        IF !(NEW.email <=> OLD.email) THEN
            UPDATE users SET NEW.valid_email = 0 WHERE id = OLD.id;
        END IF;
    END