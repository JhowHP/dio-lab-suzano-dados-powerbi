-- Seed data for tbl_collections
INSERT INTO tbl_collections (collectionSetName, releaseDate, totalCardsInCollection) VALUES 
('Base Set', '1999-01-09', 102),
('Jungle', '1999-06-16', 64),
('Fossil', '1999-10-10', 62),
('Team Rocket', '2000-04-24', 83);

-- Seed data for tbl_types
INSERT INTO tbl_types (typeName) VALUES 
('Grass'),
('Fire'),
('Water'),
('Lightning'),
('Psychic'),
('Fighting'),
('Darkness'),
('Metal'),
('Fairy'),
('Dragon'),
('Colorless');

-- Seed data for tbl_stages
INSERT INTO tbl_stages (stageName) VALUES 
('Basic'),
('Stage 1'),
('Stage 2'),
('EX'),
('GX'),
('V'),
('VMAX'),
('V-Union');

-- Seed data for tbl_cards
INSERT INTO tbl_cards (hp, name, info, attack, damage, weak, resis, retreat, cardNumberInCollection, collection_id, type_id, stage_id) VALUES 
(60, 'Bulbasaur', 'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.', 'Vine Whip', '20', 'Fire', 'Water', 1, 1, 1, 1, 1),
(50, 'Charmander', 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.', 'Ember', '30', 'Water', 'Grass', 1, 2, 1, 2, 1),
(60, 'Squirtle', 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.', 'Water Gun', '20', 'Lightning', 'Fire', 1, 3, 1, 3, 1),
(40, 'Pikachu', 'When several of these Pokémon gather, their electricity could build and cause lightning storms.', 'Thunder Jolt', '30', 'Fighting', 'Steel', 1, 4, 4, 1, 1),
(100, 'Blastoise', 'A brutal Pokémon with pressurized water jets on its shell. They are used for high-speed tackles.', 'Hydro Pump', '40', 'Electric', 'Fire', 3, 9, 1, 3, 3);

-- You can continue to add more seed data as required
