CREATE TABLE [dbo].[Designation] (
    [DesignationId]   INT            IDENTITY (1, 1) NOT NULL,
    [DesignationCode] VARCHAR (20)   NOT NULL,
    [DesignationName] NVARCHAR (100) NOT NULL,
    [DisplayOrder]    INT            DEFAULT ((1)) NULL,
    [IsClinical]      BIT            DEFAULT ((0)) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    [CreatedBy]       INT            NULL,
    [CreatedOn]       DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]      INT            NULL,
    [ModifiedOn]      DATETIME2 (7)  NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([DesignationId] ASC),
    UNIQUE NONCLUSTERED ([DesignationCode] ASC)
);

