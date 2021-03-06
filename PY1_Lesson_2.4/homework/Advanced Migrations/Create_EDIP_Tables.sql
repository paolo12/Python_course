if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_LINK_CONTEXT__FEATURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_LINK_CONTEXT__FEATURE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_LINK_ATTRIBUTE__CONTEXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_LINK_ATTRIBUTE__CONTEXT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_LINK_CONDITION__CONTEXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_LINK_CONDITION__CONTEXT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_CONTEXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_CONTEXT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_CONDITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_CONDITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_FEATURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_FEATURE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_FEATURE_GROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_FEATURE_GROUP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_ATTRIBUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_ATTRIBUTE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_ATTRIBUTE_GROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_ATTRIBUTE_GROUP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_EDIP_OBJECT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EDIP_OBJECT]
GO

CREATE TABLE [dbo].[T_EDIP_OBJECT] (
	[OBJECT_id] [int] IDENTITY (1, 1) NOT NULL ,
	[ObjectLabel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ObjectDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ObjectOrder] [int] NULL ,
	[ObjectPrimaryKey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ObjectTablePrimaryKey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_OBJECT] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_OBJECT] PRIMARY KEY  CLUSTERED 
	(
		[OBJECT_id]
	)  ON [PRIMARY] 
GO

CREATE TABLE [dbo].[T_EDIP_ATTRIBUTE_GROUP] (
	[ATTRIBUTE_GROUP_id] [int] IDENTITY (1, 1) NOT NULL ,
	[ATTRIBUTE_GROUP_OBJECT_idr] [int] NULL ,
	[AttributeGroupLabel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[AttributeGroupDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AttributeGroupOrder] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_ATTRIBUTE_GROUP] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_ATTRIBUTE_GROUP] PRIMARY KEY  CLUSTERED 
	(
		[ATTRIBUTE_GROUP_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_ATTRIBUTE_GROUP] ADD 
	CONSTRAINT [FK_T_EDIP_ATTRIBUTE_GROUP_T_EDIP_OBJECT] FOREIGN KEY 
	(
		[ATTRIBUTE_GROUP_OBJECT_idr]
	) REFERENCES [dbo].[T_EDIP_OBJECT] (
		[OBJECT_id]
	)
GO

CREATE TABLE [dbo].[T_EDIP_ATTRIBUTE] (
	[ATTRIBUTE_id] [int] IDENTITY (1, 1) NOT NULL ,
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr] [int] NULL ,
	[AttributeLabel] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AttributeName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TableName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SearchType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EditType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReducedView] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AttributeType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AttributeOrder] [int] NULL ,
	[AttributeDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ValuesList] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ExternalInterface] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AttributeLinkedPage] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RepositoryLocation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FastSearch] [int] NULL ,
	[FieldSize] [int] NULL ,
	[MaxLength] [int] NULL ,
	[ReadOnly] [int] NULL ,
	[Mandatory] [int] NULL ,
	[AttributeCommentField] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 	 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_ATTRIBUTE] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_ATTRIBUTE] PRIMARY KEY  CLUSTERED 
	(
		[ATTRIBUTE_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_ATTRIBUTE] ADD 
	CONSTRAINT [FK_T_EDIP_ATTRIBUTE_T_EDIP_ATTRIBUTE_GROUP] FOREIGN KEY 
	(
		[ATTRIBUTE_ATTRIBUTE_GROUP_idr]
	) REFERENCES [dbo].[T_EDIP_ATTRIBUTE_GROUP] (
		[ATTRIBUTE_GROUP_id]
	)
GO

CREATE TABLE [dbo].[T_EDIP_FEATURE_GROUP] (
	[FEATURE_GROUP_id] [int] IDENTITY (1, 1) NOT NULL ,
	[FEATURE_GRP_FEATURE_GROUP_idr] [int] NULL ,
	[FeatureGroupLabel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeatureGroupOrder] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_FEATURE_GROUP] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_FEATURE_GROUP] PRIMARY KEY  CLUSTERED 
	(
		[FEATURE_GROUP_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_FEATURE_GROUP] ADD 
	CONSTRAINT [FK_T_EDIP_FEATURE_GROUP_T_EDIP_FEATURE_GROUP] FOREIGN KEY 
	(
		[FEATURE_GRP_FEATURE_GROUP_idr]
	) REFERENCES [dbo].[T_EDIP_FEATURE_GROUP] (
		[FEATURE_GROUP_id]
	)
GO

CREATE TABLE [dbo].[T_EDIP_FEATURE] (
	[FEATURE_id] [int] IDENTITY (1, 1) NOT NULL ,
	[FEATURE_FEATURE_GROUP_idr] [int] NULL ,
	[FeatureLabel] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeatureDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeatureOrder] [int] NULL ,
	[FeatureLinkedPage] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DisplayContext] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IsPopup] [int] NULL ,
	[PopupDescription] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PopupName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SplitLine] [int] NULL ,
	[FeatureIcon] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[WhereClause] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FeatureObjectUnicity] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_FEATURE] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_FEATURE] PRIMARY KEY  CLUSTERED 
	(
		[FEATURE_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_FEATURE] ADD 
	CONSTRAINT [FK_T_EDIP_FEATURE_T_EDIP_FEATURE_GROUP] FOREIGN KEY 
	(
		[FEATURE_FEATURE_GROUP_idr]
	) REFERENCES [dbo].[T_EDIP_FEATURE_GROUP] (
		[FEATURE_GROUP_id]
	)
GO

CREATE TABLE [dbo].[T_EDIP_CONDITION] (
	[CONDITION_id] [int] IDENTITY (1, 1) NOT NULL ,
	[ConditionQuery] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_CONDITION] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_CONDITION] PRIMARY KEY  CLUSTERED 
	(
		[CONDITION_id]
	)  ON [PRIMARY] 
GO

CREATE TABLE [dbo].[T_EDIP_CONTEXT] (
	[CONTEXT_id] [int] IDENTITY (1, 1) NOT NULL ,
	[ContextName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ContextType] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_CONTEXT] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_CONTEXT] PRIMARY KEY  CLUSTERED 
	(
		[CONTEXT_id]
	)  ON [PRIMARY] 
GO

CREATE TABLE [dbo].[T_EDIP_LINK_CONDITION__CONTEXT] (
	[CONDITION__CONTEXT_CONTEXT_idr] [int] NOT NULL ,
	[CONDITION__CONTEXT_CONDITION_idr] [int] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_LINK_CONDITION__CONTEXT] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_LINK_CONDITION__CONTEXT] PRIMARY KEY  CLUSTERED 
	(
		[CONDITION__CONTEXT_CONTEXT_idr],
		[CONDITION__CONTEXT_CONDITION_idr]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_LINK_CONDITION__CONTEXT] ADD 
	CONSTRAINT [FK_T_EDIP_LINK_CONDITION__CONTEXT_T_EDIP_CONTEXT] FOREIGN KEY 
	(
		[CONDITION__CONTEXT_CONTEXT_idr]
	) REFERENCES [dbo].[T_EDIP_CONTEXT] (
		[CONTEXT_id]
	),
	CONSTRAINT [FK_T_EDIP_LINK_CONDITION__CONTEXT_T_EDIP_CONDITION] FOREIGN KEY 
	(
		[CONDITION__CONTEXT_CONDITION_idr]
	) REFERENCES [dbo].[T_EDIP_CONDITION] (
		[CONDITION_id]
	)
GO

CREATE TABLE [dbo].[T_EDIP_LINK_ATTRIBUTE__CONTEXT] (
	[ATTRIBUTE__CONTEXT_ATTRIBUTE_idr] [int] NOT NULL ,
	[ATTRIBUTE__CONTEXT_CONTEXT_idr] [int] NOT NULL ,
	[AttributeContextReadMode] [int] NULL ,
	[AttributeContextWriteMode] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_LINK_ATTRIBUTE__CONTEXT] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_LINK_ATTRIBUTE__CONTEXT] PRIMARY KEY  CLUSTERED 
	(
		[ATTRIBUTE__CONTEXT_ATTRIBUTE_idr],
		[ATTRIBUTE__CONTEXT_CONTEXT_idr]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_LINK_ATTRIBUTE__CONTEXT] ADD 
	CONSTRAINT [FK_T_EDIP_LINK_ATTRIBUTE__CONTEXT_T_EDIP_ATTRIBUTE] FOREIGN KEY 
	(
		[ATTRIBUTE__CONTEXT_ATTRIBUTE_idr]
	) REFERENCES [dbo].[T_EDIP_ATTRIBUTE] (
		[ATTRIBUTE_id]
	),
	CONSTRAINT [FK_T_EDIP_LINK_ATTRIBUTE__CONTEXT_T_EDIP_CONTEXT] FOREIGN KEY 
	(
		[ATTRIBUTE__CONTEXT_CONTEXT_idr]
	) REFERENCES [dbo].[T_EDIP_CONTEXT] (
		[CONTEXT_id]
	)
GO

CREATE TABLE [dbo].[T_EDIP_LINK_CONTEXT__FEATURE] (
	[CONTEXT__FEATURE_CONTEXT_idr] [int] NOT NULL ,
	[CONTEXT__FEATURE_FEATURE_idr] [int] NOT NULL ,
	[ContextFeatureAvailability] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_EDIP_LINK_CONTEXT__FEATURE] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EDIP_LINK_CONTEXT__FEATURE] PRIMARY KEY  CLUSTERED 
	(
		[CONTEXT__FEATURE_CONTEXT_idr],
		[CONTEXT__FEATURE_FEATURE_idr]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[T_EDIP_LINK_CONTEXT__FEATURE] ADD 
	CONSTRAINT [FK_T_EDIP_LINK_CONTEXT__FEATURE_T_EDIP_CONTEXT] FOREIGN KEY 
	(
		[CONTEXT__FEATURE_CONTEXT_idr]
	) REFERENCES [dbo].[T_EDIP_CONTEXT] (
		[CONTEXT_id]
	),
	CONSTRAINT [FK_T_EDIP_LINK_CONTEXT__FEATURE_T_EDIP_FEATURE] FOREIGN KEY 
	(
		[CONTEXT__FEATURE_FEATURE_idr]
	) REFERENCES [dbo].[T_EDIP_FEATURE] (
		[FEATURE_id]
	)
GO


INSERT INTO [T_EDIP_CONTEXT] ([ContextName],[ContextType])VALUES('AllRights',0)
GO

INSERT INTO [T_EDIP_CONTEXT] ([ContextName],[ContextType])VALUES('Admin',1)
GO

INSERT INTO [T_EDIP_CONDITION] ([ConditionQuery])VALUES('SELECT 1')
GO

INSERT INTO [T_EDIP_LINK_CONDITION__CONTEXT] ([CONDITION__CONTEXT_CONTEXT_idr],[CONDITION__CONTEXT_CONDITION_idr])VALUES(1,1)
GO

INSERT INTO [T_EDIP_LINK_CONDITION__CONTEXT] ([CONDITION__CONTEXT_CONTEXT_idr],[CONDITION__CONTEXT_CONDITION_idr])VALUES(2,1)
GO

INSERT INTO [T_EDIP_FEATURE_GROUP] ([FeatureGroupLabel],[FeatureGroupOrder],[FEATURE_GRP_FEATURE_GROUP_idr])VALUES('Framework Exemple',1,1)
GO
INSERT INTO [T_EDIP_FEATURE_GROUP] ([FeatureGroupLabel],[FeatureGroupOrder],[FEATURE_GRP_FEATURE_GROUP_idr])VALUES('Administration',2,1)
GO
INSERT INTO [T_EDIP_FEATURE_GROUP] ([FeatureGroupLabel],[FeatureGroupOrder],[FEATURE_GRP_FEATURE_GROUP_idr])VALUES('User',3,2)
GO
INSERT INTO [T_EDIP_FEATURE_GROUP] ([FeatureGroupLabel],[FeatureGroupOrder],[FEATURE_GRP_FEATURE_GROUP_idr])VALUES('Role',4,2)
GO

INSERT INTO [T_EDIP_FEATURE] VALUES(3,'New','Create a new user',1,'?action=new_form&amp;data=user',';homepage_form/user;list_form/user;detail_form/user;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(3,'-----','-----',10,NULL,';homepage_form/user;list_form/user;detail_form/user;',0,NULL,NULL,NULL,NULL,NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(3,'List','List the existing users',20,'?action=list_form&amp;data=user',';homepage_form/user;list_form/user;detail_form/user;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(4,'New','Create a new role',1,'?action=new_form&amp;data=role',';homepage_form/user;list_form/role;detail_form/role;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(4,'-----','-----',10,NULL,';homepage_form/user;list_form/role;detail_form/role;',0,NULL,NULL,NULL,NULL,NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(4,'List','List the existing roles',20,'?action=list_form&amp;data=role',';homepage_form/user;list_form/role;detail_form/role;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(2,'Home','Homepage',1,'?action=homepage_form&amp;data=user',NULL,0,NULL,NULL,NULL,'home.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(3,'Edit','Edit the user',3,'?action=update_form&amp;data=user&amp;data_id=#data_id#',';detail_form/user;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(3,'Delete','Delete the current user',3,'?action=delete_form&amp;data=user&amp;data_id=#data_id#',';detail_form/user;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(4,'Edit','Edit the role',2,'?action=update_form&amp;data=role&amp;data_id=#data_id#',';detail_form/role;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(3,'Add Role','Add role to a user',6,'?action=update_role_form&amp;data=user&amp;data_id=#data_id#&amp;toDo=add',';detail_form/user;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(3,'Remove Role','Remove role to a user',7,'?action=update_role_form&amp;data=user&amp;data_id=#data_id#&amp;toDo=remove',';detail_form/user;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO
INSERT INTO [T_EDIP_FEATURE] VALUES(4,'Remove','Remove role',8,'?action=delete_form&amp;data=role&amp;data_id=#data_id#',';detail_form/role;',0,NULL,NULL,NULL,'bdd.gif',NULL)
GO

INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,1,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,2,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,3,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,4,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,5,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,6,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,7,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,8,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,9,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,10,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,11,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,12,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(1,13,1)
GO


INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,1,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,2,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,3,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,4,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,5,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,6,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,7,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,8,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,9,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,10,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,11,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,12,1)
GO
INSERT INTO [T_EDIP_LINK_CONTEXT__FEATURE] VALUES(2,13,1)
GO

