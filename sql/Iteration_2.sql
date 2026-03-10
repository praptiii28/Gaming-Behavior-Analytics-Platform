CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    platform VARCHAR(100),
    genre VARCHAR(100),
    publisher VARCHAR(255),
    year_of_release INT,
    global_sales FLOAT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    age INT NOT NULL,
    gender VARCHAR(20)
);

CREATE TABLE sessions (
    session_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    game_genre VARCHAR(100),
    playtime_hours FLOAT,
    sessions_per_week INT,
    engagement_level VARCHAR(50)
);

CREATE TABLE emotion_prediction (
    prediction_id SERIAL PRIMARY KEY,
    genre VARCHAR(100),
    emotion_label VARCHAR(100),
    base_intensity INT
);

CREATE TABLE playtime_emotion_scaling (
    scaling_id SERIAL PRIMARY KEY,
    min_playtime_hours FLOAT,
    max_playtime_hours FLOAT,
    intensity_multiplier FLOAT
);

COPY games(name, platform, genre, publisher, year_of_release, global_sales)
FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/cleaned_video_games.csv'
DELIMITER ','
CSV HEADER;

\copy games(name, platform, genre, publisher, year_of_release, global_sales) FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/cleaned_video_games.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM games;

\copy users(user_id, age, gender) FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/cleaned_users.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM users LIMIT 10;

\copy sessions(user_id, game_genre, playtime_hours, sessions_per_week, engagement_level) FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/cleaned_sessions.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM sessions LIMIT 10;

\copy emotion_prediction(genre, emotion_label, base_intensity) FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/Emotion_Prediction_Mapping.csv' DELIMITER ',' CSV HEADER;

\copy playtime_emotion_scaling(min_playtime_hours, max_playtime_hours, intensity_multiplier) FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/Playtime_Emotion_Scaling_Rules.csv' DELIMITER ',' CSV HEADER;



CREATE TABLE session_emotion_summary (
    summary_id SERIAL PRIMARY KEY,
    session_id INT,
    user_id INT,
    game_genre VARCHAR(100),
    emotion_label VARCHAR(100),
    final_intensity FLOAT,
    playtime_hours FLOAT,
    sessions_per_week INT,
    engagement_level VARCHAR(50)
);

INSERT INTO session_emotion_summary (session_id, user_id, game_genre, emotion_label, final_intensity, playtime_hours, sessions_per_week, engagement_level)
SELECT
    s.session_id,
    s.user_id,
    s.game_genre,
    ep.emotion_label,
    (ep.base_intensity * pes.intensity_multiplier) AS final_intensity,
    s.playtime_hours,
    s.sessions_per_week,
    s.engagement_level
FROM
    sessions s
JOIN
    emotion_prediction ep
    ON s.game_genre = ep.genre
JOIN
    playtime_emotion_scaling pes
    ON s.playtime_hours >= pes.min_playtime_hours AND s.playtime_hours < pes.max_playtime_hours;


SELECT DISTINCT user_id FROM session_emotion_summary ORDER BY user_id LIMIT 20;
SELECT * FROM session_emotion_summary LIMIT 10;

drop table session_emotion_summary

CREATE TABLE genre_emotion_summary AS
SELECT 
    game_genre,
    emotion_label,
    AVG(final_intensity) AS avg_intensity,
    COUNT(*) AS session_count
FROM 
    session_emotion_summary
GROUP BY 
    game_genre, emotion_label
ORDER BY 
    avg_intensity DESC;

	
SELECT * FROM genre_emotion_summary;






CREATE TABLE classified_steam_games (
    game_title TEXT,
    release_date DATE,
    platforms TEXT,
    required_age INTEGER,
    categories TEXT[],
    genres TEXT[],
    steamspy_tags TEXT[],
    achievements INTEGER,
    positive_ratings INTEGER,
    negative_ratings INTEGER,
    average_playtime INTEGER,
    median_playtime INTEGER,
    owners TEXT,
    price FLOAT,
    owners_lower FLOAT,
    violence_level TEXT
);

SELECT * FROM classified_steam_games LIMIT 10;

\copy classified_steam_games FROM '/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/classified_steam.csv' WITH (FORMAT csv, HEADER true)


/Users/praptidinesh/Documents/Monash/FIT5120 IE/ITERATION/DATA/classified_steam_games.csv