CREATE TABLE [dbo].[AppointmentSlotStatus] (
    [SlotStatusId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [StatusCode]   VARCHAR (30)  NOT NULL,
    [StatusName]   VARCHAR (100) NOT NULL,
    [IsActive]     BIT           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([SlotStatusId] ASC)
);

