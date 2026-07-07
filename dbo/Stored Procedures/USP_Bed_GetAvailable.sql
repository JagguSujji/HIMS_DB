CREATE     PROCEDURE [dbo].[USP_Bed_GetAvailable]

(
 @WardId BIGINT=NULL,
 @RoomTypeId BIGINT=NULL
)

AS
BEGIN


SELECT

B.BedId,
B.BedCode,
B.BedNumber,
R.RoomNumber,
W.WardName


FROM dbo.Bed B


INNER JOIN dbo.Room R

ON B.RoomId=R.RoomId


INNER JOIN dbo.Ward W

ON R.FloorId=W.WardId



WHERE

B.IsOccupied=0

AND B.IsActive=1


AND
(
@WardId IS NULL

OR W.WardId=@WardId
)


AND
(
@RoomTypeId IS NULL

OR R.RoomTypeId=@RoomTypeId
);


END
