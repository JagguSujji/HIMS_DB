CREATE TABLE [dbo].[ClaimStatus] (
    [ClaimStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [ClaimStatusCode] VARCHAR (20)   NULL,
    [ClaimStatusName] NVARCHAR (100) NULL,
    [IsClosed]        BIT            DEFAULT ((0)) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ClaimStatusId] ASC)
);

