CREATE TABLE [dbo].[Visit] (
    [VisitId]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [PatientId]          BIGINT        NULL,
    [VisitDate]          DATETIME      NULL,
    [VisitType]          VARCHAR (50)  NULL,
    [VisitStatusId]      INT           NULL,
    [DoctorId]           INT           NULL,
    [DepartmentId]       INT           NULL,
    [ChiefComplaintId]   INT           NULL,
    [TriageLevelId]      INT           NULL,
    [VisitSource]        NVARCHAR (50) NULL,
    [ChiefComplaintText] VARCHAR (500) NULL,
    [CheckInTime]        DATETIME      NULL,
    [CheckOutTime]       DATETIME      NULL,
    [EpisodeId]          BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([VisitId] ASC)
);

