select penalties.penaltyDescrip, count(penalties.penaltyDescrip) from games
inner join plays using(gameId)
inner join penalties using(playId)
where games.winningTeam <> 3200
group by penalties.penaltyDescrip
order by count(penalties.penaltyDescrip) desc
limit 4;