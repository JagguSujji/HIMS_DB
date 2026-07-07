CREATE TABLE [dbo].[ShiftHandoverNote] (
    [HandoverId]  INT            NOT NULL,
    [FromNurseId] INT            NULL,
    [ToNurseId]   INT            NULL,
    [Notes]       NVARCHAR (MAX) NULL,
    [ShiftDate]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([HandoverId] ASC)
);

