
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

### Part 1

1. Start with a browser open to the git hub repository forked from this repository. Copy the link to clone the repositoy.

1. Go to a terminal window and clone the repository locally

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

### Part 2

1. Start in VS Code by navigating to the repository main directory and issuing the following command:

    ```PWS
    code .
    ```

1. Initialize SWA environment and create data-api-builder config file

    ```PWS
    dab init --database-type "mssql" --connection-string "Server=localhost,1437;Database=tododb;User ID=btspendo;Password=XXXXXX;TrustServerCertificate=true" --host-mode "Development"
    ```

1. add the todo table to the dab config file

    ```PWS
    dab add todo --source dbo.todo --permissions "anonymous:*"
    ```

1. run DAB locally

    ```PWS
    dab start
    ```

1. In VS Code, create a new file of type HTTP. Using the rest client extension in VS Code, enter the following into the HTTP file and run the request:

    ```PWS
    GET https://localhost:5001/api/todo
    ```

Enter the following into the HTTP file and run the request:

```PWS
POST  https://localhost:5001/api/todo

{
    "title": "REST Task",
    "position": 1
}
```

1. Using ADS, query DB to show in the table

```SQL
select * from dbo.todos
```

1. Show REST endpoint in browser and JSON returned

```PWS
https://localhost:5001/api/todo
```

1. Run swa build in VS Code Terminal

```PWS
swa build
```

1. run swa start in VS Code Terminal

```PWS
swa start
```

1. Open the fully functional app in browser using the URL returned in the terminal window

1. Push to code to GitHub 

    ```PWS
    git add .
    git commit -m "database work"
    git push
    ```
