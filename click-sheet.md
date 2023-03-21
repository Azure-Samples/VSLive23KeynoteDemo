
# Visual Studio Live 2023 Keynote Demo Click Sheet

## Prerequisites

* VS Code
* ADS
* Local funcs
* Local .NET SDK 6+
* Go-sqlcmd
* Database project templates
* Git and repository forked
* Local swa with DAB
* Docker desktop


## Quickstart

1. Start with a browser open to the git hub repository forked from this repository. Copy the link to clone the repositoy.
2. Go to a terminal window and clone the repository locally

```BASH
git clone git@github.com:YOUR_GITHUB_USERNAME/vscode23Demo.git
```

1. Create a branch

```BASH
git checkout -b databaseDevBranch
```

1. Enter the repository main directory

```PWS
cd mainDirectory
```

1. Create a Database Project

```PWS
dotnet new sqlproj -n "todoApp" -tp "SqlAzureV12"
```

1. Create a database locally with go-sqlcmd

```PWS
sqlcmd create mssql -u tododb --accept-eula
```

1. Open ADS via SQL cmd

```PWS
sqlcmd open ads
```

1. Open the database project in Azure Data Studio by using the navigation on the left.

1. Use table designer to create the todo table

```SQL
CREATE TABLE [dbo].[todos] (
    [id]        INT             IDENTITY (1, 1) NOT NULL PRIMARY KEY CLUSTERED ([Id] ASC),
    [title]     NVARCHAR (1000) NOT NULL,
    [completed] BIT             CONSTRAINT [DEFAULT_todo_completed] DEFAULT 0 NOT NULL,
    [owner_id]  NVARCHAR (200)  CONSTRAINT [DEFAULT_todo_owner_id] DEFAULT 'public' NOT NULL,
    [position]  INT             NOT NULL
);
```

1. Publish the table to the existing database using Azure Data Studio

1. Commit the code back to git on the branch

```PWS
git add .
git commit -m "database work"
git push --set-upstream origin databaseDevBranch
```
