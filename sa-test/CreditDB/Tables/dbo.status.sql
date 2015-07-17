CREATE TABLE [dbo].[status](
	[status_code] [dbo].[status_code] NOT NULL,
	[status_desc] [dbo].[normstring] NOT NULL,
 CONSTRAINT [status_ident] PRIMARY KEY CLUSTERED 
(
	[status_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

