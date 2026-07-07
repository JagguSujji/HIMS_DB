CREATE TABLE [dbo].[WardServiceLocation] (
    [WardServiceLocationId] INT           IDENTITY (1, 1) NOT NULL,
    [WardId]                INT           NOT NULL,
    [ServiceLocationId]     INT           NOT NULL,
    [IsActive]              BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]             DATETIME2 (7) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([WardServiceLocationId] ASC),
    CONSTRAINT [FK_WSL_ServiceLocation] FOREIGN KEY ([ServiceLocationId]) REFERENCES [dbo].[ServiceLocation] ([ServiceLocationId]),
    CONSTRAINT [FK_WSL_Ward] FOREIGN KEY ([WardId]) REFERENCES [dbo].[Ward] ([WardId]),
    CONSTRAINT [UQ_WardServiceLocation] UNIQUE NONCLUSTERED ([WardId] ASC, [ServiceLocationId] ASC)
);

