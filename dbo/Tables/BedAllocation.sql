CREATE TABLE [dbo].[BedAllocation] (
    [BedAllocationId] BIGINT   IDENTITY (1, 1) NOT NULL,
    [AdmissionId]     BIGINT   NULL,
    [BedId]           INT      NULL,
    [FromDate]        DATETIME NULL,
    [ToDate]          DATETIME NULL,
    PRIMARY KEY CLUSTERED ([BedAllocationId] ASC)
);

