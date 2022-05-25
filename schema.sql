-- Create table genre
DROP TABLE IF EXISTS genre;
CREATE TABLE genre(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table music_album
DROP TABLE IF EXISTS  music_album;
CREATE TABLE music_album(
    id INTEGER NOT NULL PRIMARY KEY,
    genre INTEGER NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    FOREIGN KEY (genre)
        REFERENCES genre (id)
);
