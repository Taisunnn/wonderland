SELECT product_category_name_english, SUM(price) AS total FROM {{ source("PC_FIVETRAN_DB", "OLIST_PRODUCTS_DATASET_CSV") }} prod

LEFT JOIN {{ source("PC_FIVETRAN_DB", "OLIST_ORDER_ITEMS_DATASET_CSV") }} ord
ON prod.product_id = ord.product_id

LEFT JOIN {{ source("PC_FIVETRAN_DB", "PRODUCT_CATEGORY_NAME_TRANSLATION_CSV") }} trans
ON trans.product_category_name = prod.product_category_name

GROUP BY product_category_name_english

ORDER BY SUM(price) DESC

