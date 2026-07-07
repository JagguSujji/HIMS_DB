CREATE TABLE [dbo].[DataAccessPolicy] (
    [PolicyId]  INT            IDENTITY (1, 1) NOT NULL,
    [RoleId]    INT            NULL,
    [TableName] NVARCHAR (100) NULL,
    [CanRead]   BIT            NULL,
    [CanWrite]  BIT            NULL,
    [CanDelete] BIT            NULL,
    PRIMARY KEY CLUSTERED ([PolicyId] ASC)
);

