-- create trigger to update email validation
CREATE TRIGGER validate AFTER UPDATE ON users
    FOR EACH ROW
    UPDATE users SET valid_email = 0 WHERE OLD.email != NEW.email
