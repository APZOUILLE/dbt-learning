


with loc as(
    select pdt_SUB_CATEGORY, round(sum(CA), 2) as local_ca
    from {{ ref('stg_local_sales') }}
    group by pdt_SUB_CATEGORY
),
grouped as (
    select pdt_SUB_CATEGORY, round(sum(CA), 2) as group_ca
    from ({{ local_sales('crf_sales_group_data') }})
    group by pdt_SUB_CATEGORY
)

select *, local_ca-group_ca as difference
from loc
full join grouped
using (pdt_SUB_CATEGORY)