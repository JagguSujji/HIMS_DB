CREATE TABLE [dbo].[BranchWard] (
    [BranchWardId] INT           IDENTITY (1, 1) NOT NULL,
    [BranchId]     INT           NOT NULL,
    [WardId]       INT           NOT NULL,
    [IsActive]     BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]    DATETIME2 (7) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([BranchWardId] ASC),
    CONSTRAINT [FK_BranchWard_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_BranchWard_Ward] FOREIGN KEY ([WardId]) REFERENCES [dbo].[Ward] ([WardId]),
    CONSTRAINT [UQ_BranchWard] UNIQUE NONCLUSTERED ([BranchId] ASC, [WardId] ASC)
);

