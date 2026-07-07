CREATE TABLE [dbo].[InsuranceType] (
    [InsuranceTypeId]    INT            IDENTITY (1, 1) NOT NULL,
    [InsuranceTypeCode]  VARCHAR (20)   NULL,
    [InsuranceTypeName]  NVARCHAR (100) NULL,
    [IsGovernmentScheme] BIT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([InsuranceTypeId] ASC)
);

