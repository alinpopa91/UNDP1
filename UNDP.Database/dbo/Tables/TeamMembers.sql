CREATE TABLE [dbo].[TeamMembers] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [TeamID]      INT            NULL,
    [Name]        NVARCHAR (100) NULL,
    [Gender]      NVARCHAR (6)   NULL,
    [DateOfBirth] DATE           NULL,
    [ContactNo]   NUMERIC (15)   NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([TeamID]) REFERENCES [dbo].[Teams] ([ID])
);

