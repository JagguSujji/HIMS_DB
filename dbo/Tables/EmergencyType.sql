CREATE TABLE [dbo].[EmergencyType] (
    [EmergencyTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [EmergencyTypeCode] VARCHAR (20)   NULL,
    [EmergencyTypeName] NVARCHAR (100) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmergencyTypeId] ASC)
);

