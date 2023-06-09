INSERT INTO leagues(league_id, league) 
VALUES (1, 'Superliga');

-- DISTINTAS QUERYS DE EJEMPLO PARA PROBAR QUE DATOS SE PUEDEN SACAR CON LA BASE DE DATOS --


--     PLAYER VS PLAYER   --

-- KDA Vs Player --

select p.nick as Player, pl.nick as PlayersVs, sum(gp.Kills)/2 as 'Total Kills',sum(gp.Deaths)/2 as 'Total Deaths',sum(gp.Assists)/2 as 'Total Assists',  (((sum(gp.Kills)/2) + (sum(gp.Assists)/2))/(sum(gp.Deaths)/2)) as KDA 
from games_teams as gt
inner join players as p
on gt.player_id4 = p.player_id
inner join players as pl
on gt.player_id9 = pl.player_id
inner join games_players as gp
on p.player_id = gp.players_id
where p.nick = 'Flakked' and pl.nick = 'Attila'and gt.teamVs_id = gp.teamVs_id and gt.split_id = gp.split_id;

-- Win Ratio --

select p.nick as Jugador, pl.nick as JugadorVs, (AVG(gt.Winned)*100) as Winrate 
from games_teams as gt
inner join players as p
on gt.player_id4 = p.player_id
inner join players as pl
on gt.player_id9 = pl.player_id
where p.nick = 'Flakked' and pl.nick = 'Attila';

-- Nº DE ENCUENTROS --

select p.nick as Jugador, pl.nick as PlayerVs, count(gt.teamVs_id) as 'Nº De Encuentros'
from games_teams as gt
inner join players as p
on gt.player_id4 = p.player_id
inner join players as pl
on gt.player_id9 = pl.player_id
where p.nick = 'Flakked' and pl.nick = 'Attila';

-- Campeón más usado VS -- 

SELECT cg.Champion as Campeón, (COUNT(*)/2) AS frecuencia
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

SELECT cg.Champion as Campeón, COUNT(*) AS frecuencia
FROM games_players as gp
inner join champs_global as cg
on gp.champs_id = cg.champs_id
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila'
GROUP BY gp.champs_id;

-- Pentakills --

select p.nick as Jugador, sum(gp.Pentakill) as Pentakills
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila';

-- Número total de partidos --

select  p.nick as Jugador, count(gp.gameP_id) as 'Nº De Partidos'
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila';

-- Nº de Kills -- 

select p.nick as Jugador, sum(gp.kills) as 'Nº De kills'
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
where p.nick = 'Attila';

-- Veces Ganador del split --

select p.nick as Jugador,count(p.nick) as Títulos
from players as p
inner join `hist-players` as hp
on p.player_id =  hp.players_id 
inner join splits as s
on hp.split_id = s.split_id
inner join winners as w
on s.split_id = w.split_id 
where p.nick = 'Miniduke' and hp.split_id = w.split_id and hp.team_id = w.winnerteam_id;

-- JUGADOR VS EQUIPO --

-- KDA Vs Equipo --

select p.nick as Jugador, t.name as EquipoVs, sum(gp.Kills) as 'Total Kills',sum(gp.Deaths) as 'Total Deaths',sum(gp.Assists) as 'Total Assists',  ((sum(gp.Kills) + sum(gp.Assists))/sum(gp.Deaths)) as KDA 
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
inner join teams as t
on gp.teamVs_id = t.team_id
where p.nick = 'Attila' and t.name = 'Movistar Riders'; 

-- Winrate Vs Equipo -- 

select p.nick as Jugador, avg(gt.winned)*100 as 'Win Ratio'
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
inner join teams as t
on gp.teamVs_id = t.team_id
inner join games_teams as gt
on t.team_id = gt.teamVs_id
where p.nick = 'Attila' and t.name = 'Movistar Riders' and gp.team_id = gt.team_id and gp.players_id = gt.player_id4; 

-- Contra quien se hizo una penta --

select p.nick as Jugador, t.name as EquipoVs 
from games_players as gp
inner join players as p
on gp.players_id = p.player_id
inner join teams as t
on gp.teamVs_id = t.team_id
where p.nick = 'Attila' and gp.Pentakill = 1;

-- EQUIPO VS EQUIPO --

-- Nº de Encuentros --

select t.name as Equipo, tt.name as EquipoVs, count(tt.name) as 'Nº de Encuentros'
from games_teams as gt
inner join teams as t
on gt.team_id = t.team_id
inner join teams as tt
on gt.teamVs_id = tt.team_id
where t.name = 'Giants' and tt.name = 'Guasones';

-- Partida en la que más x --

select t.name as Equipo,  max(gt.Team1Dragons) as Dragones
from games_teams as gt
inner join teams as t
on gt.team_id = t.team_id
inner join teams as tt
on gt.teamVs_id = tt.team_id
where t.name = 'Giants';

-- Contra quien fue ese máximo --


select t.name as Equipo, tt.name as EquipoVs
from games_teams as gt
inner join teams as t
on gt.team_id = t.team_id
inner join teams as tt
on gt.teamVs_id = tt.team_id
where t.name = 'Giants' and gt.Team1Dragons = 6; -- Este dato lo saco de tirar la query de arriba --



-- Winrate Equipo Vs Equipo --

select t.name as Equipo, tt.name as EquipoVs, avg(gt.Winned)*100 as 'Win Ratio'
from games_teams as gt
inner join teams as t
on gt.team_id = t.team_id
inner join teams as tt
on gt.teamVs_id = tt.team_id
where t.name = 'Giants' and tt.name = 'BISONS ECLUB';


-- Campeones --

-- Dato del x máximo y luego campeon con el que se hizo --

select p.nick as Player ,max(hc.KDA)
from hist_champs as hc
left join `hist-players` as hp
on hc.players_id = hp.players_id
inner join players as p
on hp.players_id = p.player_id
inner join splits as s
on hc.split_id = s.split_id
inner join champs_global as cg
on hc.champs_id = cg.champs_id
where p.nick = 'Attila' and s.year = 2023 and s.split = 'Spring';


select p.nick as Player ,cg.Champion
from hist_champs as hc
left join `hist-players` as hp
on hc.players_id = hp.players_id
inner join players as p
on hp.players_id = p.player_id
inner join splits as s
on hc.split_id = s.split_id
inner join champs_global as cg
on hc.champs_id = cg.champs_id
where p.nick = 'Attila' and s.year = 2023 and s.split = 'Spring' and hc.KDA = 5.5;

