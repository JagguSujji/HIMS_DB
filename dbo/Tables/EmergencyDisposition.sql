CREATE TABLE [dbo].[EmergencyDisposition] (
    [EmergencyDispositionId] INT            IDENTITY (1, 1) NOT NULL,
    [DispositionCode]        VARCHAR (20)   NULL,
    [DispositionName]        NVARCHAR (100) NULL,
    [IsActive]               BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmergencyDispositionId] ASC)
);

