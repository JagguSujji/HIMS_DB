CREATE TABLE [dbo].[CommunicationType] (
    [CommunicationTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [CommunicationTypeCode] VARCHAR (20)   NULL,
    [CommunicationTypeName] NVARCHAR (100) NULL,
    [IsElectronic]          BIT            NULL,
    [IsActive]              BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([CommunicationTypeId] ASC)
);

