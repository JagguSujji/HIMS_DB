CREATE TABLE [dbo].[RoleMenu] (
    [RoleMenuId] INT IDENTITY (1, 1) NOT NULL,
    [RoleId]     INT NULL,
    [MenuId]     INT NULL,
    PRIMARY KEY CLUSTERED ([RoleMenuId] ASC)
);

