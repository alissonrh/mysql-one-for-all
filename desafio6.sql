-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone
SELECT 
MIN(p.price) AS faturamento_minimo,
MAX(p.price) AS faturamento_maximo,
ROUND(AVG(p.price), 2) AS faturamento_medio,
SUM(p.price) AS faturamento_total
FROM SpotifyClone.plano AS p
INNER JOIN SpotifyClone.user AS u
ON p.plano_id = u.plano_id;


