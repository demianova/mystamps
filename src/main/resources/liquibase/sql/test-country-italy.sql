--
-- Auto-generated by Maven, based on values from src/main/resources/test/spring/test-data.properties
--

-- Used below as country's owner
INSERT INTO users(id, login, role, name, registered_at, activated_at, hash, salt, email) VALUES
	(3, 'test0', 'USER', 'Italy Country Owner', NOW(), NOW(), '@old_valid_user_password_hash@', '@old_valid_user_password_salt@', 'test0@example.org');

-- Used at least by src/test/robotframework/country/creation/validation.robot
INSERT INTO countries(name, created_at, created_by, updated_at, updated_by) VALUES
	('Italy', NOW(), 3, NOW(), 3);
