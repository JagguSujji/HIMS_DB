CREATE TABLE [dbo].[ProblemList] (
    [ProblemId]   INT           NOT NULL,
    [PatientId]   INT           NULL,
    [ICDCode]     VARCHAR (20)  NULL,
    [ProblemName] VARCHAR (200) NULL,
    [Status]      VARCHAR (50)  NULL,
    [OnsetDate]   DATE          NULL,
    PRIMARY KEY CLUSTERED ([ProblemId] ASC)
);

