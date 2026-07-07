CREATE TABLE [dbo].[InventoryItemMaster] (
    [ItemId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemCode] NVARCHAR (50)  NULL,
    [ItemName] NVARCHAR (200) NULL,
    [ItemType] NVARCHAR (100) NULL,
    [UnitId]   INT            NULL,
    [IsActive] BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC)
);

