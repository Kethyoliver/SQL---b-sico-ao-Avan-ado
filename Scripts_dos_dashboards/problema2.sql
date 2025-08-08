-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads(#)
select

	case

		when ibge.gender = 'male' then 'homens'
		when ibge.gender = 'female' then 'mulheres'
		end as "gênero",
	count(*) as "leads (#)"
	
from sales.customers as cus
left join temp_tables.ibge_genders as ibge
	on lower(cus.first_name) = lower(ibge.first_name)
group by ibge.gender

-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)
select distinct professional_status
from sales.customers

select

	case
		when professional_status = 'freelancer' then 'freelancer'
		when professional_status = 'retired' then 'aposentado'
		when professional_status = 'clt' then 'clt'
		when professional_status = 'self_employed' then 'autônomo(a)'
		when professional_status = 'other' then 'outros'
		when professional_status = 'businessman' then 'empresário(a)'
		when professional_status = 'civil_servant' then 'funcionário(a) público(a)'
		when professional_status = 'student' then 'estudante'
		end as "status profissional",
		(count(*)::float)/(select count(*) from sales.customers) as "leads (%)"
from sales.customers 
group by professional_status
order by "leads (%)"

-- (Query 3) Faixa etária dos leads
-- Colunas: faixa etária, leads (%)
select

	case 
		when datediff('years', birth_date, current_date) < 20 then '0-20'
		when datediff('years', birth_date, current_date) < 40 then '20-40'
		when datediff('years', birth_date, current_date) < 60 then '40-60'
		when datediff('years', birth_date, current_date) < 80 then '60-80'
		else '80+' end "faixa etária",
		count(*)::float/(select count(*) from sales.customers) as "leads (%)"
		

from sales.customers 
group by "faixa etária"
order by "faixa etária" desc
-- (Query 4) Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem



-- (Query 5) Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negócio: Veículos novos tem até 2 anos e seminovos acima de 2 anos



-- (Query 6) Idade dos veículos visitados
-- Colunas: Idade do veículo, veículos visitados (%), ordem




-- (Query 7) Veículos mais visitados por marca
-- Colunas: brand, model, visitas (#)












