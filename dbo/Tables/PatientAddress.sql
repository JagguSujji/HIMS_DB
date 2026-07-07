CREATE TABLE [dbo].[PatientAddress] (
    [PatientAddressId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientId]        BIGINT         NULL,
    [AddressTypeId]    INT            NULL,
    [AddressLine1]     NVARCHAR (200) NULL,
    [AddressLine2]     NVARCHAR (200) NULL,
    [CityId]           INT            NULL,
    [PostalCode]       VARCHAR (20)   NULL,
    PRIMARY KEY CLUSTERED ([PatientAddressId] ASC)
);

