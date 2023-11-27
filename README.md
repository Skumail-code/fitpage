Stock Scan Mobile Replica Documentation

Overview
This mobile application is a replica of the web application available at http://coding-assignment.bombayrunning.com/. 
It provides a list view of stock market scans, each potentially containing multiple sub-criteria.

Architecture
The application is built using the Flutter framework. 
The codebase follows a modular structure, separating concerns into different files and directories for improved maintainability.

Components
1. main.dart
Description: The entry point of the application.
Responsibilities:
Initializes the app.
Sets up the main Flutter app widget.
Directs to the HomePage widget.

3. HomeScreen.dart
Description: Displays a list of stock market scans.
Responsibilities:
Fetches stock market scan data.
Renders a list of scans.
Navigates to the DetailScreen when a scan is tapped.

5. DetailScreen.dart
Description: Shows detailed information about a selected stock scan.
Responsibilities:
Fetches detailed information about a specific stock scan.
Renders the details, including text and variables.
Navigates to the VariableScreen for variable details.

7. VariableScreen.dart
Description: Displays variable values for a selected stock scan.
Responsibilities:
Fetches and displays variable values for the selected stock scan.
Highlights variables explicitly for readability.

Code Structure
The codebase is organized into modular files and directories for improved maintainability.

Dependencies
http for making HTTP requests to fetch data.
test for testing the application.

Testing
Two test files are included to ensure code reliability:

main_test.dart: Tests related to the main application entry point.
DetailScreen_test.dart: Tests for the detailed information screen.
To run the tests, use the command flutter test.

How to Run
To run the application locally:

Clone the repository.
Open the project in your development environment.
Ensure Flutter dependencies are installed by running flutter pub get.
Run the application using the command flutter run.

Variations from the Web Application
Variable Incorporation: Variables are explicitly highlighted for improved readability.

Known Issues
Currently, there are no known issues.

