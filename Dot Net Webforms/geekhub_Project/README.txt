# GeekHub Project Setup Guide

Welcome to the GeekHub project! Follow these steps to get the project up and running on your local machine. This guide will walk you through restoring the database from a backup file and configuring the project to connect to the database.

## Step 1: Restore the Database

1. **Open SQL Server Management Studio (SSMS)**:
   - If you don’t have SQL Server Management Studio installed, download and install it from the [Microsoft website](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15).

2. **Connect to Your SQL Server Instance**:
   - Launch SSMS and connect to your SQL Server instance using the appropriate server name, authentication mode, and credentials.

3. **Restore the Database**:
   - In the Object Explorer, right-click on the `Databases` node and select `Restore Database...`.
   - In the `Restore Database` window, select `Device` and click the `...` button to browse for the `.bak` file.
   - Click `Add` and locate your `greekhubDB_project.bak` file on your local machine.
   - After selecting the file, click `OK`.
   - In the `Destination` section, enter `greekhubDB_project` as the database name.
   - Go to the `Files` page and ensure the `Restore As` paths are correct for your environment.
   - Click `OK` to start the restore process.

4. **Verify the Restoration**:
   - Once the restoration is complete, you should see `greekhubDB_project` listed under the `Databases` node in Object Explorer.

## Step 2: Update the Connection String

1. **Locate the `web.config` File**:
   - In your project directory, find the `web.config` file. This file contains configuration settings for your project.

2. **Open the `web.config` File**:
   - Open the `web.config` file using a text editor (e.g., Notepad, Visual Studio Code).

3. **Find the Connection String Section**:
   - Look for the `<connectionStrings>` section within the `web.config` file. It should look something like this:


     <connectionStrings>
       <add name="GeekHubConnectionString" connectionString="Data Source=your_server_name;Initial Catalog=greekhubDB_project;Integrated Security=True" providerName="System.Data.SqlClient" />
     </connectionStrings>


4. **Update the Connection String**:
   - Replace `your_server_name` with the name of your SQL Server instance. If you are using SQL Server Express, it might be something like `localhost\SQLEXPRESS`.
   - Ensure that `Initial Catalog=greekhubDB_project` matches the name of your restored database.

     For example, if your SQL Server instance name is `localhost` and you are using integrated security, your connection string might look like this:

     ```xml
     <connectionStrings>
       <add name="GeekHubConnectionString" connectionString="Data Source=localhost;Initial Catalog=greekhubDB_project;Integrated Security=True" providerName="System.Data.SqlClient" />
     </connectionStrings>
     ```

5. **Save the Changes**:
   - Save the `web.config` file and close the text editor.

## Step 3: Test the Configuration

1. **Run the Project**:
   - Open the project in Visual Studio (or your preferred development environment) and build the solution.
   - Start the project to ensure it connects to the database correctly.

2. **Verify Functionality**:
   - Navigate through the application to verify that data is being retrieved and displayed as expected.

## Troubleshooting

- **Database Connection Issues**: If you encounter any issues connecting to the database, double-check your SQL Server instance name and credentials in the connection string.
- **Permission Errors**: Ensure that your SQL Server instance is configured to allow connections from your application, and that your user account has appropriate permissions.
