USE i124;
GO

IF OBJECT_ID('dbo.[UM_Role]', 'u') IS NOT NULL
    DROP TABLE [dbo].[UM_Role];
GO


CREATE TABLE UM_Role (
    Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL UNIQUE,
    [Description] VARCHAR(100) NULL DEFAULT NULL,
    IsActive TINYINT NOT NULL CHECK(isActive=0 OR isActive=1) DEFAULT 1 ,
    CreatedBy int NOT NULL FOREIGN KEY REFERENCES [dbo].[UM_User](Id) ON DELETE CASCADE ON UPDATE CASCADE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    LastUpdatedBy int DEFAULT NULL,
    LastUpdatedAt DATETIME DEFAULT NULL,
);
GO

INSERT INTO UM_Role (RoleName,CreatedBy)
VALUES ('admin',1);
INSERT INTO UM_Role (RoleName,CreatedBy)
VALUES ('supervisor',1);
INSERT INTO UM_Role (RoleName,CreatedBy)
VALUES ('operator',1);

