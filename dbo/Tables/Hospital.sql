CREATE TABLE [dbo].[Hospital] (
    [HospitalId]         INT            IDENTITY (1, 1) NOT NULL,
    [HospitalCode]       VARCHAR (20)   NOT NULL,
    [HospitalName]       NVARCHAR (200) NOT NULL,
    [LicenseNumber]      VARCHAR (100)  NULL,
    [RegistrationNumber] VARCHAR (100)  NULL,
    [PhoneNumber]        VARCHAR (20)   NULL,
    [EmailAddress]       VARCHAR (100)  NULL,
    [Website]            VARCHAR (200)  NULL,
    [TaxNumber]          VARCHAR (50)   NULL,
    [TimeZone]           VARCHAR (100)  NULL,
    [CurrencyCode]       CHAR (3)       NULL,
    [LogoPath]           NVARCHAR (500) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]            NVARCHAR (500) NULL,
    [CreatedBy]          INT            NULL,
    [CreatedOn]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]         INT            NULL,
    [ModifiedOn]         DATETIME2 (7)  NULL,
    [RowVersion]         ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([HospitalId] ASC),
    UNIQUE NONCLUSTERED ([HospitalCode] ASC)
);

