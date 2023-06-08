INSERT INTO leagues(league_id, league) 
VALUES (1, 'Superliga');

--     PLAYER VS PLAYER   --

-- Win Ratio --

select p.nick as Player, pl.nick as PlayerVs, (AVG(gt.Winned)*100) as Winrate 
from games_teams as gt
inner join players as p
on gt.player_id4 = p.player_id
inner join players as pl
on gt.player_id9 = pl.player_id
where p.nick = 'Flakked' and pl.nick = 'Attila';

-- Nº DE ENCUENTROS --

select p.nick as Player, pl.nick as PlayerVs, count(gt.teamVs_id) as 'Nº De Encuentros'
from games_teams as gt
inner join players as p
on gt.player_id4 = p.player_id
inner join players as pl
on gt.player_id9 = pl.player_id
where p.nick = 'Flakked' and pl.nick = 'Attila';

-- Campeón más usado VS -- 

SELECT cg.Champion, (COUNT(*)/2) AS frecuencia
FROM games_teams as gt
inner join players as p
on gt.player_id4 = p.player_id
inner join players as pl
on gt.player_id9 = pl.player_id
inner join games_players as gp
on p.player_id = gp.players_id
inner join champs_global as cg
on gp.champs_id = cg.champs_id
where p.nick = 'Flakked' and pl.nick = 'Attila' and gt.teamVs_id = gp.teamVs_id and gt.split_id = gp.split_id
GROUP BY gp.champs_id;


--     DATOS JUGADOR EN SOLITARIO  --

-- Frecuencia de Campeones --

SELECT cg.Champion, COUNT(*) AS frecuencia
FROM games_players as gp
inner join champs_global as cg
on gp.champs_id = cg.champs_id
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila'
GROUP BY gp.champs_id;

-- Número total de partidos --

select  p.nick as Player, count(gp.gameP_id) as 'Nº De Partidos'
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila';

-- Nº de Kills -- 

select p.nick as Player, sum(gp.kills) as 'Nº De kills'
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila';