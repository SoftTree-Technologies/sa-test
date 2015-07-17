SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  View dbo.basic_member    Script Date: 10/13/99 6:38:01 PM ******/



CREATE VIEW basic_member
AS
    SELECT 
         member.member_no
      ,  member.lastname
      ,  member.firstname
      ,  member.middleinitial
      ,  member.street
      ,  member.city
      ,  member.state_prov
      ,  member.mail_code
      ,  member.phone_no
      ,  member.region_no
      ,  member.expr_dt
      ,  member.member_code
    FROM member
    WHERE member_no NOT IN (SELECT member_no FROM corp_member)

GO

