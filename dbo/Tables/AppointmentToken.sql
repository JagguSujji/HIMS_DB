CREATE TABLE [dbo].[AppointmentToken] (
    [TokenId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [AppointmentId] BIGINT        NOT NULL,
    [DoctorId]      BIGINT        NOT NULL,
    [SlotId]        BIGINT        NOT NULL,
    [TokenNumber]   INT           NOT NULL,
    [IssuedOn]      DATETIME2 (7) DEFAULT (getdate()) NULL,
    [Status]        VARCHAR (30)  DEFAULT ('Waiting') NULL,
    PRIMARY KEY CLUSTERED ([TokenId] ASC),
    CONSTRAINT [FK_AppointmentToken_Appointment] FOREIGN KEY ([AppointmentId]) REFERENCES [dbo].[Appointment] ([AppointmentId]),
    CONSTRAINT [FK_AppointmentToken_Provider] FOREIGN KEY ([DoctorId]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_AppointmentToken_Slot] FOREIGN KEY ([SlotId]) REFERENCES [dbo].[AppointmentSlot] ([SlotId])
);

