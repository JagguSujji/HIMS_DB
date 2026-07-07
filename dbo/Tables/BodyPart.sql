CREATE TABLE [dbo].[BodyPart] (
    [BodyPartId]       INT            IDENTITY (1, 1) NOT NULL,
    [BodyPartCode]     VARCHAR (20)   NULL,
    [BodyPartName]     NVARCHAR (100) NULL,
    [ParentBodyPartId] INT            NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BodyPartId] ASC),
    FOREIGN KEY ([ParentBodyPartId]) REFERENCES [dbo].[BodyPart] ([BodyPartId]),
    UNIQUE NONCLUSTERED ([BodyPartCode] ASC)
);

