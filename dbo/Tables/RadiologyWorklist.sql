CREATE TABLE [dbo].[RadiologyWorklist] (
    [WorklistId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [RadiologyOrderId] BIGINT        NOT NULL,
    [AssignedTo]       BIGINT        NULL,
    [Priority]         NVARCHAR (50) NULL,
    [Status]           NVARCHAR (50) NULL,
    [CreatedOn]        DATETIME2 (7) DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([WorklistId] ASC)
);

