-- Criando e iniciando o banco de dados
DROP DATABASE IF EXISTS patriots_stats_nfl;
CREATE DATABASE patriots_stats_nfl;
USE patriots_stats_nfl;

-- Criando tabela de Draft
DROP TABLE IF EXISTS draft;
CREATE TABLE draft (
    playerId INT PRIMARY KEY NOT NULL,
    draft INT,
    round DOUBLE,
    pick INT,
    draftTradeValue DOUBLE,
    draftTeam VARCHAR(10),
    position VARCHAR(10),
    teamId INT,
    nameFirst VARCHAR(50),
    nameLast VARCHAR(50),
    nameFull VARCHAR(110),
    collegeId INT,
    nflId INT,
    combineId INT,
    college VARCHAR(100),
    heightInches DOUBLE,
    weight DOUBLE,
    dob DATE,
    ageAtDraft DOUBLE,
    playerProfileUrl VARCHAR(300),
    homeCity VARCHAR(100),
    homeState VARCHAR(4),
    homeCountry VARCHAR(15),
    highSchool VARCHAR(50),
    hsCity VARCHAR(50),
    hsState VARCHAR(10),
    hsCountry VARCHAR(10)
);

-- Criando tabela games
DROP TABLE IF EXISTS games;
CREATE TABLE games (
	gameId INT PRIMARY KEY NOT NULL,
    season int,
    week int,
    gameDate date,
    gameTimeEastern time,
	gameTimeLocal time,
	homeTeamId int,
	visitorTeamId int,
	seasonType varchar(5),
	weekNameAbbr varchar(10),
	siteId int,
	homeTeamDistance int,
	visitingTeamDistance int,
	homeTeamFinalScore int,
	visitingTeamFinalScore int,
	winningTeam int
);

-- Criando Tabela Plays
DROP TABLE IF EXISTS plays;
CREATE TABLE plays (
    playId INT PRIMARY KEY NOT NULL,
    gameId INT,
    FOREIGN KEY (gameId) REFERENCES games(gameId),
    playSequence INT,
    quarter INT,
    possessionTeamId INT,
    nonpossessionTeamId INT,
    playType TEXT,
    playType2 TEXT,
    playTypeDetailed TEXT,
    playNumberByTeam INT,
    gameClock TEXT,
    gameClockSecondsExpired INT,
    gameClockStoppedAfterPlay INT,
    down INT,
    distance INT,
    fieldPosition VARCHAR(10),
    distanceToGoalPre DOUBLE,
    noPlay TINYINT,
    playDescription TEXT,
    playStats TEXT,
    playDescriptionFull TEXT,
    typeOfPlay TEXT,
    changePossession TEXT,
    turnover VARCHAR(4),
    safety TINYINT,
    offensiveYards INT,
    netYards INT,
    firstDown INT,
    efficientPlay TINYINT,
    evPre DOUBLE,
    evPost DOUBLE,
    evPlay DOUBLE,
    fourthDownConversion DOUBLE,
    thirdDownConversion DOUBLE,
    scorePossession INT,
    scoreNonpossession INT,
    homeScorePre INT,
    visitingScorePre INT,
    homeScorePost INT,
    visitingScorePost INT,
    distanceToGoalPost DOUBLE,
    fieldGoalProbability DOUBLE,
    huddle VARCHAR(20),
    formation VARCHAR(20)
);

-- Criando tabela interceptions
DROP TABLE IF EXISTS interceptions;
CREATE TABLE interceptions (
    interceptionId INT PRIMARY KEY NOT NULL,
    playId INT,
    FOREIGN KEY (playId) REFERENCES plays(playId),
    teamId INT,
    playerId INT,
    FOREIGN KEY (playerId) REFERENCES draft(playerId),
    intPosition VARCHAR(4),
    int_ TINYINT,
    intYards INT,
    intTd TINYINT,
    intNull TINYINT
);

-- Criando tabela passer
DROP TABLE IF EXISTS passer;
CREATE TABLE passer (
    passId INT PRIMARY KEY NOT NULL,
    playId INT,
    FOREIGN KEY (playId) REFERENCES plays(playId),
    teamId INT,
    playerId INT,
    FOREIGN KEY (playerId) REFERENCES draft(playerId),
    passPosition VARCHAR(4),
    passOutcomes VARCHAR(15),
    passDirection VARCHAR(10),
    passDepth VARCHAR(10),
    passLength INT,
    passAtt TINYINT,
    passComp TINYINT,
    passTd TINYINT,
    passInt TINYINT,
    passIntTd TINYINT,
    passSack TINYINT,
    passSackYds INT,
    passHit TINYINT,
    passDef TINYINT,
    passNull TINYINT
);

-- Criando tabela de penalties
DROP TABLE IF EXISTS penalties;
CREATE TABLE penalties (
    penaltyId INT PRIMARY KEY NOT NULL,
    playId INT,
    FOREIGN KEY (playId) REFERENCES plays(playId),
    teamId INT,
    playerId INT,
    penaltyPosition VARCHAR(4),
    penaltyDescrip TEXT,
    penaltyYds DOUBLE,
    penaltyResult VARCHAR(20)
);
