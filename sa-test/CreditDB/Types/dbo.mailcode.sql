CREATE TYPE [dbo].[mailcode] FROM [char](10) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[mailcode] TO [public] AS [dbo]
GO

