-- create trigger to update email validation
CREATE TRIGGER validate AFTER UPDATE ON users
    FOR EACH ROW
    UPDATE users SET valid_email = default
