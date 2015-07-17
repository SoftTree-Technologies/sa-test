CREATE TYPE [dbo].[yes_no] FROM [char](1) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[yes_no] TO [public] AS [dbo]
GO

