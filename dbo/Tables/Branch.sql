CREATE TABLE [dbo].[Branch] (
    [BranchId]     INT            IDENTITY (1, 1) NOT NULL,
    [HospitalId]   INT            NOT NULL,
    [BranchCode]   VARCHAR (20)   NOT NULL,
    [BranchName]   NVARCHAR (200) NOT NULL,
    [PhoneNumber]  VARCHAR (20)   NULL,
    [EmailAddress] VARCHAR (100)  NULL,
    [AddressLine1] NVARCHAR (200) NULL,
    [AddressLine2] NVARCHAR (200) NULL,
    [City]         NVARCHAR (100) NULL,
    [State]        NVARCHAR (100) NULL,
    [Country]      NVARCHAR (100) NULL,
    [ZipCode]      VARCHAR (20)   NULL,
    [IsMainBranch] BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]     BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]      NVARCHAR (500) NULL,
    [CreatedBy]    INT            NULL,
    [CreatedOn]    DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]   INT            NULL,
    [ModifiedOn]   DATETIME2 (7)  NULL,
    [RowVersion]   ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([BranchId] ASC),
    CONSTRAINT [FK_Branch_Hospital] FOREIGN KEY ([HospitalId]) REFERENCES [dbo].[Hospital] ([HospitalId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Branch_Code]
    ON [dbo].[Branch]([HospitalId] ASC, [BranchCode] ASC);

