CREATE TABLE [dbo].[Provider] (
    [ProviderId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [EmployeeId]       BIGINT        NULL,
    [ProviderType]     VARCHAR (50)  NULL,
    [LicenseNumber]    VARCHAR (100) NULL,
    [SpecializationId] BIGINT        NULL,
    [IsActive]         BIT           NULL,
    [CreatedOn]        DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ProviderId] ASC)
);

