-- Generate script to add Driver_id column
SELECT CONCAT('ALTER TABLE ', table_name , ' ADD COLUMN Driver_id INT;')
FROM information_schema.tables
WHERE table_schema = '2018_f1_season'
  AND table_name IN ('driver', 'fastest_pitstops','laps_led', 
					 'laps_per_pos', 'penalties', 'pit_stop',
                     'pos_change_lap_one', 'q1q2q3', 'qualifying',
                     'qualifying_sessions', 'retirements', 'start_and_fin'
                     'start_position', 'teammate_comparison', 'tyres');
-- Generate script to create relationships
SELECT CONCAT('ALTER TABLE ', table_name, ' ADD CONSTRAINT fk_', table_name,
			  ' FOREIGN KEY (Driver_id) REFERENCES driver_team(Driver_id);')
FROM information_schema.tables
WHERE table_schema = '2018_f1_season'
  AND table_name IN ('driver', 'fastest_pitstops','laps_led', 
					 'laps_per_pos', 'penalties', 'pit_stop',
                     'pos_change_lap_one', 'q1q2q3', 'qualifying',
                     'qualifying_sessions', 'retirements', 'start_and_fin'
                     'start_position', 'teammate_comparison', 'tyres');
                     
-- Generate script to populate the column                     
SELECT CONCAT('UPDATE ', table_name, ' INNER JOIN driver_team  SET ', table_name,'.Driver_id = driver_team.Driver_id
			   WHERE ', table_name,'.Driver_id IS NULL AND ', table_name,'.Driver = driver_team.Driver;')
FROM information_schema.tables
WHERE table_schema = '2018_f1_season'
  AND table_name IN ('driver', 'laps_led', 
					 'laps_per_pos', 'penalties', 'pit_stop',
                     'pos_change_lap_one', 'q1q2q3', 'qualifying',
                     'qualifying_sessions', 'retirements', 'start_and_fin'
                     'start_position', 'teammate_comparison', 'tyres');
                     

