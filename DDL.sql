set datestyle to 'ISO, DMY';

/* Dichiarazioni di tipi e domini utilizzati nel database */
CREATE TYPE emoji AS ENUM ('tristezza', 'paura', 'gioia', 'disgusto', 'noia', 'rabbia', 'sorpresa', 'curiosità');
CREATE TYPE genere AS ENUM ('M', 'F');
CREATE TYPE tipologia AS ENUM ('curatore', 'standard', 'fragile');
CREATE DOMAIN rating AS smallint DEFAULT 0 check (value >=1 AND value <= 10);	

-- Entità

CREATE TABLE Utente(
    email varchar(32) PRIMARY KEY,
    nome varchar(16) NOT NULL,
    cognome varchar(16) NOT NULL,
    data_nascita date NOT NULL,
    genere genere,
    tipologia tipologia,
    is_online boolean,
    is_suspended boolean
);

/* Funzione per controllare se un utente appartiene 
alla categoria 'curatore' */
CREATE FUNCTION curatore_check (email varchar(32))
RETURNS boolean
AS $$
	SELECT EXISTS (SELECT 1 FROM Utente WHERE email = $1 AND tipologia = 'curatore');
$$ LANGUAGE SQL;

/* Funzione per controllare se un utente appartiene 
alla categoria 'fragile', in modo da esentarlo dal
rispondere alle domande */
CREATE FUNCTION fragile_check (email varchar(32))
RETURNS boolean
AS $$
	SELECT EXISTS (SELECT 1 FROM Utente WHERE email = $1 AND tipologia = 'fragile');
$$ LANGUAGE SQL;

/* Funzione per controllare se un utente è sospeso
o meno */
CREATE FUNCTION is_suspended_check (email varchar(32))
RETURNS boolean
AS $$
	SELECT EXISTS (SELECT 1 FROM Utente WHERE email = $1 AND is_suspended = false);
$$ LANGUAGE SQL;

/* Funzione per controllare se un utente è loggato
o meno */
CREATE FUNCTION is_online_check (email varchar(32))
RETURNS boolean
AS $$
	SELECT EXISTS (SELECT 1 FROM Utente WHERE email = $1 AND is_online = true);
$$ LANGUAGE SQL;

CREATE TABLE Gruppo(
    nome_gruppo varchar(32) PRIMARY KEY,
    supervisore varchar(32) NOT NULL,
    creatore varchar(32) NOT NULL,
    CONSTRAINT fk_gruppo_curatore FOREIGN KEY (creatore)
        REFERENCES Utente (email)
        ON UPDATE CASCADE
        ON DELETE NO ACTION, 
    CONSTRAINT creatore_check CHECK (curatore_check(creatore))
);

CREATE TABLE Autore(
    cognome varchar(16) PRIMARY KEY,
    nome varchar(16) NOT NULL,
    movimento_artistico varchar(16) NOT NULL,
    data_nascita date NOT NULL,
    data_morte date,
    luogo_nascita varchar(16) NOT NULL,
    luogo_morte varchar(16)
);

CREATE TABLE Opera(
    codice smallint PRIMARY KEY,
    materiale varchar(32) NOT NULL,
    anno smallint NOT NULL,
    titolo varchar(64) NOT NULL, 
    descrizione text,
    descrizione_audio text, /* link al file audio */
    aggiunta_da varchar(32),
    is_present boolean,
    CONSTRAINT fk_opera_curatore FOREIGN KEY (aggiunta_da)
        REFERENCES Utente (email)
        ON UPDATE CASCADE
        ON DELETE NO ACTION, 
    CONSTRAINT aggiunta_da_check CHECK (curatore_check(aggiunta_da))
);

/* Funzione per controllare se un'opera è presente 
nella galleria online */
CREATE FUNCTION opera_check (codice smallint)
RETURNS boolean
AS $$
	SELECT EXISTS (SELECT 1 FROM Opera WHERE codice = $1 AND is_present = true);
$$ LANGUAGE SQL;

CREATE TABLE Opera_Annotata( 
    id serial PRIMARY KEY,
    hashtag varchar(32),
    emoji emoji,
    domanda_mi_ricorda varchar(32),
    domanda_mi_fa_pensare varchar(32),
    domanda_mi_fa_sentire varchar(32),
    commento_opera varchar(32),
    codice_opera smallint,
    email_utente varchar(32),
    CONSTRAINT fk_opera_annotata_opera FOREIGN KEY (codice_opera)
        REFERENCES Opera (codice)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_opera_annotata_utente FOREIGN KEY (email_utente)
        REFERENCES Utente (email)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT domanda_mi_ricorda_check CHECK (fragile_check(email_utente) OR domanda_mi_ricorda IS NOT NULL),
    CONSTRAINT domanda_mi_fa_pensare_check CHECK (fragile_check(email_utente) OR domanda_mi_fa_pensare IS NOT NULL),
    CONSTRAINT domanda_mi_fa_sentire_check CHECK (fragile_check(email_utente) OR domanda_mi_fa_sentire IS NOT NULL),
    CONSTRAINT commento_opera_check CHECK (fragile_check(email_utente) OR commento_opera IS NOT NULL),
    CONSTRAINT login_check CHECK (is_online_check(email_utente)),
    CONSTRAINT ban_check CHECK (is_suspended_check(email_utente)),
    CONSTRAINT opera_check CHECK (opera_check(codice_opera))
);

CREATE TABLE Storia(
    id serial PRIMARY KEY,
    timestamp_fine timestamp NOT NULL,
    timestamp_inizio timestamp NOT NULL,
    titolo varchar(32) NOT NULL,
    is_public boolean, 
    email_utente varchar(32) NOT NULL,
    commento_personale varchar(128),
    opera_annotata_1 int NOT NULL,
    opera_annotata_2 int NOT NULL,
    opera_annotata_3 int NULL,
    CONSTRAINT fk_opera_annotata_1 FOREIGN KEY (opera_annotata_1)
        REFERENCES Opera_Annotata (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_opera_annotata_2 FOREIGN KEY (opera_annotata_2)
        REFERENCES Opera_Annotata (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_opera_annotata_3 FOREIGN KEY (opera_annotata_3)
        REFERENCES Opera_Annotata (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT login_check CHECK (is_online_check(email_utente)),
    CONSTRAINT ban_check CHECK (is_suspended_check(email_utente))
);

-- Relazioni

CREATE TABLE Realizzazione_Autore_Opera(
    cognome_autore varchar(16),
    codice_opera smallint,
    UNIQUE (cognome_autore, codice_opera),
    CONSTRAINT pk_realizzazione_autore_opera PRIMARY KEY (cognome_autore, codice_opera),
    CONSTRAINT fk_realizzazione_autore FOREIGN KEY (cognome_autore)
        REFERENCES Autore (cognome) 
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT fk_realizzazione_opera FOREIGN KEY (codice_opera)
        REFERENCES Opera (codice) 
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE Appartenenza_Utente_Gruppo(
    nome_gruppo varchar(32),
    email_utente varchar(32),
    UNIQUE (nome_gruppo, email_utente),
    CONSTRAINT pk_appartenenza_utente_gruppo PRIMARY KEY (nome_gruppo, email_utente),
    CONSTRAINT fk_appartenenza_gruppo FOREIGN KEY (nome_gruppo)
        REFERENCES Gruppo (nome_gruppo)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_utente_gruppo_utente FOREIGN KEY (email_utente)
        REFERENCES Utente (email)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Interazione_Utente_Storia(
    rating rating,
    commento varchar(128),
    email_utente varchar(32),
    storia int,
    CONSTRAINT pk_interazione_utente_storia PRIMARY KEY (email_utente, storia),
    CONSTRAINT fk_interazione_storia FOREIGN KEY (storia)
        REFERENCES Storia (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_interazione_utente FOREIGN KEY (email_utente)
        REFERENCES Utente (email)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT login_check CHECK (is_online_check(email_utente)),
    CONSTRAINT ban_check CHECK (is_suspended_check(email_utente))
);

CREATE TABLE Emozioni_Opposte(
    emozione emoji NOT NULL,
    emozione_opposta emoji UNIQUE NOT NULL,
    CONSTRAINT chk_different_emozioni CHECK (emozione != emozione_opposta),
    PRIMARY KEY (emozione)
);

--Viste

CREATE VIEW StorieEmozioniSimili AS
SELECT 
    s1.id AS storia_id_originale, 
    s1.titolo AS titolo_originale,
    oa1.email_utente AS email_utente_originale,
    oa1.emoji AS emozione_originale,
    s2.id AS storia_id_consigliata, 
    s2.titolo AS titolo_consigliato,
    oa2.email_utente AS email_utente_consigliato,
    oa2.emoji AS emozione_consigliato
FROM Storia s1
JOIN Opera_Annotata oa1 ON s1.email_utente = oa1.email_utente
JOIN Storia s2 ON s1.id <> s2.id
JOIN Opera_Annotata oa2 ON s2.email_utente = oa2.email_utente
WHERE oa1.emoji = oa2.emoji;

CREATE VIEW StorieEmozioniOpposte AS
SELECT 
    s1.id AS storia_id_originale, 
    s1.titolo AS titolo_originale,
    oa1.id AS id_utente_originale,
    oa1.emoji AS emozione_originale,
    s2.id AS storia_id_consigliata, 
    s2.titolo AS titolo_consigliato,
    oa2.id AS id_utente_consigliato,
    oa2.emoji AS emozione_consigliato
FROM Storia s1
JOIN Opera_Annotata oa1 ON s1.id = oa1.id
JOIN Emozioni_Opposte eo ON oa1.emoji = eo.emozione
JOIN Storia s2 ON s1.id <> s2.id
JOIN Opera_Annotata oa2 ON s2.id = oa2.id
WHERE oa2.emoji = eo.emozione_opposta;
