CREATE TABLE [dbo].[Holiday] (
    [HolidayId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [BranchId]    INT            NULL,
    [HolidayDate] DATE           NOT NULL,
    [HolidayName] NVARCHAR (200) NOT NULL,
    [IsOptional]  BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]    BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]   DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([HolidayId] ASC),
    CONSTRAINT [FK_Holiday_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId])
);

