CREATE TABLE [dbo].[AppointmentMode] (
    [AppointmentModeId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [ModeCode]          VARCHAR (20)  NULL,
    [ModeName]          VARCHAR (100) NULL,
    [IsActive]          BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AppointmentModeId] ASC)
);

