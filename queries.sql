/*Restituire l'elenco degli artisti (deceduti/viventi) che sono stati scelti nella creazioe di storie. Ordinare il risultato in ordine crescente per numero di volte in cui, un artista, compare nelle storie (perchè selezionato in opere che compongono una storia). Riportare la durata (AVG(TimeStampFine-TimeStampInizio)) media delle storie. */
SELECT a.nome, a.cognome, a.data_morte, COUNT(a.cognome) AS numero_storie, AVG(s.timestamp_fine-s.timestamp_inizio) AS media_durata
FROM Autore a
JOIN Realizzazione_Autore_Opera r ON a.cognome = r.cognome_autore
JOIN Opera_Annotata oa ON r.codice_opera = oa.codice_opera
JOIN Storia s ON oa.email_utente = s.email_utente
GROUP BY a.cognome ORDER BY numero_storie DESC

/*Selezionare tutte le storie degli utenti di età compresa tra [35<=x<=50] anni (estremi inclusi) che contengono almeno 2 opere d'arte (>=2). Ordinare le storie in ordine decrescente di durata della storia (durata=TimeStampFine-TimeStampInizio)*/
SELECT s.id, s.titolo, COUNT(oa.codice_opera) AS numero_opere, AVG(s.timestamp_fine-s.timestamp_inizio) AS media_durata
FROM Storia s
JOIN Utente u ON s.email_utente = u.email
JOIN Opera_Annotata oa ON u.email = oa.email_utente
WHERE DATE_PART('year', age(u.data_nascita)) <= 50 AND DATE_PART('year', age(u.data_nascita)) >= 35 
GROUP BY s.id
ORDER BY media_durata DESC

/*Restituire email, nome, cognome, età e data di nascita dell'utente che ha creato il maggior numero di storie che NON HANNO ricevuto commenti da altri utenti. Ordinare il risultato in ordine decrescente per numero storie create*/
SELECT u.email, u.nome, u.cognome, DATE_PART('year', age(u.data_nascita)) AS età, COUNT(s.id) AS numero_storie_create
FROM Storia s
JOIN Utente u ON s.email_utente = u.email
--?
GROUP BY u.email 
ORDER BY numero_storie_create DESC

/*Restituire l’elenco delle opere che sono state maggiormente selezionate dagli utenti nella creazione delle loro storie, che hanno età compresa [25<=x<=55] (estremi inclusi). Ordinare il risultato in ordine decrescente per TitoloOpera*/
SELECT o.titolo, r.cognome_autore, a.data_nascita, COUNT(oa.codice_opera)
FROM Opera o 
JOIN Realizzazione_Autore_Opera r ON o.codice = r.codice_opera
JOIN Autore a ON r.cognome_autore = a.cognome
JOIN Opera_Annotata oa ON o.codice = oa.codice_opera
JOIN Utente u ON oa.email_utente = u.email
WHERE DATE_PART('year', age(u.data_nascita)) <= 55 AND DATE_PART('year', age(u.data_nascita)) >= 25
GROUP BY o.titolo, r.cognome_autore, a.data_nascita
ORDER BY o.titolo DESC

/*Per ogni utente che ha creato almeno 2 storie, si vuole conoscere la durata media delle sue storie (AVG(TimeStampFine-TimeStampInizio)) in minuti, numero di like e numero totale di commenti. Ordinare il risultato in ordine decrescente per età dell'utente.*/
/*SELECT u.nome, u.cognome, DATE_PART('year', age(u.data_nascita)) AS età, AVG(s.timestamp_fine-s.timestamp_inizio) AS media_durata, COUNT(i.rating)
FROM Utente u
JOIN Storia s ON u.email = s.email_utente
JOIN Interazione_Utente_Storia i ON s.id = i.storia
GROUP BY u.nome, u.cognome, u.data_nascita*/
