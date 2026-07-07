CREATE TABLE [dbo].[Bed] (
    [BedId]         INT            IDENTITY (1, 1) NOT NULL,
    [RoomId]        INT            NOT NULL,
    [BedCode]       VARCHAR (20)   NOT NULL,
    [BedNumber]     VARCHAR (20)   NOT NULL,
    [BedTypeId]     INT            NULL,
    [BedStatusId]   INT            NOT NULL,
    [IsOccupied]    BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]      BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]       NVARCHAR (500) NULL,
    [CreatedBy]     INT            NULL,
    [CreatedOn]     DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [ModifiedBy]    INT            NULL,
    [ModifiedOn]    DATETIME2 (7)  NULL,
    [RowVersion]    ROWVERSION     NOT NULL,
    [FloorId]       BIGINT         NULL,
    [LastCleanedOn] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([BedId] ASC),
    FOREIGN KEY ([BedStatusId]) REFERENCES [dbo].[BedStatus] ([BedStatusId]),
    FOREIGN KEY ([BedTypeId]) REFERENCES [dbo].[BedType] ([BedTypeId]),
    CONSTRAINT [FK_Bed_Room] FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Room] ([RoomId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bed_Code]
    ON [dbo].[Bed]([RoomId] ASC, [BedCode] ASC);

