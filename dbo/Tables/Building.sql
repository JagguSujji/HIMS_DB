CREATE TABLE [dbo].[Building] (
    [BuildingId]     INT            IDENTITY (1, 1) NOT NULL,
    [BranchId]       INT            NOT NULL,
    [BuildingCode]   VARCHAR (20)   NOT NULL,
    [BuildingName]   NVARCHAR (200) NOT NULL,
    [Description]    NVARCHAR (500) NULL,
    [NumberOfFloors] INT            NULL,
    [IsActive]       BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]        NVARCHAR (500) NULL,
    [CreatedBy]      INT            NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]     INT            NULL,
    [ModifiedOn]     DATETIME2 (7)  NULL,
    [RowVersion]     ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([BuildingId] ASC),
    CONSTRAINT [FK_Building_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Building_Code]
    ON [dbo].[Building]([BranchId] ASC, [BuildingCode] ASC);

