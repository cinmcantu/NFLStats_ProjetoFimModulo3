select gameId, count(penalties.penaltyDescrip) from games
inner join plays using(gameId)
inner join penalties using(playId)
where games.winningTeam <> 3200 and penalties.penaltyDescrip = 'Unnecessary Roughness'
group by gameId;
