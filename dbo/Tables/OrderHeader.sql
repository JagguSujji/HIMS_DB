CREATE TABLE [dbo].[OrderHeader] (
    [OrderId]     INT          NOT NULL,
    [PatientId]   INT          NULL,
    [EncounterId] INT          NULL,
    [OrderType]   VARCHAR (50) NULL,
    [OrderDate]   DATETIME     NULL,
    [Status]      VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC)
);

