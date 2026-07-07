CREATE TABLE [dbo].[OrderDetail] (
    [OrderDetailId] INT             NOT NULL,
    [OrderId]       INT             NULL,
    [ItemId]        INT             NULL,
    [Quantity]      DECIMAL (10, 2) NULL,
    [Instructions]  NVARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([OrderDetailId] ASC)
);

