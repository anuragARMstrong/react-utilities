USE i124;
GO

IF OBJECT_ID('dbo.[UM_RoleMenuAccessRights]', 'u') IS NOT NULL
    DROP TABLE [dbo].[UM_RoleMenuAccessRights];
GO

CREATE TABLE UM_RoleMenuAccessRights (
  	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    RoleId INT NOT NULL FOREIGN KEY REFERENCES [dbo].[UM_Role](Id)ON DELETE CASCADE ON UPDATE CASCADE  ,
    MenuId INT NOT NULL FOREIGN KEY REFERENCES [dbo].[UM_Menu](Id)ON DELETE CASCADE ON UPDATE CASCADE ,
    CanView TINYINT NOT NULL DEFAULT 0,
		CanAdd TINYINT NOT NULL DEFAULT 0,
		CanUpdate TINYINT NOT NULL DEFAULT 0,
		CanDelete TINYINT NOT NULL DEFAULT 0,
		CreatedBy INT NOT NULL,
		CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    LastUpdatedBy INT DEFAULT NULL,
    LastUpdatedAt DATETIME DEFAULT NULL
);
GO

INSERT INTO UM_RoleMenuAccessRights (RoleId,MenuId,CanView,CanAdd,CanUpdate,CanDelete,CreatedBy) VALUES (1,1,1,1,1,1,1);
INSERT INTO UM_RoleMenuAccessRights (RoleId,MenuId,CanView,CanAdd,CanUpdate,CanDelete,CreatedBy) VALUES (1,2,1,1,1,1,1);
INSERT INTO UM_RoleMenuAccessRights (RoleId,MenuId,CanView,CanAdd,CanUpdate,CanDelete,CreatedBy) VALUES (1,3,1,1,1,1,1);
INSERT INTO UM_RoleMenuAccessRights (RoleId,MenuId,CanView,CanAdd,CanUpdate,CanDelete,CreatedBy) VALUES (1,3,1,1,1,1,1);