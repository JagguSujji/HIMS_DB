CREATE TABLE [dbo].[ServiceRequest] (
    [RequestId]   INT           NOT NULL,
    [RequestType] VARCHAR (100) NULL,
    [RequestedBy] INT           NULL,
    [Status]      VARCHAR (50)  NULL,
    [CreatedOn]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RequestId] ASC)
);

