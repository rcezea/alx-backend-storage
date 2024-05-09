-- create a procedure AddBonus
DROP PROCEDURE IF EXISTS AddBonus;
CREATE PROCEDURE AddBonus(
    IN users_id INT,
    IN project_name VARCHAR(255),
    IN scores INT
)
BEGIN
    INSERT INTO corrections(user_id,project_id, score) VALUES (users_id,(SELECT id AS new FROM projects WHERE project_name = name), scores);
END;