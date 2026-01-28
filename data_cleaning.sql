-- Remove duplicate rows
DELETE FROM sales_data
WHERE id NOT IN (
    SELECT MIN(id)
    FROM sales_data
    GROUP BY customer_id, order_date
);

-- Handle NULL values
UPDATE sales_data
SET revenue = 0
WHERE revenue IS NULL;

-- Standardize text
UPDATE sales_data
SET customer_name = UPPER(customer_name);
