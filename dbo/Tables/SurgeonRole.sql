CREATE TABLE [dbo].[SurgeonRole] (
    [SurgeonRoleId]   INT            IDENTITY (1, 1) NOT NULL,
    [SurgeonRoleCode] VARCHAR (20)   NULL,
    [SurgeonRoleName] NVARCHAR (100) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SurgeonRoleId] ASC)
);

