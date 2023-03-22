CREATE TABLE [dbo].[todos] (
    [id]        INT             IDENTITY (1, 1) NOT NULL PRIMARY KEY CLUSTERED ([Id] ASC),
    [title]     NVARCHAR (1000) NOT NULL,
    [completed] BIT             CONSTRAINT [DEFAULT_todo_completed] DEFAULT 0 NOT NULL,
    [owner_id]  NVARCHAR (200)  CONSTRAINT [DEFAULT_todo_owner_id] DEFAULT 'public' NOT NULL,
    [position]  INT             NOT NULL
);
GO

ALTER TABLE [dbo].[todos]
ENABLE CHANGE_TRACKING;