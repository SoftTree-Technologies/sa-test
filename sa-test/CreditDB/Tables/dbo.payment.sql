CREATE TABLE [dbo].[payment](
	[payment_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[member_no] [dbo].[numeric_id] NOT NULL,
	[payment_dt] [datetime] NOT NULL,
	[payment_amt] [money] NOT NULL,
	[statement_no] [dbo].[numeric_id] NULL,
	[payment_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [payment_ident] PRIMARY KEY NONCLUSTERED 
(
	[payment_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [payment_member_link] ON [dbo].[payment] 
(
	[member_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [payment_member_link] FOREIGN KEY([member_no])
REFERENCES [dbo].[member] ([member_no])
GO

ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [payment_member_link]
GO

ALTER TABLE [dbo].[payment]  WITH NOCHECK ADD  CONSTRAINT [payment_amount_rule] CHECK  (([payment_amt] <> 0))
GO

ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [payment_amount_rule]
GO

ALTER TABLE [dbo].[payment] ADD  CONSTRAINT [payment_statement_no_default]  DEFAULT (0) FOR [statement_no]
GO

ALTER TABLE [dbo].[payment] ADD  CONSTRAINT [payment_status_default]  DEFAULT ('  ') FOR [payment_code]
GO

