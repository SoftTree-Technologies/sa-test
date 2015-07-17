CREATE TYPE [dbo].[phonenumber] FROM [char](13) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[phonenumber] TO [public] AS [dbo]
GO

