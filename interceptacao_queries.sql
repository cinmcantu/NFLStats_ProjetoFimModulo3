-- TABELA ANALISADA
-- As tabelas analisadas contam apenas com dados que tenham alguma relação
-- com o New England Patriots (NE)

-- Tabela interceptions
-- 	Tabela mostra todas as interceptações que o time os jogadores do 
-- 	New England Patriots (NE) realizaram.

-- Uma interceptação é quando um jogador da defesa intercepta a bola
-- que foi arremessada, normalmente pelo QB, do time atacante.
-- Essa jogada gera uma inversão da posse de bola, ou seja, o time que está
-- atacando vai para defesa e vice-versa.

-- Caso o jogador que interceptou a bola não seja tocado por niguém do outro time,
-- ele pode continuar com a jogada e, inclusive, fazer um touchdown.

use patriots_stats_nfl;

-- PERGUNTAS

-- 1-) Quantas interceptações o NE conseguiu realizar em cada quarto
SELECT plays.quarter,
	count(interceptions.intTd) AS interceptacoes
FROM interceptions
INNER JOIN plays
on interceptions.playId = plays.playId
group by plays.quarter
order by plays.quarter desc;


-- 2-) Quantas dessas interceptações resultaram em um touchdown
-- TOTAL
SELECT case interceptions.intTd
		when 1
        then 'TD'
        when 0
        then '-'
	end as Touchdown,
    count(*) as TD
FROM interceptions
group by interceptions.intTd
;

-- POR QUARTO
SELECT plays.quarter,
	case interceptions.intTd
		when 1
        then 'TD'
        when 0
        then '-'
	end as Touchdown,
	count(interceptions.intTd) AS interceptacoes
FROM interceptions
INNER JOIN plays
on interceptions.playId = plays.playId
group by plays.quarter, interceptions.intTd
order by plays.quarter desc;


-- 3-) Qual posição mais realiza interceptações
select interceptions.intPosition as posicao,
count(*) as Total_interceptacoes
from interceptions
group by interceptions.intPosition
order by Total_interceptacoes desc;

-- 4-) Quais 5 jogadores que mais conseguiam realizar interceptações
select draft.nameFull as nome,
count(interceptions.interceptionId) as total_interceptacoes,
draft.position as posicao,
draft.draft as ano_draft
 from draft
inner join interceptions
on interceptions.playerId = draft.playerId
group by draft.nameFull, draft.position, draft.draft
order by total_interceptacoes desc
limit 5;


