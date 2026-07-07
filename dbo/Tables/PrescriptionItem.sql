CREATE TABLE [dbo].[PrescriptionItem] (
    [PrescriptionItemId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [PrescriptionId]     BIGINT         NULL,
    [DrugId]             INT            NULL,
    [Dosage]             NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([PrescriptionItemId] ASC)
);

