-- 
CREATE TABLE driver_team
(
Driver_id INT PRIMARY KEY,
Driver VARCHAR(25),
Team VARCHAR(25)
);

INSERT INTO driver_team (Driver_id, Driver, Team)
VALUES (44, 'Lewis Hamilton', 'Mercedes'),
	   (77, 'Valtteri Bottas', 'Mercedes'),
       (3, 'Daniel Ricciardo', 'Red Bull'),
       (33, 'Max Verstappen', 'Red Bull'),
       (5, 'Sebastian Vettel', 'Ferrari'),
       (7, 'Kimi Raikkonen', 'Ferrari'),
       (11, 'Sergio Perez', 'Force India'),
       (31, 'Esteban Ocon', 'Force India'),
       (18, 'Lance Stroll', 'Williams'),
       (35, 'Sergey Sirotkin', 'Williams'),
       (14, 'Fernando Alonso', 'McLaren'),
       (2, 'Stoffel Vandoorne', 'McLaren'),
       (10, 'Pierre Gasly', 'Toro Rosso'),
       (28, 'Brendon Hartley', 'Toro Rosso'),
       (8, 'Romain Grosjean', 'Haas'),
       (20, 'Kevin Magnussen', 'Haas'),
       (27, 'Nico Hulkenberg', 'Renault'),
       (55, 'Carlos Sainz Jnr', 'Renault'),
       (9, 'Marcus Ericsson', 'Sauber'),
       (16, 'Charles Leclerc', 'Sauber');
       
ALTER TABLE driver ADD COLUMN Driver_id INT;
ALTER TABLE laps_led ADD COLUMN Driver_id INT;
ALTER TABLE penalties ADD COLUMN Driver_id INT;
ALTER TABLE pit_stop ADD COLUMN Driver_id INT;
ALTER TABLE pos_change_lap_one ADD COLUMN Driver_id INT;
ALTER TABLE q1q2q3 ADD COLUMN Driver_id INT;
ALTER TABLE qualifying ADD COLUMN Driver_id INT;
ALTER TABLE qualifying_sessions ADD COLUMN Driver_id INT;
ALTER TABLE retirements ADD COLUMN Driver_id INT;
ALTER TABLE teammate_comparison ADD COLUMN Driver_id INT;
ALTER TABLE tyres ADD COLUMN Driver_id INT;

ALTER TABLE driver ADD CONSTRAINT fk_driver FOREIGN KEY (Driver_id) REFERENCES driver_team (Driver_id);
ALTER TABLE laps_led ADD CONSTRAINT fk_laps_led FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE penalties ADD CONSTRAINT fk_penalties FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE pit_stop ADD CONSTRAINT fk_pit_stop FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE pos_change_lap_one ADD CONSTRAINT fk_pos_change_lap_one FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE q1q2q3 ADD CONSTRAINT fk_q1q2q3 FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE qualifying ADD CONSTRAINT fk_qualifying FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE qualifying_sessions ADD CONSTRAINT fk_qualifying_sessions FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE retirements ADD CONSTRAINT fk_retirements FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE teammate_comparison ADD CONSTRAINT fk_teammate_comparison FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);
ALTER TABLE tyres ADD CONSTRAINT fk_tyres FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);

UPDATE driver INNER JOIN driver_team  SET driver.Driver_id = driver_team.Driver_id
       WHERE driver.Driver_id IS NULL AND driver.Driver = driver_team.Driver;
UPDATE laps_led INNER JOIN driver_team  SET laps_led.Driver_id = driver_team.Driver_id
       WHERE laps_led.Driver_id IS NULL AND laps_led.Driver = driver_team.Driver;
UPDATE penalties INNER JOIN driver_team  SET penalties.Driver_id = driver_team.Driver_id
       WHERE penalties.Driver_id IS NULL AND penalties.Driver = driver_team.Driver;
UPDATE pit_stop INNER JOIN driver_team  SET pit_stop.Driver_id = driver_team.Driver_id
       WHERE pit_stop.Driver_id IS NULL AND pit_stop.Driver = driver_team.Driver;
UPDATE pos_change_lap_one INNER JOIN driver_team  SET pos_change_lap_one.Driver_id = driver_team.Driver_id
       WHERE pos_change_lap_one.Driver_id IS NULL AND pos_change_lap_one.Driver = driver_team.Driver;
UPDATE q1q2q3 INNER JOIN driver_team  SET q1q2q3.Driver_id = driver_team.Driver_id
       WHERE q1q2q3.Driver_id IS NULL AND q1q2q3.Driver = driver_team.Driver;
UPDATE qualifying INNER JOIN driver_team  SET qualifying.Driver_id = driver_team.Driver_id
       WHERE qualifying.Driver_id IS NULL AND qualifying.Driver = driver_team.Driver;
UPDATE qualifying_sessions INNER JOIN driver_team  SET qualifying_sessions.Driver_id = driver_team.Driver_id
       WHERE qualifying_sessions.Driver_id IS NULL AND qualifying_sessions.Driver = driver_team.Driver;
UPDATE retirements INNER JOIN driver_team  SET retirements.Driver_id = driver_team.Driver_id
       WHERE retirements.Driver_id IS NULL AND retirements.Driver = driver_team.Driver;
UPDATE teammate_comparison INNER JOIN driver_team  SET teammate_comparison.Driver_id = driver_team.Driver_id
       WHERE teammate_comparison.Driver_id IS NULL AND teammate_comparison.Driver = driver_team.Driver;
UPDATE tyres INNER JOIN driver_team  SET tyres.Driver_id = driver_team.Driver_id
       WHERE tyres.Driver_id IS NULL AND tyres.Driver = driver_team.Driver;

ALTER TABLE team
MODIFY Team VARCHAR(25);
ALTER TABLE team
ADD PRIMARY KEY (Team(25));
ALTER TABLE fastest_pitstops
MODIFY Team VARCHAR(25);
ALTER TABLE fastest_pitstops
ADD CONSTRAINT fk_team FOREIGN KEY (Team) REFERENCES team (Team);
ALTER TABLE driver_team
ADD CONSTRAINT fk_dteam FOREIGN KEY (Team) REFERENCES team (Team);