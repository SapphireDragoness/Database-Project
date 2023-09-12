--Autori Monfermoso Linda e Magenta Biasina Gabriele

--QUERY
--Utenti di un gruppo che hanno come supervisiore “mario.rossi@gmail.com”
SELECT *
FROM Gruppo
WHERE supervisore = 'mario.rossi@gmail.com';

--Tutte le opere dell’autore “vanGogh”
SELECT o.*
FROM Opera o
JOIN Realizzazione_Autore_Opera r ON o.codice = r.codice_opera
JOIN Autore a ON r.cognome_autore = a.cognome
WHERE a.cognome = 'vanGogh';

--Nome e cognome degli utenti le cui storie hanno un rating superiore a 9 
SELECT u.nome, u.cognome
FROM Utente u
JOIN Storia s ON u.email = s.email_utente
JOIN Interazione_Utente_Storia i ON s.id = i.storia
WHERE i.rating > 9;

--Tutte le storie dell'utente "mario rossi" con rating maggiore di 6
SELECT s.*
FROM Storia s
JOIN Utente u ON s.email_utente = u.email
JOIN Interazione_Utente_Storia i ON s.id = i.storia
WHERE u.nome = 'Mario' AND u.cognome = 'Rossi' AND i.rating > 6;

--Tutti gli utenti che al momento risultano sospesi 
SELECT *
FROM Utente
WHERE is_suspended = true;

--Tutti gli utenti che hanno almeno 30 anni d’età appartenenti al gruppo ”Università” 
SELECT u.*
FROM Utente u
JOIN Appartenenza_Utente_Gruppo a ON u.email = a.email_utente
JOIN Gruppo g ON a.nome_gruppo = g.nome_gruppo
WHERE g.nome_gruppo = 'Università' AND date_part('year', age(u.data_nascita)) >= 30;

--Tutti i titoli delle storie create da utenti fragili 
SELECT s.titolo
FROM Storia s
JOIN Utente u ON s.email_utente = u.email
WHERE u.tipologia = 'fragile';

--Tutte le storie con emozione opposta a "tristezza" 
SELECT 
	oa.emoji,
    s.id AS id_storia, 
    s.titolo AS titolo_storia
FROM 
    opera_annotata oa
JOIN 
    Emozioni_Opposte eo ON eo.emozione = 'tristezza'
JOIN
	Storia s ON oa.id=s.id
WHERE 
    oa.emoji = eo.emozione_opposta;

--DELETE
--Rimuovere gli utenti che hanno le seguenti email mario.bianchi@gmail.com e fabio.verdi@gmail.com
DELETE FROM Utente WHERE email IN ('mario.bianchi@gmail.com', 'fabio.verdi@gmail.com');

--Rimuovere tutti gli utenti che hanno meno di 18 anni
DELETE FROM Utente WHERE data_nascita > current_date - interval '18 years';

--Rimuovere tutte le opere dell'autore "Picasso" 
DELETE FROM Realizzazione_Autore_Opera WHERE cognome_autore = 'Picasso';
DELETE FROM Opera WHERE codice IN (
  SELECT codice FROM Realizzazione_Autore_Opera WHERE cognome_autore = 'Picasso'
);

--Rimuovere le storie create il 15/07/2023
DELETE FROM Storia WHERE CAST(timestamp_inizio AS DATE) = '2023-07-15';

--Rimuovere le storie publiche create da utenti che al momento si trovano sospesi
DELETE FROM Storia
WHERE is_public = true
AND email_utente IN (
    SELECT email FROM Utente WHERE is_suspended = true
);

--MODIFICHE
--Modificare le opere che hanno come materiale "olio su tela" e inserire "ad olio"
UPDATE Opera
SET materiale = 'ad olio'
WHERE materiale = 'olio su tela';

--Inserimento di un nuovo utente "Aldo Baglio"
INSERT INTO Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended)
VALUES ('aldo.baglio@gmail.com', 'Aldo', 'Baglio', '1958-09-28', 'M', 'standard', true, false);

--Modifica della data di nascita dell'utente "Mario Rossi" 
UPDATE Utente
SET data_nascita = '1980-01-01'
WHERE email = 'mario.rossi@gmail.com';

--Inserimento del nuovo campo telefono in utente
ALTER TABLE Utente
ADD COLUMN telefono varchar(16);

--Rimozione della colonna telefono in utente
ALTER TABLE Utente
DROP COLUMN telefono;