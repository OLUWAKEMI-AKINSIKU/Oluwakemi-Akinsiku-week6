# Week 6 Project - Oluwakemi Akinsiku

## Project Overview
This project involves creating a GitHub repository with automated workflows, setting up a data retrieval script, and managing data versions. The aim is to automate data collection from an API and organize it by different versions using branches. The project also implements GitHub Actions to check code quality.

## Key Components
1. **GitHub Repository**: 
   - Repository named `Oluwakemi-Akinsiku-week6`.
   - Contains organized folders and files for automation and data management.

2. **Data Retrieval Script (`retrieve_data.sh`)**:
   - Fetches data from the RESTful API (https://jsonplaceholder.typicode.com/photos).
   - Retrieves specific data versions and saves them as JSON files.
   - Checks for changes in data and only updates when there are differences.

3. **Version Control**:
   - Branches created for each data version: `data-v1.0`, `data-v1.1`, and `data-v1.2`.
   - The `params.yml` file defines version and size details for each version.

4. **GitHub Actions**:
   - Automated workflow with Super-Linter for code quality checks.
   - Ensures that scripts meet coding standards.

## Files and Directories
- `.github/workflows/code_linter.yml`: Workflow file for GitHub Actions to perform code quality checks.
- `datahub/`: Directory where `data.json` is stored.
- `retrieve_data.sh`: Script to fetch data and check for changes.
- `params.yml`: File with version and size configurations for data retrieval.
- `README.md`: This file, describing the project.

## How to Run
1. **Clone the Repository**:
   ```bash
   git clone git@github.com:OLUWAKEMI-AKINSIKU/Oluwakemi-Akinsiku-week6.git
   cd Oluwakemi-Akinsiku-week6
   ```
2. **Run the Data Retrieval Script**:
   ```bash
   bash retrieve_data.sh
   ```
   - The script will fetch the data based on the version specified in `params.yml`.
   - Updates `datahub/data.json` if new data is retrieved.

3. **GitHub Actions**:
   - Push changes to the repository to trigger GitHub Actions and run code checks.

## Project Contributors
- Oluwakemi Akinsiku
