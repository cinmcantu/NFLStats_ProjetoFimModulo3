select g.gameid, g.visitingTeamFinalScore, g.homeTeamFinalScore, p.formation from games g  
inner join plays p
on g.gameid = p.gameid
where g.gameid = 29341 and formation is not null
order by visitingTeamFinalScore desc limit 1;