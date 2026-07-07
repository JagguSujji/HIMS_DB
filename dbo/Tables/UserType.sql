CREATE TABLE [dbo].[UserType] (
    [UserTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [UserTypeCode] VARCHAR (20)   NOT NULL,
    [UserTypeName] NVARCHAR (100) NOT NULL,
    [Description]  NVARCHAR (300) NULL,
    [IsActive]     BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]    INT            NULL,
    [CreatedOn]    DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   INT            NULL,
    [ModifiedOn]   DATETIME2 (7)  NULL,
    [RowVersion]   ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([UserTypeId] ASC),
    UNIQUE NONCLUSTERED ([UserTypeCode] ASC)
);

