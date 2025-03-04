CREATE VIEW view_all_cards AS
SELECT 
    c.id,
    c.hp,
    c.name,
    c.info,
    c.attack,
    c.damage,
    c.weak,
    c.resis,
    c.retreat,
    c.cardNumberInCollection,
    col.collectionSetName,
    col.releaseDate,
    col.totalCardsInCollection,
    t.typeName,
    s.stageName
FROM 
    tbl_cards c
    JOIN tbl_collections col ON c.collection_id = col.id
    JOIN tbl_types t ON c.type_id = t.id
    JOIN tbl_stages s ON c.stage_id = s.id;


-- SELECT
SELECT 
    id,
    hp,
    name,
    info,
    attack,
    damage,
    weak,
    resis,
    retreat,
    cardNumberInCollection,
    collectionSetName,
    releaseDate,
    totalCardsInCollection,
    typeName,
    stageName
FROM 
    view_all_cards;
