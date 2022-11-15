-- Select the i124 database
USE i124;
GO

-- Check if table exist then only, delete it
IF OBJECT_ID('dbo.[COM_ProjectMaster]', 'u') IS NOT NULL
	DROP TABLE [dbo].[COM_ProjectMaster];
GO

-- Create the table again
CREATE TABLE COM_ProjectMaster (
    ProjectCode VARCHAR(6) NOT NULL PRIMARY KEY,
	CustomerName VARCHAR(50) NOT NULL,
	ProjectModules VARCHAR(50) NULL DEFAULT NULL,
	createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
GO

INSERT INTO [dbo].[COM_ProjectMaster] (ProjectCode, CustomerName) VALUES ('I124', 'Armstrong Machine Builders Pvt Ltd');
GO
