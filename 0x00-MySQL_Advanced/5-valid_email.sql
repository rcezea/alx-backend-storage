-- create trigger to update email validation
CREATE TRIGGER validate AFTER UPDATE ON users
    FOR EACH ROW
    BEGIN
    IF OLD.email != NEW.email THEN
    UPDATE users SET valid_email = DEFAULT WHERE id = NEW.id;
    END IF;
    END