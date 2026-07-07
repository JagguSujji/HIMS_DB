CREATE TABLE [dbo].[EmployeeQualification] (
    [EmployeeQualificationId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]              BIGINT         NOT NULL,
    [QualificationId]         INT            NOT NULL,
    [Institution]             NVARCHAR (200) NULL,
    [YearCompleted]           INT            NULL,
    [RegistrationNumber]      VARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([EmployeeQualificationId] ASC),
    CONSTRAINT [FK_EQ_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EQ_Qualification] FOREIGN KEY ([QualificationId]) REFERENCES [dbo].[Qualification] ([QualificationId])
);

