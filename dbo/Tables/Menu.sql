CREATE TABLE [dbo].[Menu] (
    [MenuId]        INT            IDENTITY (1, 1) NOT NULL,
    [MenuCode]      VARCHAR (50)   NULL,
    [MenuName]      NVARCHAR (200) NULL,
    [ParentMenuId]  INT            NULL,
    [ApplicationId] INT            NULL,
    [IsActive]      BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([MenuId] ASC)
);

