CREATE TABLE [dbo].[QueueToken] (
    [TokenId]      INT          NOT NULL,
    [PatientId]    INT          NULL,
    [DepartmentId] INT          NULL,
    [TokenNumber]  INT          NULL,
    [Status]       VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TokenId] ASC)
);

