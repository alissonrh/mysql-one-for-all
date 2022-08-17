-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT m.name AS nome, COUNT(rh.music_id) AS reproducoes
FROM SpotifyClone.music AS m
INNER JOIN SpotifyClone.reproduction_history AS rh
ON m.music_id = rh.music_id
INNER JOIN SpotifyClone.user AS u
ON rh.user_id = u.user_id
WHERE u.plano_id = 1 OR u.plano_id = 4
GROUP BY m.name, u.plano_id
ORDER BY nome;