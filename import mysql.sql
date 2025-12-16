import mysql.connector

# Connect to MySQL (NO database yet)
conn = mysql.connector.connect(
    host="localhost",
    user="root",          # change if needed
    password="yourpassword"  # change this
)

cursor = conn.cursor()

# 1. Create database
cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

# 2. Select database
cursor.execute("USE alx_book_store")

# 3. Create Authors table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
)
""")

# 4. Create Books table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)
""")

# 5. Create Customers table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
)
""")

# 6. Create Orders table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
""")

# 7. Create Order_Details table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)
""")

# 8. Show tables
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()

print("Tables in alx_book_store:")
for table in tables:
    print(table[0])

# Save changes and close connection
conn.commit()
cursor.close()
conn.close()
