CREATE TABLE [dbo].[TriageLevel] (
    [TriageLevelId]         INT            IDENTITY (1, 1) NOT NULL,
    [TriageCode]            VARCHAR (20)   NOT NULL,
    [TriageName]            NVARCHAR (100) NOT NULL,
    [DisplayColor]          VARCHAR (20)   NULL,
    [PriorityOrder]         INT            NULL,
    [TargetResponseMinutes] INT            NULL,
    [IsActive]              BIT            DEFAULT ((1)) NULL,
    [CreatedOn]             DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([TriageLevelId] ASC),
    UNIQUE NONCLUSTERED ([TriageCode] ASC)
);

