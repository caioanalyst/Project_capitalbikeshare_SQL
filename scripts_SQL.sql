


/* 1- What is the average time (in seconds) for bike rental by type of member? */

select
	tipo_membro,
	avg(duracao_segundos) as 'media'
from exec5.tb_bikes
group by tipo_membro;


/* 2- What is the average time (in seconds) for bike rental by type of member and
by end station (where the bikes are delivered after renting)? */

select
	estacao_fim,
    data_fim,
    tipo_membro,
	avg(duracao_segundos) as 'media_movel'
from exec5.tb_bikes
group by estacao_fim, tipo_membro;


/* 3- What time of day (regardless of the month) did bike number W01182 have the highest number of
rents considering start date? */

select
	extract(hour from data_inicio) as hora
	count(duracao_segundos) as contagem,
from exec5.tb_bikes
where numero_bike = 'w01182'
group by hora
order by contagem desc;


/* 4- What is the average time (in seconds) for bike rental by type of member and
by end station (where bikes are delivered after rental) over time? */

select
	estacao_fim,
	tipo_membro,
	avg(duracao_segundos) over (partition by tipo_membro order by data_inicio) as media_tempo_aluguel
from exec5.tb_bikes;


/* 5- What is the number of rentals of the bike number W01182 over time considering the
start date? */

select
	cast(data_inicio as date) as data_inicio,
	count(duracao_segundos) over (partition by estacao_inicio order by cast(data_inicio as date)) as num_alugueis
from exec5.tb_bikes
where numero_bike = 'w01182'
order by data_inicio;


/* 6- Return:
End station, end date of each bike rental and duration of each rental in seconds
Number of bike rentals (regardless of season) over time
Only the records when the end date was in the month of April */

select
	estacao_fim,
	data_fim,
	duracao_segundos,
	count(duracao_segundos) over (order by data_fim) as numero_alugueis
from exec5.tb_bikes
where extract(month from data_fim) = 04;


/* 7- Return:
End station, end date and duration in seconds of the rental
The end date must be returned in the format: 01/January/2012 00:00:00
We want the order (rank or ranking) of rental days over time
Return data for rentals between 7 am and 11 am */

select
	estacao_fim,
	date_format (data_fim, "%d%M%Y %H:%i:%S") as data_fim,
	duracao_segundos,
	dense_rank() over (partition by estacao_fim order by cast(data_fim as date)) as ranking_aluguel
from exec5.tb_bikes
where extract(hour from data_fim) between 07 and 11;


/* 8- What is the difference in the duration of bike rental over time,
from one record to another, considering rental start date and start season?
The start date must be returned in the format: Sat/Jan/12 00:00:00 (Sat = Day of the week
abbreviated and Jan equals abbreviated month). Return data for rentals between 01 and 03 am */

select
	estacao_inicio,
	date_format(data_inicio, "%a/%b/%y %H:%i:%S") as data_inicio,
	duracao_segundos,
	duracao_segundos - lag(duracao_segundos, 1) over (partition by estacao_inicio order by cast(data_inicio as date)) as diferenca
from exec5.tb_bikes
where extract(hour from data_fim) between 01 and 03;


/* 9- Return:
End station, end date and duration in seconds of the rental
The end date must be returned in the format: 01/January/2012 00:00:00
We want the records divided into 4 groups over time per partition
Return data for rentals between 8 am and 10 am
What criteria does the NTILE function use to split the groups? */

select
	estacao_fim,
	date_format(data_fim, "%d%M%Y %H:%i:%S") as data_fim,
	duracao_segundos,
	ntile(4) over (partition by estacao_fim order by cast(data_fim as date)) as ranking_aluguel
from exec5.tb_bikes
where extract(hour from data_fim) between 08 and 11;


/* # 10- Which seasons had more than 35 hours of total bike rental duration over the
time considering end date and end season?
Return data between days '2012-04-01' and '2012-04-02' */

select *
	from (
		select
		estacao_fim,
		cast(data_fim as date) as data_fim,
		sum(duracao_segundos/60/60) over (partition by estacao_fim order by cast(data_fim as date)) as tempo_total_horas
	from exec5.tb_bikes
	where data_fim between '2012-04-01' and '2012-04-02') as result
	where result.tempo_total_horas > 35
	order by result.estacao_fim;