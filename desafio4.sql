-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone

SELECT CONCAT(us.first_name, ' ', us.last_name) AS usuario,
CASE  
  WHEN MAX(YEAR(rp.reproduction_date)) >= 2021 THEN 'Usuário ativo'
  ELSE 'Usuário inativo'
END AS status_usuario
FROM SpotifyClone.reproduction_history AS rp
INNER JOIN SpotifyClone.user AS us
ON us.user_id = rp.user_id
GROUP BY usuario
ORDER BY usuario;