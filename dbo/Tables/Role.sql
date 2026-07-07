CREATE TABLE [dbo].[Role] (
    [RoleId]       INT            IDENTITY (1, 1) NOT NULL,
    [RoleCode]     VARCHAR (30)   NOT NULL,
    [RoleName]     NVARCHAR (100) NOT NULL,
    [Description]  NVARCHAR (300) NULL,
    [DisplayOrder] INT            DEFAULT ((1)) NOT NULL,
    [IsSystemRole] BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]     BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]    INT            NULL,
    [CreatedOn]    DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]   INT            NULL,
    [ModifiedOn]   DATETIME2 (7)  NULL,
    [RowVersion]   ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([RoleId] ASC),
    UNIQUE NONCLUSTERED ([RoleCode] ASC)
);

