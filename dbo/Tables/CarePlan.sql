CREATE TABLE [dbo].[CarePlan] (
    [CarePlanId]  INT            NOT NULL,
    [PatientId]   INT            NULL,
    [PlanText]    NVARCHAR (MAX) NULL,
    [StartDate]   DATE           NULL,
    [EndDate]     DATE           NULL,
    [PlanName]    VARCHAR (50)   NULL,
    [EncounterId] INT            NULL,
    [CreatedOn]   DATETIME2 (7)  NULL,
    [CreatedBy]   VARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([CarePlanId] ASC)
);

