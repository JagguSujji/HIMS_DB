CREATE TABLE [dbo].[IdentityType] (
    [IdentityTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [IdentityCode]       VARCHAR (20)   NULL,
    [IdentityName]       NVARCHAR (100) NULL,
    [IsGovernmentIssued] BIT            DEFAULT ((1)) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([IdentityTypeId] ASC),
    UNIQUE NONCLUSTERED ([IdentityCode] ASC)
);

