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
    label_id INT,
    FOREIGN KEY (label_id) REFERENCES labels(id)
);