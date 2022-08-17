-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT COUNT(m.music_id) AS cancoes, COUNT(DISTINCT ar.artist_id) AS artistas, COUNT(DISTINCT al.album_id) AS albuns 
FROM SpotifyClone.music AS m
INNER JOIN SpotifyClone.album AS al
ON m.album_id = al.album_id
INNER JOIN SpotifyClone.artist AS ar
ON al.artist_id = ar.artist_id;
