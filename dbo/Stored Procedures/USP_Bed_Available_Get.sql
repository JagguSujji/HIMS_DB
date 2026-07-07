CREATE     PROCEDURE [dbo].[USP_Bed_Available_Get]

(
 @WardId BIGINT=NULL
)

AS
BEGIN


SELECT


B.BedId,
B.BedCode,
B.BedNumber,

R.RoomNumber,
R.RoomName,

W.WardName,

BT.TypeName BedType


FROM dbo.Bed B


INNER JOIN dbo.Room R

ON B.RoomId=R.RoomId


INNER JOIN dbo.Ward W

ON W.WardId=R.FloorId


INNER JOIN dbo.BedType BT

ON B.BedTypeId=BT.BedTypeId


WHERE

B.IsOccupied=0

AND B.IsActive=1


AND

(
@WardId IS NULL

OR W.WardId=@WardId
);



END
