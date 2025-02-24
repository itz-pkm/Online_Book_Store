# Online_Book_Store
Online_Book_Store is an end-to-end SQL Project.

## 📝 Project Description
Online_Book_Store is an end-to-end SQL project for gaining insights by analyzing sales of books across various cities and countries.
It has covered KPIs such as **Total Revenue Generated, Details of all Customers of Canada, Most Frequently Ordered Book, 
Total Quantity Sold, Avg. Price of Books of a Particular Genre, etc.** by running basic as well as advance queries.

## 💡 Purpose of Project
The purpose of project is to analyze the sales of books to extract useful insights which will further help stakeholders to make 
informed decisions for improving services and increasing sales.

## 🎯 Key Features
- **Basic Queries -** Mainly focused on extracting basic level insights about books.
- **Advance Queries -** Mainly focused on extracting advance level insights about order of books.

## 🛠️ Technologies Used
- **✅ PostgreSQL** for writing and running queries.
- **✅ Microsoft Excel** for cleaning and preparation of raw data.

## 📦 Installation & Setup
1. Download the File:
   -  Clone the repository using:
   ```sh
   git clone https://github.com/itz-pkm/Online_Book_Store.git
   ```
   -  Or download the .sql file directly from the repository.
2. Install PostgreSQL (if not installed):
   -  Ensure psql (PostgreSQL CLI) is accessible in your terminal.
3. Create a New Database:
   -  Open PostgreSQL and create a database:
   ```Sql
   CREATE DATABASE online_book_store;
   ```
4. Import the SQL Schema & Data:
   -  Run the following command to import the schema and sample data:
   ```Sh
   psql -U your_username -d
   online_book_store -f database/schema.sql
   psql -U your_username -d
   online_book_store -f database/data.sql
   ```
1. Verify Installation:
   -  Open psql and check if tables are created:
   ```Sql
   /dt
   ```

## 📌 Usage Guide
1. Connecting to the Database:
   -  Run the command:
   ```Sh
   psql -U your_username -d
   online_book_store
2. Executing Queries:
   -  Navigate to the queries folder and run SQL queries as needed:
   ```Sql
   SELECT * FROM books;
   ```
   
## 🤝 Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository and create a new branch (feature-branch).
2. Make your changes (fix a bug, add a new feature, etc.).
3. Submit a pull request for review.

## 📄 License
This project is licensed under the MIT License.

## ⭐ Author & Acknowledgements
-  **Author:** Prince Kumar ([Github Profile](https://github.com/itz-pkm))
-  Special thanks to contributors and dataset providers.

## 🙋‍♂️ Contact & Support 
For any questions or support, please reach out via email at `prince.madheshiya3097@gmail.com` or open an issue in this repository.

  

