CREATE TABLE [dbo].[EmployeeDocument] (
    [EmployeeDocumentId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]             BIGINT         NOT NULL,
    [EmployeeDocumentTypeId] INT            NOT NULL,
    [DocumentNumber]         VARCHAR (100)  NULL,
    [FileName]               NVARCHAR (300) NULL,
    [FilePath]               NVARCHAR (500) NULL,
    [IssueDate]              DATE           NULL,
    [ExpiryDate]             DATE           NULL,
    [IsVerified]             BIT            DEFAULT ((0)) NULL,
    [UploadedOn]             DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UploadedBy]             INT            NULL,
    PRIMARY KEY CLUSTERED ([EmployeeDocumentId] ASC),
    CONSTRAINT [FK_ED_DocumentType] FOREIGN KEY ([EmployeeDocumentTypeId]) REFERENCES [dbo].[EmployeeDocumentType] ([EmployeeDocumentTypeId]),
    CONSTRAINT [FK_ED_Employee_D] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

