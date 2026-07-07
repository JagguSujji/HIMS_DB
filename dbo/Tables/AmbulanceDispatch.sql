CREATE TABLE [dbo].[AmbulanceDispatch] (
    [DispatchId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientId]    BIGINT         NULL,
    [Location]     NVARCHAR (200) NULL,
    [Status]       NVARCHAR (50)  NULL,
    [DispatchedOn] DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([DispatchId] ASC)
);

