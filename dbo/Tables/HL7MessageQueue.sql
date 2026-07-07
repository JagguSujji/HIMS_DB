CREATE TABLE [dbo].[HL7MessageQueue] (
    [MessageId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [MessageType] NVARCHAR (50)  NULL,
    [Payload]     NVARCHAR (MAX) NULL,
    [Status]      NVARCHAR (50)  NULL,
    [CreatedOn]   DATETIME2 (7)  DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([MessageId] ASC)
);

