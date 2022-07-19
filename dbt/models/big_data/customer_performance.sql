SELECT customer_city, SUM(price) AS total FROM {{ source("PC_FIVETRAN_DB", "OLIST_ORDERS_DATASET_CSV") }} orders

LEFT JOIN {{ source("PC_FIVETRAN_DB", "OLIST_ORDER_ITEMS_DATASET_CSV") }} items
ON orders.order_id = items.order_id

LEFT JOIN {{ source("PC_FIVETRAN_DB", "OLIST_CUSTOMERS_DATASET_CSV") }} customer
ON customer.customer_id = orders.customer_id

GROUP BY customer_city

ORDER BY SUM(price) DESC