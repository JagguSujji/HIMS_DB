CREATE TABLE [dbo].[Address] (
    [AddressId]     INT             IDENTITY (1, 1) NOT NULL,
    [AddressTypeId] INT             NOT NULL,
    [CityId]        INT             NOT NULL,
    [AddressLine1]  VARCHAR (200)   NOT NULL,
    [AddressLine2]  VARCHAR (200)   NULL,
    [Landmark]      VARCHAR (150)   NULL,
    [PostalCode]    VARCHAR (20)    NULL,
    [Latitude]      DECIMAL (10, 7) NULL,
    [Longitude]     DECIMAL (10, 7) NULL,
    [IsActive]      BIT             DEFAULT ((1)) NOT NULL,
    [CreatedOn]     DATETIME        DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC),
    FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[AddressType] ([AddressTypeId]),
    FOREIGN KEY ([CityId]) REFERENCES [dbo].[City] ([CityId])
);

