CREATE TABLE [dbo].[CSSDExpiryTracking] (
    [ExpiryId]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [InstrumentSetId] BIGINT        NOT NULL,
    [BatchId]         BIGINT        NOT NULL,
    [SterileFrom]     DATETIME2 (7) NOT NULL,
    [SterileUntil]    DATETIME2 (7) NOT NULL,
    [IsExpired]       BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ExpiryId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CSSDExpiry_Instrument]
    ON [dbo].[CSSDExpiryTracking]([InstrumentSetId] ASC);

