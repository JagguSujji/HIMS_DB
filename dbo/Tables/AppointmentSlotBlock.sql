CREATE TABLE [dbo].[AppointmentSlotBlock] (
    [BlockId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [DoctorId]  BIGINT         NOT NULL,
    [BlockDate] DATE           NOT NULL,
    [StartTime] TIME (7)       NOT NULL,
    [EndTime]   TIME (7)       NOT NULL,
    [Reason]    NVARCHAR (500) NULL,
    [CreatedBy] BIGINT         NULL,
    [CreatedOn] DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([BlockId] ASC),
    CONSTRAINT [FK_AppointmentSlotBlock_Provider] FOREIGN KEY ([DoctorId]) REFERENCES [dbo].[Provider] ([ProviderId])
);

