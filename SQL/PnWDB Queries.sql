USE PnWDB;
GO

CREATE TRIGGER [update_military_stats]
ON dbo.nations
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO daily_militarization
	SELECT FORMAT(GETDATE(),'yyyy-MM-dd') AS date, nation_id,
		soldiers * 1.0 / (3000 * 5 * cities) AS soldier_militarization,
		tanks * 1.0 / (250 * 5 * cities) AS tank_militarization,
		aircraft * 1.0 / (15 * 5 * cities) AS plane_militarization,
		ships * 1.0 / (5 * 3 * cities) AS ship_militarization
	FROM inserted
END;
GO

CREATE VIEW [nations_tformed] AS
SELECT nation_id, 
	nation_name, 
	leader_name, 
	cities, 
	color_bloc, 
	nation_score, 
	alliance_id, 
	soldiers, 
	tanks, 
	aircraft, 
	ships,
	last_active
FROM nations
WHERE alliance_position <> 'APPLICANT' AND vm_turns = 0;
GO

CREATE VIEW [militarization] AS
SELECT m.date, 
	m.nation_id, 
	m.soldier_militarization, 
	m.tank_militarization, 
	m.plane_militarization, 
	m.ship_militarization
FROM daily_militarization m
JOIN nations n 
	ON m.nation_id = n.alliance_id
WHERE n.alliance_position <> 'APPLICANT' AND vm_turns = 0;
GO

CREATE VIEW [cities_tformed] AS
SELECT c.city_id, c.city_name, c.nation_id, c.infrastructure
FROM cities c
JOIN nations n
	ON c.nation_id = n.nation_id
WHERE alliance_position <> 'APPLICANT' AND vm_turns = 0;
GO
