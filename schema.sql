BEGIN;

CREATE TABLE IF NOT EXISTS tracks (
  pk SERIAL PRIMARY KEY,
  path TEXT UNIQUE NOT NULL,
  title TEXT NULL,
  artist TEXT NULL,
  album TEXT NULL
  );

CREATE TABLE IF NOT EXISTS scrobbles (
  start_time TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  track INTEGER REFERENCES tracks(pk)
  );

CREATE TABLE IF NOT EXISTS users (
  pk SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
  );

CREATE TABLE IF NOT EXISTS favourites (
  track INTEGER REFERENCES tracks(pk),
  user_ INTEGER REFERENCES users(pk),
  UNIQUE (track, user_)
  );

COMMIT;
