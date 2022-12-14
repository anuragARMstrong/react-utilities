USE i124;
GO

IF OBJECT_ID('dbo.[UM_Menu]', 'u') IS NOT NULL
DROP TABLE [dbo].[UM_Menu];
GO

CREATE TABLE UM_Menu (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Label VARCHAR(50) NOT NULL, -- Menu Name
    [Description] VARCHAR(100) NULL DEFAULT NULL, -- Details of the page
    URL VARCHAR(100) NULL DEFAULT NULL, -- URL of the page
    ParentId INT NOT NULL DEFAULT 0, -- It will be the id of parent menu item. It's used for a submenu item. 
    [Sequence] INT NOT NULL UNIQUE, -- At which sequence no this menuItem will show up in the UI
	IsActive TINYINT NOT NULL CHECK(isActive=0 OR isActive=1) DEFAULT 1,
	CreatedBy INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    LastUpdatedBy INT DEFAULT NULL,
    LastUpdatedAt DATETIME DEFAULT NULL,
);
GO

INSERT INTO UM_Menu (Label,[Sequence],CreatedBy) VALUES ('Dashboard',1,1);
INSERT INTO UM_Menu (Label,[Sequence],CreatedBy) VALUES ('InBound', 2, 1);
INSERT INTO UM_Menu (Label,[Sequence],CreatedBy) VALUES ('OutBound', 3, 1);
INSERT INTO UM_Menu (Label,[Sequence],CreatedBy) VALUES ('UserManagement', 4, 1);