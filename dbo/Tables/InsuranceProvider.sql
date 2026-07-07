CREATE TABLE [dbo].[InsuranceProvider] (
    [InsuranceProviderId] INT            IDENTITY (1, 1) NOT NULL,
    [ProviderCode]        VARCHAR (20)   NOT NULL,
    [ProviderName]        NVARCHAR (200) NOT NULL,
    [ProviderType]        VARCHAR (50)   NULL,
    [ContactPerson]       NVARCHAR (100) NULL,
    [Phone]               VARCHAR (30)   NULL,
    [Email]               VARCHAR (100)  NULL,
    [Website]             VARCHAR (200)  NULL,
    [IsCashless]          BIT            DEFAULT ((1)) NULL,
    [IsActive]            BIT            DEFAULT ((1)) NULL,
    [CreatedOn]           DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([InsuranceProviderId] ASC),
    UNIQUE NONCLUSTERED ([ProviderCode] ASC)
);

