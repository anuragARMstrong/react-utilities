USE i124;
GO

IF OBJECT_ID('dbo.[ASRS_Pallet]', 'u') IS NOT NULL
    DROP TABLE [dbo].[ASRS_Pallet];
GO


CREATE TABLE ASRS_Pallet (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ProjectCode VARCHAR(6) NOT NULL,
    ProjectLocationId INT NOT NULL FOREIGN KEY REFERENCES [dbo].[COM_ProjectLocationMaster](ProjectLocationId)ON DELETE CASCADE ON UPDATE CASCADE,
    PalletBarcode VARCHAR(20) NOT NULL,
    [Status] CHAR(2) NOT NULL CHECK(
		[Status]='RG' OR -- Registered
		[Status]='PC' OR -- Profile Check
		[Status]='IT' OR -- In Transit
		[Status]='SI' OR -- Stored In
		[Status]='PR' OR -- Profile Reject
		[Status]='SO' OR -- Stored Out
		[Status]='RS' OR -- Reserved
		[Status]='EM' OR -- Empty
		[Status]='OP' -- Out For Partial Picking
	),
	OpType CHAR(1) NOT NULL CHECK(
		OpType='I' OR -- Inbound operation
		OpType='O' OR -- Outbound operation
		OpType='R' -- Reshuffling operation
	),
	IsFull TINYINT CHECK(IsFull=0 OR IsFull=1) DEFAULT 1,
	FilledPercentage INT NOT NULL DEFAULT 100,
	ASRSLocation VARCHAR(30) DEFAULT NULL,
	Quantity INT NOT NULL DEFAULT 0,
	GrossWeight INT DEFAULT NULL,
	CalculatedWeight INT DEFAULT NULL,
	CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    UpdatedAt DATETIME DEFAULT NULL,
	Custom1 VARCHAR(100) DEFAULT NULL,
	Custom2 VARCHAR(100) DEFAULT NULL,
	Custom3 VARCHAR(100) DEFAULT NULL,
	Custom4 VARCHAR(100) DEFAULT NULL,
	Custom5 VARCHAR(100) DEFAULT NULL
);
GO