CREATE TABLE [dbo].[Permission] (
    [PermissionId]   INT            IDENTITY (1, 1) NOT NULL,
    [ModuleName]     VARCHAR (50)   NOT NULL,
    [ScreenName]     VARCHAR (100)  NOT NULL,
    [ActionName]     VARCHAR (30)   NOT NULL,
    [PermissionCode] VARCHAR (100)  NOT NULL,
    [Description]    NVARCHAR (300) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]      INT            NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [RowVersion]     ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([PermissionId] ASC),
    UNIQUE NONCLUSTERED ([PermissionCode] ASC)
);

