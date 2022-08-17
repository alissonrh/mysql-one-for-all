-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT ar.name AS artista, al.name AS album
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
ON al.artist_id = ar.artist_id
WHERE ar.name = 'Elis Regina';