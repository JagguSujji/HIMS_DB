CREATE TABLE [dbo].[MaritalStatus] (
    [MaritalStatusId] INT           IDENTITY (1, 1) NOT NULL,
    [StatusCode]      VARCHAR (20)  NULL,
    [StatusName]      NVARCHAR (50) NULL,
    [IsActive]        BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([MaritalStatusId] ASC)
);

