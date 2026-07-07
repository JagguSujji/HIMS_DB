CREATE TABLE [dbo].[MaintenanceTicket] (
    [TicketId] INT            NOT NULL,
    [Location] VARCHAR (200)  NULL,
    [Issue]    NVARCHAR (MAX) NULL,
    [Status]   VARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([TicketId] ASC)
);

