SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  View dbo.statement_wide    Script Date: 10/13/99 6:38:01 PM ******/



CREATE VIEW statement_wide
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
      ,  member.expr_dt
      ,  member.member_code
      ,  region.region_no
      ,  region.region_name
      ,  statement.statement_no     
      ,  statement.statement_dt     
      ,  statement.due_dt           
      ,  statement.statement_amt    
      ,  statement.statement_code      
    FROM member, region, statement
    WHERE member.member_no = statement.member_no 
      AND region.region_no = member.region_no

GO

