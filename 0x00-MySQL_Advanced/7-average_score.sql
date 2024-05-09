DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE scores FLOAT;
    SELECT SUM(corrections.score)/COUNT(corrections.score) INTO scores FROM corrections WHERE corrections.user_id = user_id;
    UPDATE users SET average_score = scores WHERE users.id = user_id;
END $$;
DELIMITER ;$$
