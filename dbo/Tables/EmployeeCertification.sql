CREATE TABLE [dbo].[EmployeeCertification] (
    [EmployeeCertificationId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]              BIGINT         NOT NULL,
    [CertificationTypeId]     INT            NOT NULL,
    [CertificateNumber]       VARCHAR (100)  NULL,
    [IssueDate]               DATE           NULL,
    [ExpiryDate]              DATE           NULL,
    [IssuedBy]                NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeCertificationId] ASC),
    CONSTRAINT [FK_EC_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EC_Type] FOREIGN KEY ([CertificationTypeId]) REFERENCES [dbo].[CertificationType] ([CertificationTypeId])
);

