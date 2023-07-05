USE PnWDB;
GO

CREATE TABLE [daily_militarization] (
	[date] DATE NOT NULL,
	[nation_id] INT NOT NULL,
	[soldiers] INT NOT NULL,
	[soldier_militarization] FLOAT NOT NULL,
	[tanks] INT NOT NULL,
	[tank_militarization] FLOAT NOT NULL,
	[aircraft] SMALLINT NOT NULL,
	[aircraft_militarization] FLOAT NOT NULL,
	[ships] SMALLINT NOT NULL,
	[ship_militarization] FLOAT NOT NULL
)
GO

CREATE TRIGGER [update_military_stats]
ON dbo.militaries
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO daily_militarization
	SELECT FORMAT(GETDATE(),'yyyy-MM-dd') AS date, i.nation_id AS nation_id,
		i.soldiers AS soldiers,
		i.soldiers * 1.0 / (3000 * 5 * n.cities) AS soldier_militarization,
		i.tanks AS tanks,
		i.tanks * 1.0 / (250 * 5 * n.cities) AS tank_militarization,
		i.aircraft AS aircraft,
		i.aircraft * 1.0 / (15 * 5 * n.cities) AS aircraft_militarization,
		i.ships AS ships,
		i.ships * 1.0 / (5 * 3 * n.cities) AS ship_militarization
	FROM inserted i
	JOIN nations n
		ON i.nation_id = n.nation_id
END;
GO

CREATE VIEW [nations_tformed] AS
SELECT nation_id,
	color_id, 
	alliance_id, 
	nation_name,  
	cities, 
	nation_score, 
	last_active
FROM nations
WHERE position_id <> 1 AND vacation_mode_turns = 0;
GO

CREATE VIEW [militarization] AS
SELECT m.date, 
	m.nation_id,
	m.soldiers,
	m.soldier_militarization,
	m.tanks,
	m.tank_militarization,
	m.aircraft,
	m.aircraft_militarization,
	m.ships,
	m.ship_militarization
FROM daily_militarization m
JOIN nations n 
	ON m.nation_id = n.nation_id
WHERE n.position_id <> 1 AND vacation_mode_turns = 0;
GO

CREATE VIEW [treaties_tformed] AS
SELECT treaty_id, a1.alliance_name AS sending_alliance, a2.alliance_name AS receiving_alliance
FROM treaties t
JOIN alliances a1 
	ON t.sending_alliance_id = a1.alliance_id
JOIN alliances a2 
	ON t.receiving_alliance_id = a2.alliance_id
WHERE t.treaty_type = 'MDP' OR t.treaty_type = 'MDoAP' OR t.treaty_type = 'Protectorate';
