USE i124;
GO

IF OBJECT_ID('dbo.[UM_User_X_Role]', 'u') IS NOT NULL
    DROP TABLE [dbo].[UM_User_X_Role];
GO


CREATE TABLE UM_User_X_Role (
    Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    RoleId INT NOT NULL FOREIGN KEY REFERENCES [dbo].[UM_Role](Id),
    UserId INT NOT NULL FOREIGN KEY REFERENCES [dbo].[UM_User](Id),
    CreatedBy INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    LastUpdatedBy int DEFAULT NULL,
    LastUpdatedAt DATETIME DEFAULT NULL
);
GO

INSERT INTO [dbo].[UM_User_X_Role](RoleId, UserId, CreatedBy)VALUES(1,1,1);
GO
