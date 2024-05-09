-- create trigger to update email validation
CREATE TRIGGER validate AFTER UPDATE ON users
    FOR EACH ROW
    IF OLD.email != NEW.email THEN
    UPDATE users SET valid_email = 0 WHERE id = NEW.id;
    END IF
