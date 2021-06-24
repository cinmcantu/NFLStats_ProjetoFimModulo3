use projeto_NFL;

#Quantidade de jardas avançadas que geraram touchdown
select draft.nameFull as 'Nome do Jogador', sum(passer.passLength) as 'Jardas avançadas' 
from passer inner join draft
on passer.playerId = draft.playerId
where passTd > 0 
group by draft.nameFull
order by sum(passer.passLength) desc limit 5;

#Quantidade de jardas avançadas que não geraram touchdown
select draft.nameFull as 'Nome do Jogador', sum(passer.passLength) as 'Jardas avançadas' 
from passer inner join draft
on passer.playerId = draft.playerId
where passTd = 0 
group by draft.nameFull
order by sum(passer.passLength) desc limit 5;

#Os 5 que mais deram passes no patriots
select draft.nameFull as 'Nome do Jogador', count(passer.passComp) as 'Núm.Passes' 
from passer inner join draft
on passer.playerId = draft.playerId
group by draft.nameFull
order by sum(passer.passComp) desc limit 5;




