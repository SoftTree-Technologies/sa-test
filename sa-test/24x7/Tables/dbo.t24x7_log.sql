CREATE TABLE [dbo].[t24x7_log](
	[event_host] [varchar](100) NULL,
	[event_time] [datetime] NULL,
	[event_severity] [int] NULL,
	[job_id] [int] NULL,
	[job_name] [varchar](255) NULL,
	[message_text] [varchar](2000) NULL
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [i24x7_log_time] ON [dbo].[t24x7_log] 
(
	[event_time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

