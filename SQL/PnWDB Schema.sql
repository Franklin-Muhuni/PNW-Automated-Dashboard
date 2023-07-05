USE PnWDB;
GO

CREATE TABLE [alliances] (
  [alliance_id] SMALLINT PRIMARY KEY NOT NULL,
  [alliance_name] VARCHAR(100) NOT NULL
)
GO

CREATE TABLE [alliance_positions] (
  [position_id] SMALLINT PRIMARY KEY NOT NULL,
  [position] VARCHAR(50) NOT NULL
)
GO

CREATE TABLE [color_blocs] (
  [color_id] SMALLINT PRIMARY KEY NOT NULL,
  [color] VARCHAR(50) NOT NULL
)
GO

CREATE TABLE [militaries] (
  [nation_id] INT PRIMARY KEY NOT NULL,
  [soldiers] INT NOT NULL,
  [tanks] INT NOT NULL,
  [aircraft] SMALLINT NOT NULL,
  [ships] SMALLINT NOT NULL
)
GO

CREATE TABLE [nations] (
  [nation_id] INT NOT NULL,
  [alliance_id] SMALLINT NULL,
  [position_id] SMALLINT NOT NULL,
  [color_id] SMALLINT NOT NULL,
  [nation_name] VARCHAR(100) NOT NULL,
  [cities] SMALLINT NOT NULL,
  [nation_score] FLOAT NOT NULL,
  [vacation_mode_turns] INT NOT NULL,
  [last_active] DATETIME NOT NULL
)
GO

CREATE TABLE [treaties] (
  [treaty_id] INT PRIMARY KEY NOT NULL,
  [sending_alliance_id] SMALLINT NOT NULL,
  [receiving_alliance_id] SMALLINT NOT NULL,
  [treaty_type] VARCHAR(50) NOT NULL
)
GO

ALTER TABLE [nations] ADD FOREIGN KEY ([alliance_id]) REFERENCES [alliances] ([alliance_id])
ALTER TABLE [nations] ADD FOREIGN KEY ([position_id]) REFERENCES [alliance_positions] ([position_id])
ALTER TABLE [nations] ADD FOREIGN KEY ([color_id]) REFERENCES [color_blocs] ([color_id])
ALTER TABLE [nations] ADD FOREIGN KEY ([nation_id]) REFERENCES [militaries] ([nation_id])
ALTER TABLE [treaties] ADD FOREIGN KEY ([sending_alliance_id]) REFERENCES [alliances] ([alliance_id])
ALTER TABLE [treaties] ADD FOREIGN KEY ([receiving_alliance_id]) REFERENCES [alliances] ([alliance_id])
GO
