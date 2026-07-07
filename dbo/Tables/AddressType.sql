CREATE TABLE [dbo].[AddressType] (
    [AddressTypeId] INT           IDENTITY (1, 1) NOT NULL,
    [TypeCode]      VARCHAR (20)  NOT NULL,
    [TypeName]      VARCHAR (100) NOT NULL,
    [IsActive]      BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]     DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressTypeId] ASC)
);

