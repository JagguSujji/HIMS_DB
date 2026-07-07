CREATE TABLE [dbo].[OrderResult] (
    [OrderResultId] INT            NOT NULL,
    [OrderId]       INT            NULL,
    [ResultText]    NVARCHAR (MAX) NULL,
    [ResultDate]    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([OrderResultId] ASC)
);

