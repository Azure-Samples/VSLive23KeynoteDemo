# Visual Studio Live 2023 Keynote Demo

![License](https://img.shields.io/badge/license-MIT-green.svg)

This project contains the code that was shown in the Visual Studio Live 2023 Las Vegas Keynote demo.

## Features

This demo highlights the following features:

* Local full stack application development
* [Data API builder](https://github.com/Azure/data-api-builder)
* [Azure Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview)
* [Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview)
* JAM Stack Development

## Getting Started

### Prerequisites

To run this demo, you will need to have the following:

* VS Code
* Azure Data Studio
* [Azure Function Core Tools v4](https://www.npmjs.com/package/azure-functions-core-tools)
* Local .NET SDK 6+
* [Data API builder](https://github.com/Azure/data-api-builder/blob/main/docs/getting-started/getting-started.md)
* A database (docker and a local instance or an Azure SQL Database)

### Quickstart

* [Publish the todoApp SQL Project to a database with Azure Data Studio](https://learn.microsoft.com/sql/azure-data-studio/extensions/sql-database-project-extension)
* Update the connection-string in the staticwebapp.database.config.json file in the swa-db-connections folder with the username (USER), password (PASSWORD) and server name (SERVER_NAME) of your database
* Open a terminal in VS Code and run the following:
  * swa build
  * swa start **(if using IPV6 on your local development environment, append -q 127.0.0.1 to swa start "swa start -q 127.0.0.1")**
* Once swa is started, open a browser and go to https://localhost:4280/

## Folder Structure

* `/api`: the NodeJs Azure Function code used to provide the backend API, called by the Vue.Js client.
* `/client`: the Vue.Js client. Original source code has been taken from official Vue.js sample and adapted to call a REST client instead of using local storage to save and retrieve todos
* `/database`: the database projects to deploy the todos table and test via tSQLt
* `/swa-db-connections`: database connection information for Data API builder/swa