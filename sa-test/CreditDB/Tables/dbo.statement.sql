CREATE TABLE [dbo].[statement](
	[statement_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[member_no] [dbo].[numeric_id] NOT NULL,
	[statement_dt] [datetime] NOT NULL,
	[due_dt] [datetime] NOT NULL,
	[statement_amt] [money] NOT NULL,
	[statement_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [statement_ident] PRIMARY KEY CLUSTERED 
(
	[statement_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [statement_member_link] ON [dbo].[statement] 
(
	[member_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[statement]  WITH CHECK ADD  CONSTRAINT [statement_member_link] FOREIGN KEY([member_no])
REFERENCES [dbo].[member] ([member_no])
GO

ALTER TABLE [dbo].[statement] CHECK CONSTRAINT [statement_member_link]
GO

ALTER TABLE [dbo].[statement]  WITH NOCHECK ADD  CONSTRAINT [statement_dt_rule] CHECK  (([due_dt] >= [statement_dt]))
GO

ALTER TABLE [dbo].[statement] CHECK CONSTRAINT [statement_dt_rule]
GO

ALTER TABLE [dbo].[statement] ADD  CONSTRAINT [statement_status_default]  DEFAULT ('  ') FOR [statement_code]
GO

