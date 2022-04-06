-- List Min, Max price of item of each company
select  cm.COMP_ID, cm.COMP_NAME, im.PRO_NAME, im.PRO_PRICE, im.PRO_COM
from company_mast cm
inner join item_mast im 
on cm.COMP_ID = im.PRO_COM
order by PRO_PRICE
limit 1;
	
select  cm.COMP_ID, cm.COMP_NAME, im.PRO_NAME, im.PRO_PRICE, im.PRO_COM
from company_mast cm
inner join item_mast im 
on cm.COMP_ID = im.PRO_COM
order by PRO_PRICE desc
limit 1;