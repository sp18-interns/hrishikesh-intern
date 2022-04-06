-- Get Detail with columns
-- Prod_ID
-- Prod_Name
-- Prod_Price
-- Company_name

select  cm.COMP_ID, cm.COMP_NAME, im.PRO_NAME, im.PRO_PRICE, im.PRO_COM
from company_mast cm
inner join item_mast im on cm.COMP_ID = im.PRO_COM
order by PRO_PRICE;
	