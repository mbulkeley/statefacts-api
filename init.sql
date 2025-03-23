-- Create the states table
CREATE TABLE IF NOT EXISTS states (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    abbreviation CHAR(2) NOT NULL UNIQUE,
    capital VARCHAR(100) NOT NULL,
    timezone VARCHAR(50) NOT NULL
);

-- Create the cities table
CREATE TABLE IF NOT EXISTS cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    population INT NOT NULL,
    FOREIGN KEY (state_id) REFERENCES states(id)
);

-- Insert sample state
INSERT INTO states (name, abbreviation, capital, timezone) VALUES
('California', 'CA', 'Sacramento', 'PST'),
('Texas', 'TX', 'Austin', 'CST'),
('New York', 'NY', 'Albany', 'EST');

-- Insert sample cities
INSERT INTO cities (state_id, name, population) VALUES
(1, 'Los Angeles', 3970000),
(1, 'San Diego', 1400000),
(1, 'San Jose', 1030000),
(1, 'San Francisco', 880000),
(1, 'Fresno', 540000),

(2, 'Houston', 2300000),
(2, 'San Antonio', 1500000),
(2, 'Dallas', 1300000),
(2, 'Austin', 1000000),
(2, 'Fort Worth', 960000),

(3, 'New York City', 8400000),
(3, 'Buffalo', 250000),
(3, 'Rochester', 210000),
(3, 'Yonkers', 200000),
(3, 'Syracuse', 150000);
