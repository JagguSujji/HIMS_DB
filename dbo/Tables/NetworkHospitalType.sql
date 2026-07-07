CREATE TABLE [dbo].[NetworkHospitalType] (
    [NetworkHospitalTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [HospitalTypeCode]      VARCHAR (20)   NULL,
    [HospitalTypeName]      NVARCHAR (100) NULL,
    [IsActive]              BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([NetworkHospitalTypeId] ASC)
);

