CREATE TABLE [dbo].[ClaimSubmission] (
    [ClaimId]        INT          NOT NULL,
    [PolicyId]       INT          NULL,
    [InvoiceId]      INT          NULL,
    [SubmissionDate] DATETIME     NULL,
    [Status]         VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ClaimId] ASC)
);

