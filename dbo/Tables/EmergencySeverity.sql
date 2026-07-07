CREATE TABLE [dbo].[EmergencySeverity] (
    [EmergencySeverityId] INT            IDENTITY (1, 1) NOT NULL,
    [SeverityCode]        VARCHAR (20)   NULL,
    [SeverityName]        NVARCHAR (100) NULL,
    [DisplayOrder]        INT            NULL,
    [IsActive]            BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmergencySeverityId] ASC)
);

