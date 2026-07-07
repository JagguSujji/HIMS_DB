CREATE TABLE [dbo].[DrugScheduleType] (
    [DrugScheduleTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [ScheduleCode]       VARCHAR (20)   NULL,
    [ScheduleName]       NVARCHAR (100) NULL,
    [Description]        NVARCHAR (300) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DrugScheduleTypeId] ASC)
);

