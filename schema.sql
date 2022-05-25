-- Create table author
DROP TABLE IF EXISTS author;
CREATE TABLE author(
    id INTEGER NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
	  last_name VARCHAR(20)
);

-- Create table game
DROP TABLE IF EXISTS  game;
CREATE TABLE game(
    id INTEGER NOT NULL PRIMARY KEY,
    author INTEGER NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    last_played_at DATE NOT NULL,
	  multiplayer BOOLEAN NOT NULL,
    FOREIGN KEY (author)
        REFERENCES author (id)
);