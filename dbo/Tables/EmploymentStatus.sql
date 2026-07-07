CREATE TABLE [dbo].[EmploymentStatus] (
    [EmploymentStatusId] INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode]         VARCHAR (20)   NULL,
    [StatusName]         NVARCHAR (100) NULL,
    [IsActiveEmployee]   BIT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmploymentStatusId] ASC)
);

