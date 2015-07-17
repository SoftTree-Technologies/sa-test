SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


/****** Object:  View dbo.payment_wide    Script Date: 10/13/99 6:38:01 PM ******/



CREATE VIEW payment_wide
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
      ,  payment.payment_no       
      ,  payment.payment_dt       
      ,  payment.payment_amt      

      ,  payment.payment_code
    FROM member, region, payment
    WHERE member.member_no = payment.member_no 
      AND region.region_no = member.region_no

GO

