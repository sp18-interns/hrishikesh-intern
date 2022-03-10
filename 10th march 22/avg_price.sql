
-- AVG price of item of each company

SELECT avg(PRO_PRICE), cm.COMP_NAME
from item_mast im
inner join company_mast cm
on im.PRO_COM = cm.COMP_ID
group by cm.COMP_NAME;



