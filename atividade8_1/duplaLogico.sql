/* duplaLogico: */

CREATE TABLE events (
    id Number(5) PRIMARY KEY,
    name String(25),
    date Number(8),
    place String(25),
    creator String(25),
    fk_user_id Number(5)
);

CREATE TABLE grup_administrator (
    fk_user_id Number(5) PRIMARY KEY
);

CREATE TABLE user (
    id Number(5) PRIMARY KEY,
    name String(25),
    email String(256),
    date_birth Number(8),
    password String(256),
    username String(25),
    registration_date Number(8)
);

CREATE TABLE common_user (
    fk_user_id Number(5) PRIMARY KEY
);

CREATE TABLE post (
    id Number(5) PRIMARY KEY,
    text String(100),
    publication_date Number(8),
    time_publication Number(8),
    number_likes number(5),
    fk_user_id Number(5)
);

CREATE TABLE comment (
    text String(100),
    publication_date Number(8),
    id Number(5) PRIMARY KEY
);

CREATE TABLE E__Assoc__3_grup (
    two_users Number(5),
    id Number(5) PRIMARY KEY,
    friendship_date Number(8),
    creation_date Number(8),
    name String(25),
    administrator String(25),
    fk_user_id Number(5)
);

CREATE TABLE like (
    post Number(3),
    user String(25),
    id Number(5) PRIMARY KEY,
    fk_post_id Number(5)
);

CREATE TABLE receives (
    fk_comment_id Number(5),
    fk_post_id Number(5)
);
 
ALTER TABLE events ADD CONSTRAINT FK_events_2
    FOREIGN KEY (fk_user_id)
    REFERENCES user (id)
    ON DELETE RESTRICT;
 
ALTER TABLE grup_administrator ADD CONSTRAINT FK_grup_administrator_2
    FOREIGN KEY (fk_user_id)
    REFERENCES user (id)
    ON DELETE CASCADE;
 
ALTER TABLE common_user ADD CONSTRAINT FK_common_user_2
    FOREIGN KEY (fk_user_id)
    REFERENCES user (id)
    ON DELETE CASCADE;
 
ALTER TABLE post ADD CONSTRAINT FK_post_2
    FOREIGN KEY (fk_user_id)
    REFERENCES user (id)
    ON DELETE RESTRICT;
 
ALTER TABLE E__Assoc__3_grup ADD CONSTRAINT FK_E__Assoc__3_grup_2
    FOREIGN KEY (fk_user_id)
    REFERENCES user (id);
 
ALTER TABLE like ADD CONSTRAINT FK_like_2
    FOREIGN KEY (fk_post_id)
    REFERENCES post (id)
    ON DELETE RESTRICT;
 
ALTER TABLE receives ADD CONSTRAINT FK_receives_1
    FOREIGN KEY (fk_comment_id)
    REFERENCES comment (id)
    ON DELETE RESTRICT;
 
ALTER TABLE receives ADD CONSTRAINT FK_receives_2
    FOREIGN KEY (fk_post_id)
    REFERENCES post (id)
    ON DELETE RESTRICT;