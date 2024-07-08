# ShopSmart ETL Pipeline


## SQL QUERY
**What are the top 2 best-selling products?**

    SELECT  t.product_id, p.product_name, SUM(t.quantity) as n_quantity
    FROM transactions t inner join products p
    on t.product_id =  p.product_id
    GROUP BY t.product_id, p.product_name
    ORDER BY n_quantity DESC
    LIMIT 2 

**What is the average order value per customer?**

    SELECT customer_id, AVG(quantity * price) as average_order_value
    FROM transactions
    GROUP BY customer_id
    ORDER BY customer_id

**What is the total revenue generated per product category?**

    SELECT p.category, SUM(t.quantity * t.price) as total_revenue
    FROM transactions t
    INNER JOIN products p ON t.product_id = p.product_id
    GROUP BY p.category
    ORDER BY total_revenue DESC

## Approach and Design Decisions

### Data Ingestion
- **Format and Source:**
  -  Use JSON format for customer transactions and CSV format for the product catalog.

### Data Transformation
- **Data Cleaning:**
  - Remove invalid prices, update product names,remove duplicated rows, and handle missing values using Pandas.

### Data Storage
- **Database:**
  - Use PostgreSQL for storing processed data and connect to the database with SQLAlchemy

### Dockerization
- **Containerization:**
  - Use Docker to containerize the ETL pipeline and PostgreSQL database.
- **Orchestration:**
  - Use Docker Compose to manage multiple containers.

## Justification
- I used Pandas because it is a great tool for data cleaning and transformation. PostgreSQL, along with SQLAlchemy, ensures reliable data management and efficient queries. Docker and Docker Compose provide consistent environments and make managing multiple containers easy.



