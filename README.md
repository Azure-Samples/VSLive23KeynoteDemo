# Visual Studio Live 2023 Keynote Demo

This project contains the code that was shown in the Visual Studio Live 2023 Las Vegas Keynote demo.

## Features

This demo highlights the following features:

* Local full stack application development
* [Data API builder](https://github.com/Azure/data-api-builder)
* [Azure Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/overview)
* [Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview)
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

* Publish the todoApp SQL Project to a database with Azure Data Studio
* Update the connection-string in the staticwebapp.database.config.json file in the swa-db-connections folder with the username (USER), password (PASSWORD) and server name (SERVER_NAME) of your database
* Open a terminal in VS Code and run the following:
  * swa build
  * swa start **(if using IPV6 on your local development environment, append -q 127.0.0.1 to swa start "swa start -q 127.0.0.1")**
* Once swa is started, open a browser and go to https://localhost:4280
