create view dbo.test
with schemabinding
as select member_no, lastname, firstname
from dbo.member

GO

