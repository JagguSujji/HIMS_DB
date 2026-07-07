CREATE TABLE [dbo].[AppointmentType] (
    [AppointmentTypeId]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [AppointmentTypeCode] VARCHAR (20)  NULL,
    [AppointmentTypeName] VARCHAR (100) NULL,
    [DurationMinutes]     INT           NULL,
    [IsActive]            BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AppointmentTypeId] ASC)
);

