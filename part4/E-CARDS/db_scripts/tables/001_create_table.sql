CREATE DATABASE db_tcgpokemon_cards;
USE db_tcgpokemon_cards;

CREATE TABLE tbl_collections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    collectionSetName VARCHAR(100) NOT NULL,
    releaseDate DATE NOT NULL,
    totalCardsInCollection INT NOT NULL
);

CREATE TABLE tbl_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    typeName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_stages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stageName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_cards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hp INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    info TEXT,
    attack VARCHAR(50) NOT NULL,
    damage VARCHAR(50) NOT NULL,
    weak VARCHAR(50),
    resis VARCHAR(50),
    retreat INT NOT NULL,
    cardNumberInCollection INT NOT NULL,
    collection_id INT,
    type_id INT,
    stage_id INT,
    FOREIGN KEY (collection_id) REFERENCES tbl_collections(id),
    FOREIGN KEY (type_id) REFERENCES tbl_types(id),
    FOREIGN KEY (stage_id) REFERENCES tbl_stages(id)
);
