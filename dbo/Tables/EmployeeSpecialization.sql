CREATE TABLE [dbo].[EmployeeSpecialization] (
    [EmployeeSpecializationId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]               BIGINT         NULL,
    [SpecializationId]         INT            NULL,
    [YearsOfExperience]        DECIMAL (5, 2) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeSpecializationId] ASC),
    CONSTRAINT [FK_ES_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_ES_Specialization] FOREIGN KEY ([SpecializationId]) REFERENCES [dbo].[Specialization] ([SpecializationId])
);

