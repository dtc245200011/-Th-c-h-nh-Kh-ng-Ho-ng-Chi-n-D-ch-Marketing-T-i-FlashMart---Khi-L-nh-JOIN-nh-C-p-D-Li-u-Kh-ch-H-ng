Prompt 1:
"In MySQL, what does JOIN (without LEFT/RIGHT) default to and why does it drop customers with no orders?"
Answer 1:
"JOIN defaults to INNER JOIN, which returns only rows with matching keys in both tables. Customers without matching orders are excluded."

Prompt 2:
"When using LEFT JOIN and counting orders, should I use COUNT(*) or COUNT(o.order_id)? Why?"
Answer 2:
"Use COUNT(o.order_id). COUNT(*) counts rows after join; COUNT(o.order_id) counts only non-NULL order_id values, giving 0 for no orders."

Prompt 3:
"Compare performance: LEFT JOIN ... WHERE o.id IS NULL vs NOT IN (subquery) for anti-join in MySQL."
Answer 3:
"LEFT JOIN ... IS NULL is generally clearer and often performs well with proper indexes. NOT IN can be problematic with NULLs and may be slower; NOT EXISTS or LEFT JOIN IS NULL are preferred."
