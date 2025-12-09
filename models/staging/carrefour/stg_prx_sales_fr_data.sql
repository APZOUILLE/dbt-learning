
select  CAST(barcode_ean13 AS INT) AS barcode_ean13,
        CAST(site_key AS INT) AS site_key,
        CAST(product_CATEGORY AS STRING) AS product_CATEGORY,
        CAST(pdt_SUB_CATEGORY AS STRING) AS pdt_SUB_CATEGORY,
        CAST(DATE AS DATE) AS DATE,
        CAST(CA AS FLOAT64) AS CA
from {{ source('carrefour', 'crf_prx_sales_fr_data') }}