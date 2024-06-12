#Ejercicio 2.1
Select distinct country 
from company
Join transaction
on company.id = transaction.company_id;

#Ejercicio 2.2
Select count(distinct country)
from company
Join transaction
on company.id = transaction.company_id;

#Ejercicio 2.3
#Prueba
Select company_id, avg(amount)
from transaction
group by company_id;

Select company_name, avg(amount) as media
from transaction
join company
on company.id = transaction.company_id
group by company_id
order by media desc
limit 1;


#Ejercicio 3.1
select *
from transaction
where company_id in (select id
					from company
					where country="Germany");
                    
#Ejercicio 3.2
select *
from company
where id in (select Company_id
				from transaction
				where amount > (Select avg(amount)
								from transaction));
                                
#Ejercicio 3.3
select *
from company
where not exists (Select distinct company_id from transaction);

#Como yo lo había entendido:
select *
from company
where id in (Select distinct company_id
					from transaction
					where declined = 1);

                    