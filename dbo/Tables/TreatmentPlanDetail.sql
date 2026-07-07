CREATE TABLE [dbo].[TreatmentPlanDetail] (
    [TreatmentPlanDetailId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [CarePlanId]            BIGINT         NOT NULL,
    [Activity]              NVARCHAR (255) NULL,
    [StartDate]             DATE           NULL,
    [EndDate]               DATE           NULL,
    [Status]                NVARCHAR (50)  NULL,
    [Notes]                 NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([TreatmentPlanDetailId] ASC)
);

