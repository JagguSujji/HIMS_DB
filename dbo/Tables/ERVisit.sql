CREATE TABLE [dbo].[ERVisit] (
    [ERVisitId]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [PatientId]     BIGINT        NULL,
    [ArrivalTime]   DATETIME2 (7) NULL,
    [SeverityLevel] NVARCHAR (50) NULL,
    [Status]        NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ERVisitId] ASC)
);

