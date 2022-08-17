-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT ar.name AS artista, al.name AS album, COUNT(fl.artist_id) AS seguidores
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
ON al.artist_id = ar.artist_id
INNER JOIN SpotifyClone.following_artists AS fl
ON ar.artist_id = fl.artist_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;

