CREATE TABLE [dbo].[Floor] (
    [FloorId]     INT            IDENTITY (1, 1) NOT NULL,
    [BuildingId]  INT            NOT NULL,
    [FloorCode]   VARCHAR (20)   NOT NULL,
    [FloorNumber] INT            NOT NULL,
    [FloorName]   NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (300) NULL,
    [IsActive]    BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]     NVARCHAR (500) NULL,
    [CreatedBy]   INT            NULL,
    [CreatedOn]   DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]  INT            NULL,
    [ModifiedOn]  DATETIME2 (7)  NULL,
    [RowVersion]  ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([FloorId] ASC),
    CONSTRAINT [FK_Floor_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Floor_Code]
    ON [dbo].[Floor]([BuildingId] ASC, [FloorCode] ASC);

