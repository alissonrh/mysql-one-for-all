-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT m.name AS cancao, COUNT(rp.reproduction_date) AS reproducoes
FROM SpotifyClone.music AS m
LEFT JOIN SpotifyClone.reproduction_history AS rp
ON m.music_id = rp.music_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;