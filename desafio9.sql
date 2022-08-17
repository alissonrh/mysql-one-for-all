-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT COUNT(u.first_name) AS quantidade_musicas_no_historico
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction_history AS rh 
ON u.user_id = rh.user_id
WHERE u.first_name = 'Barbara'
GROUP BY u.first_name;
