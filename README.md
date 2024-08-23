# Receipt Analysis Project

## Overview

This project focuses on analyzing a sample retail receipt using two different data modeling approaches: the *Star Schema* and the *Data Vault model*. The analysis captures various aspects of the receipt, such as products, discounts, Smart Shopper points, and VAT, to provide insights into sales performance and customer behavior.

## Project Structure

The repository is organized as follows:

- *SQL Scripts*: Contains all the SQL scripts used to create and populate the databases for both the Star Schema and Data Vault models.
  - `star_schema.sql`: Script to create and populate the Star Schema database.
  - `data_vault.sql`: Script to create and populate the Data Vault database.
 
You can find these SQL scripts in the [SQL_Scripts](SQL_Scripts/) folder.
  
- *Diagrams*
  - **Star Schema Diagram**: Provides a visual overview of the Star Schema model, showing the fact and dimension tables and their relationships.
  - **Data Vault Diagram**: Displays the Data Vault model, including hubs, links, and satellites, and their connections.

You can find these diagrams in the [Diagrams](Diagrams/) folder.

- *Receipt Image*

For reference, the image of the receipt used in this analysis is available in the [Receipts](Receipts/) folder:



This receipt was used to generate the data for both the Star Schema and Data Vault models.

- *README.md*: This file, providing an overview of the project, setup instructions, and additional resources.

## Setup Guide

1. *Install MySQL*

If you don't have MySQL installed on your system, you can download and install it from the official MySQL website:

- **Download MySQL**: [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/)

Follow the installation instructions provided on the website for your operating system.

2. *Clone the Repository*:
   ```bash
   git clone https://github.com/CRMawande/Receipt_Analysis.git

3. *Set Up MySQL Database*:

Import the star_schema.sql and data_vault.sql files into your MySQL database.
Use tools like MySQL Workbench for easier management and visualization.

  
## Contributing
Contributions are welcome! Please fork the repository and submit a pull request if you have any improvements or additional features to add.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact
For any questions or suggestions, please feel free to reach out:

Name: Charmaine Mawande

Email: [charmaine.mawande@iu-study.org] 
