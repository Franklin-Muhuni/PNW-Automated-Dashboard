
USE PnWDB;
GO

CREATE TABLE [alliances] (
  [alliance_id] SMALLINT PRIMARY KEY NOT NULL,
  [alliance_name] VARCHAR(100) NOT NULL,
  [members] SMALLINT,
  [founded] DATETIME NOT NULL,
  [color_bloc] VARCHAR(100) NOT NULL,
  [alliance_score] FLOAT NOT NULL
)
GO

CREATE TABLE [nations] (
  [nation_id] INT PRIMARY KEY NOT NULL,
  [nation_name] VARCHAR(100) NOT NULL,
  [leader_name] VARCHAR(100) NOT NULL,
  [cities] SMALLINT NOT NULL,
  [founded] DATETIME NOT NULL,
  [color_bloc] VARCHAR(100) NOT NULL,
  [nation_score] FLOAT NOT NULL,
  [alliance_id] SMALLINT NULL,
  [population] INT NOT NULL,
  [gdp] BIGINT NOT NULL,
  [gni] BIGINT NOT NULL,
  [national_projects] SMALLINT NOT NULL,
  [turns_since_last_city] SMALLINT NOT NULL,
  [turns_since_last_project] SMALLINT NOT NULL,
  [soldiers] INT NOT NULL,
  [tanks] INT NOT NULL,
  [aircraft] SMALLINT NOT NULL,
  [ships] SMALLINT NOT NULL,
  [missiles] SMALLINT NOT NULL,
  [nukes] SMALLINT NOT NULL,
  [wars_won] SMALLINT NOT NULL,
  [wars_lost] SMALLINT NOT NULL,
  [last_active] DATETIME NOT NULL
)
GO

CREATE TABLE [treaties] (
  [treaty_id] INT PRIMARY KEY NOT NULL,
  [treaty_type] VARCHAR(50) NOT NULL,
  [sending_alliance_id] SMALLINT NOT NULL,
  [receiving_alliance_id] SMALLINT NOT NULL,
  [date_signed] DATETIME NOT NULL,
  [turns_left] SMALLINT NOT NULL
)
GO

CREATE TABLE [cities] (
  [city_id] INT PRIMARY KEY NOT NULL,
  [city_name] VARCHAR(100) NOT NULL,
  [nation_name] VARCHAR(100) NOT NULL,
  [nation_id] INT NOT NULL,
  [date_built] DATE NOT NULL,
  [infrastructure] DECIMAL(8,2) NOT NULL,
  [land] DECIMAL(8,2) NOT NULL
)
GO

ALTER TABLE [nations] ADD FOREIGN KEY ([alliance_id]) REFERENCES [alliances] ([alliance_id])
GO

ALTER TABLE [treaties] ADD FOREIGN KEY ([sending_alliance_id]) REFERENCES [alliances] ([alliance_id])
GO

ALTER TABLE [treaties] ADD FOREIGN KEY ([receiving_alliance_id]) REFERENCES [alliances] ([alliance_id])
GO

ALTER TABLE [cities] ADD FOREIGN KEY ([nation_id]) REFERENCES [nations] ([nation_id])
GO