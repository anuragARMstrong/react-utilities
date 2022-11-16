USE i124;
GO

-- Check if table exist then only, delete it
IF OBJECT_ID('dbo.[COM_ProjectLocationMaster]', 'u') IS NOT NULL
	DROP TABLE [dbo].[COM_ProjectLocationMaster];
GO

CREATE TABLE COM_ProjectLocationMaster (
    ProjectLocationId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(50) NOT NULL,
    ProjectCode VARCHAR(6) NOT NULL FOREIGN KEY REFERENCES [dbo].[COM_ProjectMaster](ProjectCode) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

INSERT INTO [dbo].[COM_ProjectLocationMaster] (LocationName, ProjectCode) VALUES('Plant 2, Sogras', 'I124');