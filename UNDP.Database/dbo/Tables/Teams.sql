CREATE TABLE [dbo].[Teams] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [TeamName]           NVARCHAR (100) NULL,
    [TeamDescription]    NVARCHAR (MAX) NULL,
    [ApprovedByManager]  INT            DEFAULT ((0)) NOT NULL,
    [ApprovedByDirector] INT            DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

