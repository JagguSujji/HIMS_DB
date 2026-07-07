CREATE TABLE [dbo].[OrderStatus] (
    [OrderStatusId] INT           NOT NULL,
    [StatusCode]    VARCHAR (50)  NULL,
    [StatusName]    VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([OrderStatusId] ASC)
);

