-- Relacionamento de tabelas
ALTER TABLE plays ADD CONSTRAINT fk_plays_games FOREIGN KEY (gameId) REFERENCES games(gameId);
ALTER TABLE interceptions ADD CONSTRAINT fk_int_plays FOREIGN KEY (playId) REFERENCES plays(playId);
ALTER TABLE passer ADD CONSTRAINT fk_passer_plays FOREIGN KEY (playId) REFERENCES plays(playId);
ALTER TABLE penalties ADD CONSTRAINT fk_penalties_plays FOREIGN KEY (playId) REFERENCES plays(playId);
ALTER TABLE kicks ADD CONSTRAINT fk_kicks_plays FOREIGN KEY (playId) REFERENCES plays(playId);
