CREATE TABLE [dbo].[RoleScreen] (
    [RoleScreenId] INT IDENTITY (1, 1) NOT NULL,
    [RoleId]       INT NULL,
    [ScreenId]     INT NULL,
    PRIMARY KEY CLUSTERED ([RoleScreenId] ASC)
);

