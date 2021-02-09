use sql_store;

select * from order_items;

select * from order_items oi join sql_inventory.products sqip on oi.product_id = sqip.product_id;

use sql_inventory;

select * from products;