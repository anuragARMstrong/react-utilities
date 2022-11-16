-- Select the i124 database
USE i124;
GO

-- Check if table exist then only, delete it
IF OBJECT_ID('dbo.[UM_User]', 'u') IS NOT NULL
	DROP TABLE [dbo].[UM_User];
GO


CREATE TABLE UM_User (
    Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) DEFAULT NULL,
    UserName VARCHAR(50) NOT NULL UNIQUE,
    Mobile VARCHAR(15) DEFAULT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    [Password] VARCHAR(256) NOT NULL,
    IsActive TINYINT NOT NULL CHECK(isActive=0 OR isActive=1) DEFAULT 1 ,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    CreatedBy int NOT NULL ,
    LastUpdatedAt DATETIME  DEFAULT NULL,
    LastUpdatedBy int  DEFAULT NULL
);
GO

INSERT INTO UM_User (FName, UserName, Email, [Password], CreatedBy)
VALUES ('admin','admin','admin@gmail.com','admin',1);
GO