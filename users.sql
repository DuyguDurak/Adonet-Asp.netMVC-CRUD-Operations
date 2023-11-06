Create Database UserCRUD
go

USE [UserCRUD]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteUser]
(
@UserID int
)
as
begin

	delete from dbo.tbl_Users where UserId = @UserId

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUsers] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetAllUsers]
as
begin

	select UserId,UserName,UserSurname,UserAge from dbo.tbl_Users with(nolock)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserByID]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_GetUserByID]
(
	@UserId int
)
as
begin

	select UserId,UserName,UserSurname,UserAge from dbo.tbl_Users with(nolock)
	where UserId = @UserId

end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUsers]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create procedure sp_GetAllUsers
--as
--begin

--	select UserId,UserName,UserSurname,UserAge from dbo.tbl_Users with(nolock)

--end

CREATE proc [dbo].[sp_InsertUsers]
(
@UserName nvarchar(50),
@UserSurname nvarchar(50),
@UserAge int
)
as
begin

	insert into dbo.tbl_Users(UserName,UserSurname,UserAge)
	values(@UserName,@UserSurname,@UserAge)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUsers]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UpdateUsers]
(
@UserId int,
@UserName nvarchar(50),
@UserSurname nvarchar(50),
@UserAge int
)
as
begin

	update dbo.tbl_Users
	set UserName = @UserName,
	UserSurname = @UserSurname,
	UserAge = @UserAge
	where UserId = @UserId
end
GO
/****** Object:  Table [dbo].[tbl_Users******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserAge] [int] NOT NULL
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
