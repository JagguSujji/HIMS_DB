CREATE TABLE [dbo].[EmployeeEmergencyContact] (
    [EmployeeEmergencyContactId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]                 BIGINT         NOT NULL,
    [ContactName]                NVARCHAR (100) NULL,
    [Relationship]               NVARCHAR (100) NULL,
    [MobileNumber]               VARCHAR (20)   NULL,
    [AlternateNumber]            VARCHAR (20)   NULL,
    [Address]                    NVARCHAR (300) NULL,
    [IsPrimary]                  BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeEmergencyContactId] ASC),
    CONSTRAINT [FK_EEC_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

