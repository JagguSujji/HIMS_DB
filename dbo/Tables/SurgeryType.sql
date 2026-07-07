CREATE TABLE [dbo].[SurgeryType] (
    [SurgeryTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [SurgeryTypeCode] VARCHAR (20)   NULL,
    [SurgeryTypeName] NVARCHAR (100) NULL,
    [IsEmergency]     BIT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SurgeryTypeId] ASC)
);

