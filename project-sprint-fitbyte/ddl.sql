CREATE TYPE preference_enum AS ENUM ('CARDIO', 'WEIGHT');
CREATE TYPE weight_unit_enum AS ENUM ('KG', 'LBS');
CREATE TYPE height_unit_enum AS ENUM ('CM', 'INCH');

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    preference preference_enum NULL,
    weight_unit weight_unit_enum NULL,
    height_unit height_unit_enum NULL,
    weight DECIMAL(6,2) NULL CHECK (weight BETWEEN 10 AND 1000),
    height DECIMAL(5,2) NULL CHECK (height BETWEEN 3 AND 250),
    name VARCHAR(60) NULL,
    image_uri TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE Activities (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    activity_type INT NOT NULL,
    done_at TIMESTAMP NOT NULL,
    duration_in_minutes INT NOT NULL CHECK (duration_in_minutes >= 1),
    calories_burned DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users (id) ON DELETE CASCADE
);
