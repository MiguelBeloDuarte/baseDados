-- exerc_1 --
SELECT customer_id, first_name, last_name FROM sales.customers WHERE phone IS NULL AND state = 'TX'
SELECT customer_id, first_name, last_name FROM sales.customers WHERE phone IS NOT NULL AND state = 'CA'
SELECT store_id, store_name FROM sales.stores WHERE zip_code = 95060 OR zip_code = 75088
SELECT first_name, last_name, email, phone FROM sales.staffs s WHERE s.email LIKE '%serrano%'