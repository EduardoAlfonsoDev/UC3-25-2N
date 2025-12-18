/* lol2-convertido: */

CREATE TABLE player (
    level Number(5),
    score Number(5),
    id_player Number(5) PRIMARY KEY,
    user_name String(16),
    region String(10),
    fk_team_id_team Number(5)
);

CREATE TABLE champion (
    id_champion Number(5) PRIMARY KEY,
    name String(16),
    ability String(15),
    damage_type String(15),
    function String(10),
    fk_player_id_player Number(5)
);

CREATE TABLE match (
    id_match Number(5) PRIMARY KEY,
    results Number(7),
    duration Number(5),
    date_time Number(8),
    fk_champion_id_champion Number(5)
);

CREATE TABLE item (
    id_item Number(5) PRIMARY KEY,
    descripiton String(1000),
    effect String(15),
    name String(16),
    cost Number(4),
    fk_match_id_match Number(5)
);

CREATE TABLE team (
    id_team Number(5) PRIMARY KEY,
    name String(16),
    fk_match_id_match Number(5)
);

CREATE TABLE offensive_item (
    magic_damage Number(4),
    physic_damage Number(4),
    fk_item_id_item Number(5) PRIMARY KEY
);

CREATE TABLE consumable (
    mana Number(1),
    life Number(1),
    fk_item_id_item Number(5) PRIMARY KEY
);

CREATE TABLE defensive_item (
    res_magic Number(4),
    armor Number(4),
    fk_item_id_item Number(5) PRIMARY KEY
);

CREATE TABLE palyer_match_game (
    player_points Number(5),
    team_points Number(5),
    fk_match_id_match Number(5),
    fk_player_id_player Number(5)
);
 
ALTER TABLE player ADD CONSTRAINT FK_player_2
    FOREIGN KEY (fk_team_id_team)
    REFERENCES team (id_team)
    ON DELETE RESTRICT;
 
ALTER TABLE champion ADD CONSTRAINT FK_champion_2
    FOREIGN KEY (fk_player_id_player)
    REFERENCES player (id_player)
    ON DELETE RESTRICT;
 
ALTER TABLE match ADD CONSTRAINT FK_match_2
    FOREIGN KEY (fk_champion_id_champion)
    REFERENCES champion (id_champion)
    ON DELETE RESTRICT;
 
ALTER TABLE item ADD CONSTRAINT FK_item_2
    FOREIGN KEY (fk_match_id_match)
    REFERENCES match (id_match)
    ON DELETE RESTRICT;
 
ALTER TABLE team ADD CONSTRAINT FK_team_2
    FOREIGN KEY (fk_match_id_match)
    REFERENCES match (id_match)
    ON DELETE RESTRICT;
 
ALTER TABLE offensive_item ADD CONSTRAINT FK_offensive_item_2
    FOREIGN KEY (fk_item_id_item)
    REFERENCES item (id_item)
    ON DELETE CASCADE;
 
ALTER TABLE consumable ADD CONSTRAINT FK_consumable_2
    FOREIGN KEY (fk_item_id_item)
    REFERENCES item (id_item)
    ON DELETE CASCADE;
 
ALTER TABLE defensive_item ADD CONSTRAINT FK_defensive_item_2
    FOREIGN KEY (fk_item_id_item)
    REFERENCES item (id_item)
    ON DELETE CASCADE;
 
ALTER TABLE palyer_match_game ADD CONSTRAINT FK_palyer_match_game_1
    FOREIGN KEY (fk_match_id_match)
    REFERENCES match (id_match);
 
ALTER TABLE palyer_match_game ADD CONSTRAINT FK_palyer_match_game_2
    FOREIGN KEY (fk_player_id_player)
    REFERENCES player (id_player);