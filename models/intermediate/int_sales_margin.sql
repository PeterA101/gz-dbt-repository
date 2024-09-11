SELECT
    s.products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    p.quantity,
    p.purchase_price,
    ROUND(p.quantity * p.purchase_price, 2) AS purchase_cost,
    ROUND(s.revenue - (p.quantity * p.purchase_price), 2) AS margin
FROM {{ ref("stg_raw__sales") }} s
LEFT JOIN {{ ref("stg_raw__product") }} p
    ON s.products_id = p.products_id