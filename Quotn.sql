CREATE TYPE [dbo].[uv_EmpIdType] FROM [nvarchar](10) NULL
GO
CREATE TYPE [dbo].[uv_EmpAdType] FROM [nvarchar](20) NULL
GO
CREATE TYPE [dbo].[uv_EmpNameType] FROM [nvarchar](20) NULL
GO
CREATE TYPE [dbo].[uv_DepIdType] FROM [nvarchar](20) NULL
GO
CREATE TYPE [dbo].[uv_BitType] FROM [bit] NULL
GO
CREATE TYPE [dbo].[uv_Char1Type] FROM [char](1) NULL
GO
CREATE TYPE [dbo].[uv_DefaultIntType] FROM [int] NULL
GO
CREATE TYPE [dbo].[uv_BigIntType] FROM [BigInt] NULL
GO
CREATE TYPE [dbo].[uv_CategoryType] FROM [nvarchar](2) NULL
GO
CREATE TYPE [dbo].[uv_DocNoType] FROM [nvarchar](50) NULL
GO
CREATE TYPE [dbo].[uv_ItemType] FROM [nvarchar](100) NULL
GO
CREATE TYPE [dbo].[uv_ItemDescType] FROM [nvarchar](2000) NULL
GO
CREATE TYPE [dbo].[uv_Decimal52Type] FROM [decimal](5,2) NULL
GO
CREATE TYPE [dbo].[uv_Decimal72Type] FROM [decimal](7,2) NULL
GO
CREATE TYPE [dbo].[uv_DateStr10Type] FROM [nvarchar](10) NULL
GO
CREATE TYPE [dbo].[uv_OverDueListType] FROM [nvarchar](300) NULL
GO
CREATE TYPE [dbo].[uv_VarCharMaxType] FROM [nvarchar](max) NULL
GO
CREATE TYPE [dbo].[uv_ValueType] FROM [nvarchar](30) NULL
GO
CREATE TYPE [dbo].[uv_IconType] FROM [nchar](30) NULL
GO
CREATE TYPE [dbo].[uv_Memo100Type] FROM [nvarchar](100) NULL
GO
CREATE TYPE [dbo].[uv_ColorType] FROM [nvarchar](30) NULL
GO
CREATE TYPE [dbo].[uv_ThickType] FROM [Decimal](16,6) NULL
GO
CREATE TYPE [dbo].[uv_WidthType] FROM [Decimal](16,6) NULL
GO
CREATE TYPE [dbo].[uv_LengthType] FROM [Decimal](16,6) NULL
GO
CREATE TYPE [dbo].[uv_CostType] FROM [Decimal](20,10) NULL
GO
CREATE TYPE [dbo].[uv_PriceType] FROM [Decimal](16,6) NULL
GO
CREATE TYPE [dbo].[uv_Memo1000Type] FROM [nvarchar](1000) NULL
GO
CREATE TYPE [dbo].[uv_Desc100Type] FROM [nvarchar](100) NULL
GO
CREATE TYPE [dbo].[uv_AreaIdType] FROM [nvarchar](4) NULL
GO
CREATE TYPE [dbo].[uv_QuotnIdType] FROM [nvarchar](12) NULL
GO

CREATE TABLE [dbo].[vc_quotn_Employee](
	[EmployeeId] [uv_EmpIdType] NOT NULL,
	[EmployeeAd] [uv_EmpAdType] NOT NULL,
	[EmployeeName] [uv_EmpNameType] NOT NULL,
	[DepartmentId] [uv_DepIdType] NOT NULL,
	[Enabled] [Flag] NULL,
	[GrpId] [IdIntType] NULL,	
	[CreateTime] [DateTimeType] NULL,
	[Creator] [UsernameType] NULL,
	[UpdateTime] [DateTimeType] NULL,
	[Updator] [UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_Group](
	[GrpId] [dbo].[IdIntType] IDENTITY(1,1) NOT NULL,
	[GrpName] [dbo].[NameType] NOT NULL,
	[CreateTime] [DateTimeType] NULL,
	[Creator] [UsernameType] NULL,
	[UpdateTime] [DateTimeType] NULL,
	[Updator] [UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_GroupFunction](
	[GrpId] [dbo].[IdIntType] NOT NULL,
	[FuncId] [dbo].[IdIntType] NOT NULL,
	[CreateTime] [DateTimeType] NULL,
	[UpdateTime] [DateTimeType] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrpId] ASC,
	[FuncId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_Function](
	[FuncId] [dbo].[IdIntType] IDENTITY(1,1) NOT NULL,
	[FuncName] [dbo].[NameType] NOT NULL,
	[NodeId] [dbo].[DefaultIntType] NULL,
	[NodeSeq] [dbo].[DefaultIntType] NULL,
	[ParentId] [dbo].[DefaultIntType] NULL,
	[Url] [dbo].[URLType] NULL,
	[Icon] [dbo].[uv_IconType] NULL,
	[Enabled] [dbo].[Flag] NULL,
	[CreateTime] [DateTimeType] NULL,
	[UpdateTime] [DateTimeType] NULL,
PRIMARY KEY CLUSTERED 
(
	[FuncId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_SystemParam](
	[ParamId] [dbo].[uv_DefaultIntType] NOT NULL,
	[ParamName] [dbo].[NameType] NOT NULL,
	[ParamValue] [dbo].[uv_ValueType] NULL,
	[ParamUm] [dbo].[NameType] NOT NULL,
	[Order] [dbo].[uv_DefaultIntType] NULL,
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[ParamId] ASC,
	[ParamName] ASC,
	[ParamUm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_FormulaParam](
	[FormulaId] [dbo].[ConfigIdType] NOT NULL,
	[FormulaName] [dbo].[NameType] NULL,
	[Memo] [uv_Memo100Type],
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[FormulaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_FormulaParamHist](
	[Seq] [dbo].[uv_BigIntType] NOT NULL,
	[FormulaId] [dbo].[ConfigIdType] NOT NULL,
	[FormulaName] [dbo].[NameType] NULL,
	[Memo] [uv_Memo100Type],
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[FormulaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_AreaParam](
	[AreaId] [dbo].[ConfigIdType] NOT NULL,
	[AreaName] [dbo].[NameType] NULL,
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_AreaParamHist](
	[Seq] [dbo].[uv_BigIntType] NOT NULL,
	[AreaId] [dbo].[ConfigIdType] NOT NULL,
	[AreaName] [dbo].[NameType] NULL,
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[AreaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_CategoryParam](
	[CategoryId] [dbo].[ConfigIdType] NOT NULL,
	[CategoryName] [dbo].[NameType] NULL,
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_CategoryParamHist](
	[Seq] [dbo].[uv_BigIntType] NOT NULL,
	[CategoryId] [dbo].[ConfigIdType] NOT NULL,
	[CategoryName] [dbo].[NameType] NULL,
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_AreaMag](
	[CategoryId] [dbo].[ConfigIdType] NOT NULL,
	[AreaId] [dbo].[ConfigIdType] NOT NULL,
	[AreaMag] [dbo].[uv_Decimal52Type] NOT NULL,
	[Memo] [uv_Memo100Type] NULL,	
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[AreaId]  ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_AreaMagHist](
	[Seq] [dbo].[uv_BigIntType] NOT NULL,
	[CategoryId] [dbo].[ConfigIdType] NOT NULL,
	[AreaId] [dbo].[ConfigIdType] NOT NULL,
	[AreaMag] [dbo].[uv_Decimal52Type] NOT NULL,
	[Memo] [uv_Memo100Type] NULL,		
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[CategoryId] ASC,
	[AreaId]  ASC	
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_QuantityMag](
	[CategoryId] [dbo].[ConfigIdType] NOT NULL,
	[Color] [dbo].[ConfigIdType] NOT NULL,
	[QtyMag1] [dbo].[uv_Desc100Type] NOT NULL,	
	[QtyMag2] [dbo].[uv_Desc100Type] NOT NULL,
	[QtyMag3] [dbo].[uv_Desc100Type] NOT NULL,
	[QtyMag4] [dbo].[uv_Desc100Type] NOT NULL,
	[QtyMag5] [dbo].[uv_Desc100Type] NOT NULL,	
	[Memo] [uv_Memo100Type] NULL,		
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[Color] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_QuantityMagHist](
	[Seq] [dbo].[uv_BigIntType] NOT NULL,
	[CategoryId] [dbo].[ConfigIdType] NOT NULL,
	[Color] [dbo].[ConfigIdType] NOT NULL,
	[QtyMag1] [dbo].[uv_Desc100Type] NOT NULL,	
	[QtyMag2] [dbo].[uv_Desc100Type] NOT NULL,
	[QtyMag3] [dbo].[uv_Desc100Type] NOT NULL,
	[QtyMag4] [dbo].[uv_Desc100Type] NOT NULL,
	[QtyMag5] [dbo].[uv_Desc100Type] NOT NULL,
	[Memo] [uv_Memo100Type] NULL,		
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[CategoryId] ASC,
	[Color] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_PricingBase](
	[Version] [uv_DefaultIntType] NOT NULL,
	[SubVersion] [uv_DefaultIntType] NOT NULL,	
	[Area] [dbo].[uv_AreaIdType] NOT NULL,
	[Category] [dbo].[uv_CategoryType] NOT NULL,
	[Product] [dbo].[BPProductType]  NOT NULL,
	[Color] [dbo].[uv_ColorType]  NOT NULL,
	[Thick] [dbo].[uv_ThickType], 
	[BaseCost][dbo].[uv_CostType],
	[C1Cost][dbo].[uv_CostType],
	[C2Cost][dbo].[uv_CostType],
	[C3Cost][dbo].[uv_CostType],	
	[StdCost][dbo].[uv_CostType],
	[ActCost] [dbo].[uv_CostType],
	[SubminiYield] [dbo].[uv_CostType],	
	[MiniYield] [dbo].[uv_CostType],
	[SmallYield] [dbo].[uv_CostType],	
	[MediumYield] [dbo].[uv_CostType],	
	[LargeYield] [dbo].[uv_CostType],	
	[SubminiCost] [dbo].[uv_CostType],	
	[MiniCost] [dbo].[uv_CostType],
	[SmallCost] [dbo].[uv_CostType],	
	[MediumCost] [dbo].[uv_CostType],	
	[LargeCost] [dbo].[uv_CostType],
	[PriceName] [uv_Memo100Type] NULL,
	[ForexRate] [uv_Decimal52Type] NULL,
	[StartDate] [dbo].[DateTimeType] NOT NULL,
	[EndDate] [dbo].[DateTimeType] NOT NULL,
	[Memo] [uv_Memo100Type] Not NULL,
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Version] ASC,
	[SubVersion] ASC,	
	[Area] ASC,
	[Category] ASC,
	[Product] ASC,
	[Color] ASC,
	[Thick] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_PricingBaseHist](
	[Version] [uv_DefaultIntType] NOT NULL,
	[SubVersion] [uv_DefaultIntType] NOT NULL,	
	[Area] [dbo].[uv_AreaIdType] NOT NULL,
	[Category] [dbo].[uv_CategoryType] NOT NULL,
	[Product] [dbo].[BPProductType]  NOT NULL,
	[Color] [dbo].[uv_ColorType]  NOT NULL,
	[Thick] [dbo].[uv_ThickType], 
	[BaseCost][dbo].[uv_CostType],
	[C1Cost][dbo].[uv_CostType],
	[C2Cost][dbo].[uv_CostType],
	[C3Cost][dbo].[uv_CostType],	
	[StdCost][dbo].[uv_CostType],
	[ActCost] [dbo].[uv_CostType],
	[SubminiYield] [dbo].[uv_CostType],	
	[MiniYield] [dbo].[uv_CostType],
	[SmallYield] [dbo].[uv_CostType],	
	[MediumYield] [dbo].[uv_CostType],	
	[LargeYield] [dbo].[uv_CostType],	
	[SubminiCost] [dbo].[uv_CostType],	
	[MiniCost] [dbo].[uv_CostType],
	[SmallCost] [dbo].[uv_CostType],	
	[MediumCost] [dbo].[uv_CostType],	
	[LargeCost] [dbo].[uv_CostType],
	[ForexRate] [uv_Decimal52Type] NULL,
	[StartDate] [dbo].[DateTimeType] NOT NULL,
	[EndDate] [dbo].[DateTimeType] NOT NULL,
	[Memo] [uv_Memo100Type] Not NULL,	
	[CreateTime] [dbo].[DateTimeType] NULL,
	[Creator] [dbo].[UsernameType] NULL,
	[UpdateTime] [dbo].[DateTimeType] NULL,
	[Updator] [dbo].[UsernameType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Version] ASC,
	[SubVersion] ASC,	
	[Area] ASC,
	[Category] ASC,
	[Product] ASC,
	[Color] ASC,
	[Thick] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_Sequence](
	[SequenceId] [dbo].[ConfigIdType] NOT NULL PRIMARY KEY,
	[SequenceName] [dbo].[NameType] NOT NULL,
	[Sequence] [dbo].[uv_BigIntType] NOT NULL DEFAULT 0
)
GO

ALTER TABLE vc_quotn_AreaMag ADD CONSTRAINT fk_AreaMag_AreaId FOREIGN KEY (AreaId) REFERENCES vc_quotn_AreaParam(AreaId)
go
ALTER TABLE vc_quotn_AreaMag ADD CONSTRAINT fk_AreaMag_CategoryId FOREIGN KEY (CategoryId) REFERENCES vc_quotn_CategoryParam(CategoryId)
go

insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('',0,1,0,'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_SYSTEM_SETTING',1,1,1,'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_SECURITY_SETTING',2,1,(select FuncId from vc_quotn_Function where FuncName='FUN_SYSTEM_SETTING'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_GROUP_SETTING',3,1,(select FuncId from vc_quotn_Function where FuncName='FUN_SECURITY_SETTING'),'/Security/GroupIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_ADD',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_GROUP_SETTING'),'BTN_ADD',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_EDIT',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_GROUP_SETTING'),'BTN_EDIT',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_DELETE',4,3,(select FuncId from vc_quotn_Function where FuncName='FUN_GROUP_SETTING'),'BTN_DELETE',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_QUERY',4,4,(select FuncId from vc_quotn_Function where FuncName='FUN_GROUP_SETTING'),'BTN_QUERY',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_USER_SETTING',3,2,(select FuncId from vc_quotn_Function where FuncName='FUN_SECURITY_SETTING'),'/Security/UserIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_ADD',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_USER_SETTING'),'BTN_ADD',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_EDIT',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_USER_SETTING'),'BTN_EDIT',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_DELETE',4,3,(select FuncId from vc_quotn_Function where FuncName='FUN_USER_SETTING'),'BTN_DELETE',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_QUERY',4,4,(select FuncId from vc_quotn_Function where FuncName='FUN_USER_SETTING'),'BTN_QUERY',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_SYSTEM_PARAMETER',2,2,(select FuncId from vc_quotn_Function where FuncName='FUN_SYSTEM_SETTING'),'/System/Parameter',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_PRECEDING_PARAMETER',2,3,(select FuncId from vc_quotn_Function where FuncName='FUN_SYSTEM_SETTING'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_FORMULA_PARAMETER',3,1,(select FuncId from vc_quotn_Function where FuncName='FUN_PRECEDING_PARAMETER'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SETTING',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_FORMULA_PARAMETER'),'/PreParameter/FormulaParamM',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_SET',5,1,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/PreParameter/FormulaParamM'),'BTN_SET',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_QUERY',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_FORMULA_PARAMETER'),'/PreParameter/FormulaParamHIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_AREA_PARAMETER',3,2,(select FuncId from vc_quotn_Function where FuncName='FUN_PRECEDING_PARAMETER'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SETTING',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_AREA_PARAMETER'),'/PreParameter/AreaParamM',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_SET',5,1,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/PreParameter/AreaParamM'),'BTN_SET',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_QUERY',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_AREA_PARAMETER'),'/PreParameter/AreaParamHIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_CATEGORY_PARAMETER',3,3,(select FuncId from vc_quotn_Function where FuncName='FUN_PRECEDING_PARAMETER'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SETTING',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_CATEGORY_PARAMETER'),'/PreParameter/CategoryParamM',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_SET',5,1,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/PreParameter/CategoryParamM'),'BTN_SET',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_QUERY',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_CATEGORY_PARAMETER'),'/PreParameter/CategoryParamHIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_AREA_MAGNIFICATION',3,4,(select FuncId from vc_quotn_Function where FuncName='FUN_PRECEDING_PARAMETER'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SETTING',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_AREA_MAGNIFICATION'),'/PreParameter/AreaMagM',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_SET',5,1,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/PreParameter/AreaMagM'),'BTN_SET',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_QUERY',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_AREA_MAGNIFICATION'),'/PreParameter/AreaMagHIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_QUANTITY_MAGNIFICATION',3,5,(select FuncId from vc_quotn_Function where FuncName='FUN_PRECEDING_PARAMETER'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SETTING',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_QUANTITY_MAGNIFICATION'),'/PreParameter/QuantityMagM',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_SET',5,1,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/PreParameter/QuantityMagM'),'BTN_SET',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_QUERY',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_QUANTITY_MAGNIFICATION'),'/PreParameter/QuantityMagHIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_PRICING_MANAGEMENT',1,2,1,'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_PRICING_FOREIGN',2,1,(select FuncId from vc_quotn_Function where FuncName='FUN_PRICING_MANAGEMENT'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_PRICING_LOCAL',2,2,(select FuncId from vc_quotn_Function where FuncName='FUN_PRICING_MANAGEMENT'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_BASEFILE_SETTING',3,1,(select FuncId from vc_quotn_Function where FuncName='FUN_PRICING_FOREIGN'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_PRICING_APPROVE',3,2,(select FuncId from vc_quotn_Function where FuncName='FUN_PRICING_FOREIGN'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SEARCH',3,3,(select FuncId from vc_quotn_Function where FuncName='FUN_PRICING_FOREIGN'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_SEARCH',3,4,(select FuncId from vc_quotn_Function where FuncName='FUN_PRICING_FOREIGN'),'',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_MASTER_SETTING',4,1,(select FuncId from vc_quotn_Function where FuncName='FUN_BASEFILE_SETTING'),'/Pricing/ForeignBaseM',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('FUN_HISTORY_QUERY',4,2,(select FuncId from vc_quotn_Function where FuncName='FUN_BASEFILE_SETTING'),'/Pricing/ForeignBaseHIndex',null,1,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_SET',5,1,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/Pricing/ForeignBaseM'),'BTN_SET',null,0,GETDATE(),GETDATE());
insert into vc_quotn_Function ([FuncName],[NodeId],[NodeSeq],[ParentId],[Url],[Icon],[Enabled],[CreateTime],[UpdateTime]) values ('BTN_QUERY',5,2,(select FuncId from vc_quotn_Function where FuncName='FUN_MASTER_SETTING' and NodeId=4 and NodeSeq=1 and Url='/Pricing/ForeignBaseM'),'BTN_QUERY',null,0,GETDATE(),GETDATE());

insert into vc_quotn_Group ([GrpName],[CreateTime],[Creator],[UpdateTime],[Updator])
values ('Admin',GETDATE(),'Admin',GETDATE(),'Admin');

insert into vc_quotn_GroupFunction ([GrpId] ,[FuncId] ,[CreateTime] ,[UpdateTime])
values (1,1,GETDATE(),GETDATE());
insert into vc_quotn_GroupFunction ([GrpId] ,[FuncId] ,[CreateTime] ,[UpdateTime])
values (1,2,GETDATE(),GETDATE());
insert into vc_quotn_GroupFunction ([GrpId] ,[FuncId] ,[CreateTime] ,[UpdateTime])
values (1,3,GETDATE(),GETDATE());
insert into vc_quotn_GroupFunction ([GrpId] ,[FuncId] ,[CreateTime] ,[UpdateTime])
values (1,4,GETDATE(),GETDATE());
insert into vc_quotn_GroupFunction ([GrpId] ,[FuncId] ,[CreateTime] ,[UpdateTime])
values (1,5,GETDATE(),GETDATE());
insert into vc_quotn_GroupFunction ([GrpId] ,[FuncId] ,[CreateTime] ,[UpdateTime])
values (1,6,GETDATE(),GETDATE());

insert into vc_quotn_Employee ([EmployeeId] ,[EmployeeAd] ,[EmployeeName] ,[DepartmentId] ,[Enabled] ,[GrpId] ,[CreateTime] ,[Creator] ,[UpdateTime] ,[Updator])
values ('2387','CHWu8',N'吳俊憲','ABDC','1',1,GETDATE(),'Admin',GETDATE(),'Admin');

insert into vc_quotn_SystemParam ([ParamId],[ParamName],[ParamValue],[ParamUm],[Order],[CreateTime],[Creator],[UpdateTime],[Updator]) VALUES (1,N'分頁','20',N'筆數','1',getdate(),'Admin',getdate(),'CHWu8');

CREATE TABLE [dbo].[vc_quotn_Pricing](
	[Seq] [uv_DefaultIntType] IDENTITY(1,1) NOT NULL,
	[EmployeeAd] [uv_EmpAdType] NOT NULL,	
	[Area] [dbo].[uv_AreaIdType] NOT NULL,
	[Category] [dbo].[uv_CategoryType] NOT NULL,
	[Product] [dbo].[BPProductType]  NOT NULL,
	[Color] [dbo].[uv_ColorType]  NOT NULL,
	[Thick] [dbo].[uv_ThickType], 
	[BaseCost][dbo].[uv_CostType],
	[C1Cost][dbo].[uv_CostType],
	[C2Cost][dbo].[uv_CostType],
	[C3Cost][dbo].[uv_CostType],	
	[StdCost][dbo].[uv_CostType],
	[ActCost] [dbo].[uv_CostType],
	[SubminiPrice] [dbo].[uv_PriceType],	
	[MiniPrice] [dbo].[uv_PriceType],
	[SmallPrice] [dbo].[uv_PriceType],	
	[MediumPrice] [dbo].[uv_PriceType],	
	[LargePrice] [dbo].[uv_PriceType],
	[CreateDate] [DateTimeType] NULL,
	[UpdateDate] [DateTimeType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[EmployeeAd] ASC,
	[Area] ASC,
	[Category] ASC,
	[Product] ASC,
	[Color] ASC,
	[Thick] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[vc_quotn_Quotation](
	[Seq] [uv_DefaultIntType] IDENTITY(1,1) NOT NULL,
	[QuotnId] uv_QuotnIdType  NOT NULL,	
	[EmployeeAd] [uv_EmpAdType] NOT NULL,	
	[CustNum] [dbo].[CustNumType] NOT NULL,
	[No] [dbo].[uv_DefaultIntType] NOT NULL,
	[Product] [dbo].[BPProductType]  NOT NULL,
	[Color] [dbo].[uv_ColorType]  NOT NULL,
	[Thick] [dbo].[uv_ThickType] NOT NULL,
	[Width]	[dbo].[uv_WidthType],
	[Length] [dbo].[uv_LengthType],
	[StdCost][dbo].[uv_CostType],
	[GrossRate] [dbo].[uv_PriceType],
	[Pricing] [dbo].[uv_PriceType],
	[PrePrice] [dbo].[uv_PriceType],
	[CurrPrice] [dbo].[uv_PriceType],
	[CpBrand] [dbo].[uv_Desc100Type],
	[CpModel] [dbo].[uv_Desc100Type],
	[CpPrice] [dbo].[uv_PriceType],
	[Memo]	[dbo].[uv_Memo100Type],
	[QuotnDesc] [dbo].[uv_Memo1000Type],
	[CreateDate] [DateTimeType] NULL,
	[UpdateDate] [DateTimeType] NULL,
PRIMARY KEY CLUSTERED 
(
	[Seq] ASC,
	[QuotnId] ASC,
	[EmployeeAd] ASC,
	[CustNum] ASC,
	[No] ASC,
	[Product] ASC,
	[Color] ASC,
	[Thick] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO