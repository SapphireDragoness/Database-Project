insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Pablo', 'Picasso', '25/9/1881', '8/4/1973', 'Malaga', 'Mougins',  'cubismo');
insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Vincent', 'vanGogh', '30/3/1853', '29/7/1890', 'Zundert', 'Auvers-sur-Oise',  'impressionismo');
insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Claude', 'Monet', '14/11/1840', '5/12/1926', 'Parigi', 'Giverny',  'impressionismo');
insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Umberto', 'Boccioni', '19/10/1882', '17/8/1916', 'Reggio Calabria', 'Verona',  'futurismo');
insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Andy', 'Warhol', '9/8/1928', '2/2/1987', 'Pittsburgh', 'New York',  'pop-art');
insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Amedeo', 'Modigliani', '12/7/1884', '24/1/1920', 'Livorno', 'Parigi',  'modernismo');
insert into Autore(nome, cognome, data_nascita, data_morte, luogo_nascita, luogo_morte, movimento_artistico) values ('Salvador', 'Dalì', '11/5/1904', '23/1/1989', 'Figueres', 'Figueres', 'surrealismo');

insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('mario.rossi@gmail.com', 'Mario', 'Rossi', '19/8/1976', 'M', 'curatore', true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('mario.bianchi@gmail.com', 'Mario', 'Bianchi', '9/7/1982', 'M', 'standard', true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('maria.verdi@gmail.com', 'Maria', 'Verdi', '20/10/1964', 'F', 'standard', true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('anna.rossi@gmail.com', 'Anna', 'Rossi', '21/2/1993', 'F', 'standard', true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('fabio.verdi@gmail.com', 'Fabio', 'Verdi', '1/4/1956', 'M', 'standard', false, true);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('luigi.gialli@gmail.com', 'Luigi', 'Gialli', '5/5/1955', 'M', 'standard', true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('luigi.rossi@gmail.com', 'Luigi', 'Rossi', '17/8/1990', 'M', 'standard', false, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('antonia.neri@gmail.com', 'Antonia', 'Neri', '29/3/1987', 'F', 'curatore', true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('flavia.neri@gmail.com', 'Flavia', 'Neri', '2/2/1989', 'F', 'fragile',true, false);
insert into Utente(email, nome, cognome, data_nascita, genere, tipologia, is_online, is_suspended) values ('claudia.rossi@gmail.com', 'Claudia', 'Rossi', '27/8/1999', 'F', 'fragile', true, false);

insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (1234, 'Giraffa in fiamme', 1937, 'olio su tavola', 'Opera di Dalì...', 'mario.rossi@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (3567, 'Ultima cena', 1955, 'olio su tela', 'Opera di Dalì...', 'mario.rossi@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (1753, 'Cipressi', 1888, 'olio su tela', 'Opera di van Gogh...', 'mario.rossi@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (8553, 'Notte stellata', 1889, 'olio su tela', 'Opera di van Gogh...', 'mario.rossi@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (7237, 'Campo di grano con corvi', 1890, 'olio su tavola', 'Opera di van Gogh...', 'mario.rossi@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (8428, 'Forme uniche nella continuità dello spazio', 1913, 'bronzo', 'Opera di Boccioni...', 'mario.rossi@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (9542, 'La città che sale', 1911, 'olio su tela', 'Opera di Boccioni...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (8422, 'La gazza', 1869, 'olio su tela', 'Opera di Monet...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (1643, 'Colazione in giardino', 1873, 'olio su tela', 'Opera di Monet...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (4855, 'Campbell soup cans', 1962, 'polimero sintetico su tela', 'Opera di Warhol...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (5576, 'La bevitrice di assenzio', 1901, 'olio su tela', 'Opera di Picasso...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (1454, 'Guernica', 1937, 'olio su tela', 'Opera di Picasso...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (2347, 'Grande bagnante', 1922, 'olio su tela', 'Opera di Picasso...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (4576, 'Busto rosso', 1913, 'olio su cartone', 'Opera di Modigliani...', 'antonia.neri@gmail.com');
insert into Opera(codice, titolo, anno, materiale, descrizione, aggiunta_da) values (1327, 'Amazzone', 1909, 'olio su tela', 'Opera di Modigliani...', 'antonia.neri@gmail.com');

insert into Gruppo(nome_gruppo, supervisore, creatore) values ('Scuola superiore', 'maria.verdi@gmail.com', 'mario.rossi@gmail.com');
insert into Gruppo(nome_gruppo, supervisore, creatore) values ('Ricercatori', 'luigi.gialli@gmail.com', 'mario.rossi@gmail.com');
insert into Gruppo(nome_gruppo, supervisore, creatore) values ('Università', 'mario.rossi@gmail.com', 'mario.rossi@gmail.com');
insert into Gruppo(nome_gruppo, supervisore, creatore) values ('Scuola media', 'antonia.neri@gmail.com', 'antonia.neri@gmail.com');
insert into Gruppo(nome_gruppo, supervisore, creatore) values ('Scuola elementare', 'anna.rossi@gmail.com', 'antonia.neri@gmail.com');

insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Scuola superiore', 'maria.verdi@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Scuola media', 'mario.bianchi@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Scuola media', 'maria.verdi@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Scuola superiore', 'luigi.gialli@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Scuola elementare', 'luigi.rossi@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Scuola elementare', 'claudia.rossi@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Università', 'flavia.neri@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Università', 'luigi.rossi@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Università', 'antonia.neri@gmail.com');
insert into Appartenenza_Utente_Gruppo(nome_gruppo, email_utente) values ('Ricercatori', 'antonia.neri@gmail.com');

insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (1753, 'mario.rossi@gmail.com', '#trees', 'gioia', null, 'Toscana', 'natura', 'vento', 'Bello!');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (8553, 'mario.rossi@gmail.com', '#night', 'tristezza', null, 'buio', 'notte', 'melanconia', '...');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (8422, 'mario.rossi@gmail.com', '#magpie', 'curiosità', null, 'inverno', 'gazza', 'freddo', 'Il mio portafoglio...');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (8422, 'maria.verdi@gmail.com', '#brrr', 'gioia', null, 'neve', 'natura', 'gelo', 'Uccellino!');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (1643, 'maria.verdi@gmail.com', '#coffee', 'gioia', null, 'giardino', 'croissant', 'fame', 'Gnam!');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (2347, 'luigi.gialli@gmail.com', '#provacostume', 'sorpresa', null, 'mare', 'strano', 'estate', 'Non sembra una persona...');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (4576, 'luigi.gialli@gmail.com', null, 'curiosità', 'paura', 'moglie', 'casa', 'paura', 'Lavo io i piatti oggi');
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (9542, 'claudia.rossi@gmail.com', '#rivolta', 'paura', 'rabbia', null, null, null, null);
insert into Opera_Annotata(codice_opera, email_utente, hashtag, emoji_1, emoji_2, domanda_mi_ricorda, domanda_mi_fa_pensare, domanda_mi_fa_sentire, commento_opera) values (1454, 'claudia.rossi@gmail.com', null, 'paura', null, null, null, null, null);

insert into Storia(id, titolo, timestamp_inizio, timestamp_fine, email_utente, commento_personale, is_public, opera_annotata_1, opera_annotata_2, opera_annotata_3) values (1234, 'La natura', '15/7/2023 11:05:10', '15/7/2023 11:05:20', 'mario.rossi@gmail.com', 'Prima storia!', true, 1753, 8553, 8422);
insert into Storia(id, titolo, timestamp_inizio, timestamp_fine, email_utente, commento_personale, is_public, opera_annotata_1, opera_annotata_2, opera_annotata_3) values (4665, 'Quiete', '8/9/2023 13:05:30', '8/9/2023 13:05:35', 'maria.verdi@gmail.com', 'Venite a rilassarvi al museo!', true, 8422, 1643, null);
insert into Storia(id, titolo, timestamp_inizio, timestamp_fine, email_utente, commento_personale, is_public, opera_annotata_1, opera_annotata_2, opera_annotata_3) values (2463, 'Donne', '1/10/2023 15:05:50', '1/10/2023 15:05:55', 'luigi.gialli@gmail.com', 'Mi sono divertito al museo', true, 2347, 4576, null);
insert into Storia(id, titolo, timestamp_inizio, timestamp_fine, email_utente, commento_personale, is_public, opera_annotata_1, opera_annotata_2, opera_annotata_3) values (1111, 'Subbuglio', '25/9/2023 16:05:10', '25/9/2023 16:05:15', 'claudia.rossi@gmail.com', 'Rifletteteci...', true, 9542, 1454, null);

insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('claudia.rossi@gmail.com', 1234, 'Aria fresca!', 8);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('antonia.neri@gmail.com', 1234, 'Picasso?', 6);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('luigi.gialli@gmail.com', 4665, 'Buongiorno!', 10);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('mario.rossi@gmail.com', 4665, 'Sento odore di brioche', 7);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('antonia.neri@gmail.com', 4665, 'Che freddo', 5);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('mario.bianchi@gmail.com', 4665, 'Test', 7);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('mario.bianchi@gmail.com', 1111, 'Non ci capisco niente', 3);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('anna.rossi@gmail.com', 1111, '...', 4);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('mario.rossi@gmail.com', 1111, 'Boccioni!', 10);
insert into Interazione_Utente_Storia(email_utente, storia, commento, rating) values ('flavia.neri@gmail.com', 1111, 'Troppa violenza', 2);

insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (1234, 'Dalì');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (3567, 'Dalì');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (1753, 'vanGogh');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (8553, 'vanGogh');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (7237, 'vanGogh');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (8428, 'Boccioni');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (9542, 'Boccioni');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (8422, 'Monet');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (1643, 'Monet');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (4855, 'Warhol');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (5576, 'Picasso');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (1454, 'Picasso');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (2347, 'Picasso');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (4576, 'Modigliani');
insert into Realizzazione_Autore_Opera(codice_opera, cognome_autore) values (1327, 'Modigliani');