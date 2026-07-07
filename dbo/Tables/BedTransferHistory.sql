CREATE TABLE [dbo].[BedTransferHistory] (
    [BedTransferId]   INT            IDENTITY (1, 1) NOT NULL,
    [BedId]           INT            NULL,
    [FromAdmissionId] INT            NULL,
    [ToAdmissionId]   INT            NULL,
    [TransferDate]    DATETIME       DEFAULT (getdate()) NULL,
    [Reason]          NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([BedTransferId] ASC)
);

