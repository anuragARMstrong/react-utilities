CREATE TABLE ASRSPALLET (
    [Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectCode] [nvarchar](6) NOT NULL,
    [ProjectLocationId] [int] NOT NULL,
    [PalletBarcode] [nvarchar](20) NOT NULL,
);