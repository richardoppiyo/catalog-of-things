-- Create table genre
DROP TABLE IF EXISTS "genre";
CREATE TABLE "genre"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "genre" ADD PRIMARY KEY("id");

-- Create table music_album
DROP TABLE IF EXISTS  "music_album";
CREATE TABLE "music_album"(
    "id" INTEGER NOT NULL,
    "genre" INTEGER NOT NULL,
    "publish_date" DATE NOT NULL,
    "archived" BOOLEAN NOT NULL,
    "on_spotify" BOOLEAN NOT NULL
);

ALTER TABLE
    "music_album" ADD PRIMARY KEY("id");
ALTER TABLE
    "music_album" ADD CONSTRAINT "music_album_genre_foreign" FOREIGN KEY("genre") REFERENCES "genre"("id");