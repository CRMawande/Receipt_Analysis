# Receipt Analysis Project

## Overview

This project focuses on analyzing a sample retail receipt using two different data modeling approaches: the *Star Schema* and the *Data Vault model*. The analysis captures various aspects of the receipt, such as products, discounts, Smart Shopper points, and VAT, to provide insights into sales performance and customer behavior.

## Project Structure

The repository is organized as follows:

- *SQL Scripts*: Contains all the SQL scripts used to create and populate the databases for both the Star Schema and Data Vault models.
  - `star_schema.sql`: Script to create and populate the Star Schema database.
  - `data_vault.sql`: Script to create and populate the Data Vault database.
  
- *Diagrams*
  - **Star Schema Diagram**: Provides a visual overview of the Star Schema model, showing the fact and dimension tables and their relationships.
  - **Data Vault Diagram**: Displays the Data Vault model, including hubs, links, and satellites, and their connections.

You can find these diagrams in the [Diagrams](Diagrams/) folder.

- *README.md*: This file, providing an overview of the project, setup instructions, and additional resources.

## Installation

To set up this project locally, follow these steps:

1. *Clone the Repository*:
   ```bash
   git clone https://github.com/CRMawande/Receipt_Analysis.git

2. *Set Up MySQL Database*:

Import the star_schema.sql and data_vault.sql files into your MySQL database.
Use tools like MySQL Workbench for easier management and visualization.

3. *Generate Diagrams*:

You can use MySQL Workbench's reverse engineering feature to generate and view the EER diagrams based on the SQL scripts provided.

## Usage
After setting up the databases, you can execute queries to perform various analyses on the receipt data, such as:

+ Sales Performance: Calculate total sales, discounts given, and VAT for each product.

+ Smart Shopper Points Analysis: Determine the percentage of points earned based on the amount spent.
  
## Contributing
Contributions are welcome! Please fork the repository and submit a pull request if you have any improvements or additional features to add.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact
For any questions or suggestions, please feel free to reach out:

Name: Charmaine Mawande

Email: [charmaine.mawande@iu-study.org] 
