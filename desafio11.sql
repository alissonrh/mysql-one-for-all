-- Active: 1660737844599@@127.0.0.1@3307@SpotifyClone

/* SET SQL_SAFE_UPDATES = 0; */
SELECT
  name AS nome_musica, 
  CASE
    when name LIKE '%Amar%' then REPLACE (name, 'Amar', 'Code Review') 
    when name LIKE '%Bard%' then REPLACE (name, 'Bard', 'QA')
    when name LIKE '%SOUL%' then REPLACE (name, 'SOUL', 'CODE')
    when name LIKE '%Pais%' then REPLACE (name, 'Pais', 'Pull Requests')
    when name LIKE '%SUPERSTAR%' then REPLACE (name, 'SUPERSTAR', 'SUPERDEV')
    ELSE name
  END AS novo_nome
FROM SpotifyClone.music
HAVING nome_musica <> novo_nome
ORDER BY novo_nome DESC;



    
    
    
    