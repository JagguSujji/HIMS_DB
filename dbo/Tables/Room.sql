CREATE TABLE [dbo].[Room] (
    [RoomId]          INT             IDENTITY (1, 1) NOT NULL,
    [FloorId]         INT             NOT NULL,
    [RoomCode]        VARCHAR (20)    NOT NULL,
    [RoomNumber]      VARCHAR (20)    NOT NULL,
    [RoomName]        NVARCHAR (200)  NULL,
    [RoomTypeId]      INT             NULL,
    [Capacity]        INT             NULL,
    [ChargePerDay]    DECIMAL (18, 2) NULL,
    [IsIsolationRoom] BIT             DEFAULT ((0)) NOT NULL,
    [IsActive]        BIT             DEFAULT ((1)) NOT NULL,
    [Remarks]         NVARCHAR (500)  NULL,
    [CreatedBy]       INT             NULL,
    [CreatedOn]       DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [ModifiedBy]      INT             NULL,
    [ModifiedOn]      DATETIME2 (7)   NULL,
    [RowVersion]      ROWVERSION      NOT NULL,
    [WardId]          INT             NULL,
    PRIMARY KEY CLUSTERED ([RoomId] ASC),
    CONSTRAINT [FK_Room_Floor] FOREIGN KEY ([FloorId]) REFERENCES [dbo].[Floor] ([FloorId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Room_Code]
    ON [dbo].[Room]([FloorId] ASC, [RoomCode] ASC);

