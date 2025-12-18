/* avaliacao1_logico: */

CREATE TABLE usuario (
    id_usuario Number(5) PRIMARY KEY,
    nome String(250),
    email String(250),
    senha String(250),
    data_nascimento Number(8),
    fk_endereco_endereco_PK String(250)
);

CREATE TABLE conteudo (
    id_conteudo Number(5) PRIMARY KEY,
    nome_conteudo String(250),
    descricao String(250),
    data_publicacao Number(8),
    idioma String(50)
);

CREATE TABLE artista (
    nome_artista String(250),
    album_artista String(250),
    id_artista Number(5) PRIMARY KEY
);

CREATE TABLE playlist (
    id_playlist Number(5) PRIMARY KEY,
    nome_playlist String(250),
    fk_usuario_id_usuario Number(5),
    fk_conteudo_id_conteudo Number(5)
);

CREATE TABLE pagamento (
    id_pagamento Number(5) PRIMARY KEY,
    data_pag Number(8),
    valor_pag Number(3),
    fk_usuario_id_usuario Number(5)
);

CREATE TABLE genero (
    id_genero Number(5) PRIMARY KEY,
    tipo_genero String(50),
    fk_conteudo_id_conteudo Number(5)
);

CREATE TABLE avaliacao_ouve (
    id_avaliacao Number(5) PRIMARY KEY,
    comentarios String(250),
    data_avaliacao Number(8),
    fk_usuario_id_usuario Number(5),
    fk_conteudo_id_conteudo Number(5)
);

CREATE TABLE lista_desejos_ouvira (
    id_lista_desejo Number(5) PRIMARY KEY,
    fk_conteudo_id_conteudo Number(5),
    fk_usuario_id_usuario Number(5)
);

CREATE TABLE musica (
    titulo String(250),
    fk_conteudo_id_conteudo Number(5) PRIMARY KEY
);

CREATE TABLE podcast (
    duracao Number(6),
    fk_conteudo_id_conteudo Number(5) PRIMARY KEY
);

CREATE TABLE user_basic (
    nao_pular_musicas String(3),
    com_anuncios String(3),
    fk_usuario_id_usuario Number(5) PRIMARY KEY
);

CREATE TABLE user_premium (
    pular_musicas String(3),
    sem_anuncios String(3),
    fk_usuario_id_usuario Number(5) PRIMARY KEY
);

CREATE TABLE endereco (
    endereco_PK String(250) PRIMARY KEY,
    rua String(100),
    cidade String(100),
    cep Number(8),
    numero Number(4)
);

CREATE TABLE criar (
    fk_conteudo_id_conteudo Number(5),
    fk_artista_id_artista Number(5)
);
 
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_2
    FOREIGN KEY (fk_endereco_endereco_PK)
    REFERENCES endereco (endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE playlist ADD CONSTRAINT FK_playlist_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE playlist ADD CONSTRAINT FK_playlist_3
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE pagamento ADD CONSTRAINT FK_pagamento_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE genero ADD CONSTRAINT FK_genero_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE avaliacao_ouve ADD CONSTRAINT FK_avaliacao_ouve_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE avaliacao_ouve ADD CONSTRAINT FK_avaliacao_ouve_3
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE lista_desejos_ouvira ADD CONSTRAINT FK_lista_desejos_ouvira_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo);
 
ALTER TABLE lista_desejos_ouvira ADD CONSTRAINT FK_lista_desejos_ouvira_3
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);
 
ALTER TABLE musica ADD CONSTRAINT FK_musica_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE podcast ADD CONSTRAINT FK_podcast_2
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE user_basic ADD CONSTRAINT FK_user_basic_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE user_premium ADD CONSTRAINT FK_user_premium_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE criar ADD CONSTRAINT FK_criar_1
    FOREIGN KEY (fk_conteudo_id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE criar ADD CONSTRAINT FK_criar_2
    FOREIGN KEY (fk_artista_id_artista)
    REFERENCES artista (id_artista)
    ON DELETE SET NULL;