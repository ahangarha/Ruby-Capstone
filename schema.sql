CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255),
    color VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_data DATE,
    archived BOOLEAN,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    genre_id INT NULL,
    author_id INT NULL,
    source_id INT NULL,
    label_id INT NULL,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (source_id) REFERENCES sources(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- *************************************

-- CREATE genre TABLE

CREATE TABLE genre(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(255),
   PRIMARY KEY (id)
);


-- CREATE music_album TABLE

CREATE TABLE music_album(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_data DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (source_id) REFERENCES sources(id),
    FOREIGN KEY (label_id) REFERENCES labels(id),
    PRIMARY KEY (id)
);

-- *************************************