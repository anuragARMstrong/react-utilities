USE i124;
GO

IF OBJECT_ID('dbo.[ASRSLocation]', 'u') IS NOT NULL
    DROP TABLE [dbo].[ASRSLocation];
GO

CREATE TABLE ASRSLocation (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ProjectCode VARCHAR(6),
	ProjectLocationId INT NOT NULL FOREIGN KEY REFERENCES [dbo].[COM_ProjectLocationMaster](ProjectLocationId)ON DELETE CASCADE ON UPDATE CASCADE ,
	Zone CHAR(2) DEFAULT '01',
	SkuId INT DEFAULT NULL,-- Add a FK later after defining SKU schema
	LocationId VARCHAR(21) NOT NULL UNIQUE,
	Side CHAR(1) NOT NULL CHECK(Side = 'L' OR Side = 'R'),
	[Level] INT NOT NULL,
	[Column] INT NOT NULL,
	Deep INT NOT NULL,
	Aisle INT DEFAULT 1,
	Raster INT DEFAULT 1,
	Position INT DEFAULT 1,
	PalletBarcode VARCHAR(20) DEFAULT NULL,
	ReservedPalletBarcode VARCHAR(20) DEFAULT NULL,
	StoredAt DATETIME DEFAULT NULL,
	RetrievedAt DATETIME DEFAULT NULL,
	ReservedAt DATETIME DEFAULT NULL,
	LocationStatus CHAR(1) DEFAULT 'A' CHECK(
		LocationStatus = 'X' OR -- Permanently Blocked
		LocationStatus = 'A' OR -- Available
		LocationStatus = 'B' OR -- Blocke by user temporarily
		LocationStatus = 'H' OR -- On Hold, for retrieval QC rejected pallets
		LocationStatus = 'O' OR -- Occupied
		LocationStatus = 'R' OR -- Reserved for storage
		LocationStatus = 'S' OR -- Reserverd for Reshuffling
		LocationStatus = 'E' -- Reserved for Empty pallets
	),
	MovingCategory CHAR(1) DEFAULT 'M' CHECK(
		MovingCategory = 'F' OR -- Fast moving
		MovingCategory = 'S' OR -- Slow Moving
		MovingCategory = 'M' -- Mendium Moving
	),
	[Rank] INT NOT NULL,
	MaxWeight INT NULL DEFAULT NULL,
	IsFull SMALLINT DEFAULT 0,
	CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	UpdatedAt DATETIME DEFAULT NULL,
	Custom1 VARCHAR(100) DEFAULT NULL,
	Custom2 VARCHAR(100) DEFAULT NULL,
	Custom3 VARCHAR(100) DEFAULT NULL,
	Custom4 VARCHAR(100) DEFAULT NULL,
	Custom5 VARCHAR(100) DEFAULT NULL
);
GO

-- There will be a sperate seeding script for location table