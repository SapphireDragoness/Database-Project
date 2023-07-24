-- Query 1
/*Restituire l'elenco degli artisti (deceduti/viventi) che sono stati scelti nella creazioe di storie. Ordinare il risultato in ordine crescente per numero di volte in cui, un artista, compare nelle storie (perchè selezionato in opere che compongono una storia). Riportare la durata (AVG(TimeStampFine-TimeStampInizio)) media delle storie. */
SELECT 
    a.nome, 
    a.cognome, 
    a.data_morte, 
    COUNT(a.cognome) AS numero_storie, 
    AVG(s.timestamp_fine-s.timestamp_inizio) AS media_durata
FROM 
    Autore a
JOIN 
    Realizzazione_Autore_Opera r ON a.cognome = r.cognome_autore
JOIN 
    Opera_Annotata oa ON r.codice_opera = oa.codice_opera
JOIN 
    Storia s ON oa.email_utente = s.email_utente
GROUP BY 
    a.cognome 
ORDER BY numero_storie DESC

-- Query 2
/*Selezionare tutte le storie degli utenti di età compresa tra [35<=x<=50] anni (estremi inclusi) che contengono almeno 2 opere d'arte (>=2). Ordinare le storie in ordine decrescente di durata della storia (durata=TimeStampFine-TimeStampInizio)*/
SELECT 
    s.id, 
    s.titolo, 
    COUNT(oa.codice_opera) AS numero_opere, 
    AVG(s.timestamp_fine-s.timestamp_inizio) AS media_durata
FROM 
    Storia s
JOIN 
    Utente u ON s.email_utente = u.email
JOIN 
    Opera_Annotata oa ON u.email = oa.email_utente
WHERE 
    DATE_PART('year', age(u.data_nascita)) <= 50 AND DATE_PART('year', age(u.data_nascita)) >= 35 
GROUP BY 
    s.id
ORDER BY 
    media_durata DESC

-- Query 3  
/*Restituire email, nome, cognome, età e data di nascita dell'utente che ha creato il maggior numero di storie che NON HANNO ricevuto commenti da altri utenti. Ordinare il risultato in ordine decrescente per numero storie create*/
SELECT 
    u.email, 
    u.nome, 
    u.cognome, 
    DATE_PART('year', age(u.data_nascita)) AS età, u.data_nascita, 
    COUNT(s.id) AS numero_storie
FROM 
    Utente u
JOIN 
    Storia s ON u.email = s.email_utente
LEFT JOIN 
    Interazione_Utente_Storia i ON s.id = i.storia
WHERE 
    i.commento IS NULL
GROUP BY 
    u.email, u.nome, u.cognome, u.data_nascita
ORDER BY 
    numero_storie DESC;

-- Query 4 
/*Restituire l’elenco delle opere che sono state maggiormente selezionate dagli utenti nella creazione delle loro storie, che hanno età compresa [25<=x<=55] (estremi inclusi). Ordinare il risultato in ordine decrescente per TitoloOpera*/
SELECT 
    o.titolo, 
    r.cognome_autore, 
    a.data_nascita, 
    COUNT(oa.codice_opera)
FROM 
    Opera o 
JOIN 
    Realizzazione_Autore_Opera r ON o.codice = r.codice_opera
JOIN 
    Autore a ON r.cognome_autore = a.cognome
JOIN 
    Opera_Annotata oa ON o.codice = oa.codice_opera
JOIN 
    Utente u ON oa.email_utente = u.email
WHERE 
    DATE_PART('year', age(u.data_nascita)) <= 55 AND DATE_PART('year', age(u.data_nascita)) >= 25
GROUP BY 
    o.titolo, r.cognome_autore, a.data_nascita
ORDER BY 
    o.titolo DESC

-- (Query 5 uguale alle 1)
  
-- Query 6
/*Per ogni utente che ha creato almeno 2 storie, si vuole conoscere la durata media delle sue storie (AVG(TimeStampFine-TimeStampInizio)) in minuti, numero di like e numero totale di commenti. Ordinare il risultato in ordine decrescente per età dell'utente.*/
SELECT 
    u.nome, 
    u.cognome, 
    DATE_PART('year', age(u.data_nascita)) AS età,
    AVG(s.timestamp_fine-s.timestamp_inizio) AS media_durata,
    COUNT(i.rating) AS numero_rating
FROM 
    Utente u
JOIN 
    Storia s ON u.email = s.email_utente
LEFT JOIN 
    Interazione_Utente_Storia i ON s.id = i.storia
GROUP BY 
    u.nome, u.cognome, u.data_nascita
HAVING 
    COUNT(DISTINCT s.email_utente) >= 2
ORDER BY 
    età DESC
-- Non ritorna row perchè tutti gli utenti hanno solamente creato una storia

-- Query 7
/*Per ogni curatore che lavora all'interno del museo che ha creato almeno 4 storie, si vuole conoscere l'età media degli utenti che hanno commentato le sue storie. Restituire il risultato in ordine decrescente per durata media (AVG(TimeStampFine-TimeStampInizio)) in minuti delle storie create da curatore museale.*/
SELECT
    u.email,
    u.nome,
    u.cognome,
    AVG(DATE_PART('year', age(uc.data_nascita))) AS età_media_commentatori,
    AVG((s.timestamp_fine-s.timestamp_inizio) / 60) AS durata_media_storie_minuti
FROM
    Utente u
JOIN
    Storia s ON u.email = s.email_utente
JOIN
    Interazione_Utente_Storia i ON s.id = i.storia
JOIN
    Utente uc ON i.email_utente = uc.email
WHERE
    u.tipologia = 'curatore'
GROUP BY
    u.email, u.nome, u.cognome
HAVING
    COUNT(DISTINCT s.id) >= 4
ORDER BY
    durata_media_storie_minuti DESC
-- Non ritorna row perchè tutti gli utenti hanno solamente creato una storia

-- Query 8
/*Restituire le storie che sono state create da utenti di età compresa tra [25<=x<=40] anni (estremi inclusi) CHE NON SONO curatori ma che hanno ricevuto commenti solo da curatori. Ordinare il risultato in ordine decrescente per durata della storia (AVG(TimeStampFine-TimeStampInizio))*/
SELECT 
    s.id, 
    s.titolo, 
    s.timestamp_inizio, 
    AVG(s.timestamp_fine-s.timestamp_inizio) AS durata_media_storie, 
    COUNT(i.commento) AS numero_commenti,
    COUNT(i.rating) AS numero_rating
FROM 
    Storia s
JOIN
    Utente u ON s.email_utente = u.email
JOIN
    Interazione_Utente_Storia i ON s.id = i.storia
LEFT JOIN
    Utente uc ON i.email_utente = u.email
WHERE 
     u.tipologia IN ('standard', 'fragile') AND DATE_PART('year', age(u.data_nascita)) <= 40 AND DATE_PART('year', age(u.data_nascita)) >= 25 AND uc.tipologia = 'curatore'
GROUP BY 
    s.id
ORDER BY
    durata_media_storie
-- Non ritorna row perchè tutti gli utenti hanno ricevuto commenti da curatori

-- Query 9
/*Restituire nome, cognome e età (in anni) dei curatori che hanno commentato almeno 4 storie di utenti di età compresa tra [20<=x<=35] anni (estremi inclusi). Ordinare il risultato per numero decrescente di commenti.*/
SELECT 
    u.nome,
    u.cognome,
    EXTRACT(YEAR FROM age(now(), U.data_nascita)) AS età,
    COUNT(i.commento) AS numero_commenti
FROM
    Utente u
JOIN
    Interazione_Utente_Storia i ON u.email = i.email_utente
JOIN 
    Storia s ON i.storia = s.id
JOIN
    Utente uc ON s.email_utente = uc.email
WHERE 
    u.tipologia = 'curatore' AND EXTRACT(YEAR FROM age(now(), uc.data_nascita)) BETWEEN 20 AND 35
GROUP BY
    u.nome, u.cognome, u.data_nascita
HAVING
    COUNT(i.commento) >= 4
ORDER BY 
    COUNT(i.commento) DESC

-- Query 10
/*Restituire nome, cognome e età (in anni) dei curatori che NON hanno commentato almeno 4 storie di utenti di età compresa tra [20<=x<=35] anni (estremi inclusi). Ordinare il risultato per numero decrescente di commenti.*/


 











