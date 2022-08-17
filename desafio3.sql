-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT CONCAT(us.first_name, ' ', us.last_name) AS usuario, COUNT(rp.user_id) AS qt_de_musicas_ouvidas, ROUND(SUM(m.lenght) / 60, 2) AS total_minutos
FROM SpotifyClone.user AS us
INNER JOIN SpotifyClone.reproduction_history AS rp 
ON us.user_id = rp.user_id
INNER JOIN SpotifyClone.music AS m
ON rp.music_id = m.music_id
GROUP BY usuario
ORDER BY usuario;
