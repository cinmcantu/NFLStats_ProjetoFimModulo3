-- 10 passes mais longo que geraram um tochdown
SELECT patriots_draft.nameFull AS Atleta, patriots_passer.passLength AS 'Profundidade dos Passes'
FROM patriots_draft JOIN patriots_passer
ON patriots_draft.playerId = patriots_passer.playerId
WHERE patriots_passer.passTd = 1
ORDER BY passLength DESC LIMIT 10;

-- quantidades de passes longos que geram tochdown
SELECT count(patriots_passer.passDepth) AS 'Passes Longos', patriots_draft.nameFull AS Atleta
FROM patriots_passer JOIN patriots_draft
ON patriots_passer.playerId = patriots_draft.playerId
WHERE patriots_passer.passDepth = 'deep' AND patriots_passer.passTd = 1
GROUP BY patriots_passer.playerId,  patriots_draft.nameFull
ORDER BY count(patriots_passer.passDepth) DESC;


-- Passes curtos e longos
-- Passes ao todo
select patriots_draft.nameFull as Atleta, 
count(patriots_passer.playerId) as 'Número de Passes',
case
when
patriots_passer.passDepth = 'deep'
then 
'Longo'
when 
patriots_passer.passDepth = 'short'
then 
'Curto'
end as Passes
from patriots_passer join patriots_draft
on patriots_passer.playerId = patriots_draft.playerId
where patriots_passer.playerId = 20000199 and patriots_passer.passDepth in ('deep','short') 
group by patriots_draft.nameFull, Passes
order by count(patriots_passer.playerId) desc;

-- Que geraram touchdown
select patriots_draft.nameFull as Atleta, 
count(patriots_passer.playerId) as 'Número de Passes',
case
when
patriots_passer.passDepth = 'deep'
then 
'Longo'
when 
patriots_passer.passDepth = 'short'
then 
'Curto'
end as Passes
from patriots_passer join patriots_draft
on patriots_passer.playerId = patriots_draft.playerId
where patriots_passer.playerId = 20000199 and patriots_passer.passDepth in ('deep','short') and patriots_passer.passTd = 1
group by patriots_draft.nameFull, Passes
order by count(patriots_passer.playerId) desc;

-- Comparação de passes completos, incompletos, sacks e interceptações
-- Brady
select patriots_draft.nameFull as Atleta,  patriots_passer.passOutcomes as Passes,
count(patriots_passer.playerId) as 'Número de Passes' 
from patriots_passer join patriots_draft
on patriots_draft.playerId = patriots_passer.playerId
where patriots_passer.playerId in ( 20000199, 20050230)
group by patriots_passer.passOutcomes, Atleta
order by count(patriots_passer.playerId) desc;
-- Matt Cassel
select patriots_draft.nameFull as Atleta,  patriots_passer.passOutcomes as Passes,
count(patriots_passer.playerId) as 'Número de Passes' 
from patriots_passer join patriots_draft
on patriots_draft.playerId = patriots_passer.playerId
where patriots_passer.playerId = 20050230
group by patriots_passer.passOutcomes, Atleta
order by count(patriots_passer.playerId) desc;