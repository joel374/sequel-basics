USE practice_db_2202;

SELECT * FROM products;
SELECT * FROM categories;

SELECT product_name, category_name, p.category_id, c.id 
FROM products p 
JOIN categories c
ON p.category_id = c.id;

-- inner hanya mengambil irisan saja
-- left join products
-- right join categories
START TRANSACTION;
DELETE FROM products WHERE id=7;
SELECT * FROM products
COMMIT;
ROLLBACK;
