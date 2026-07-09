-- create
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    photo_url VARCHAR(500),
    instagram_link VARCHAR(500),
    github_link VARCHAR(500),
    linkedin_link VARCHAR(500),
    is_active BOOLEAN DEFAULT true
);

CREATE TABLE competitions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    result VARCHAR(100),
    initial_date DATE,
    final_date DATE,
    location VARCHAR(150),
    status VARCHAR(20)
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    status VARCHAR(20),
    github_link VARCHAR(500)
);

CREATE TABLE competitions_photos (
    id SERIAL PRIMARY KEY,
    competition_id INTEGER NOT NULL,
    photo_url VARCHAR(500) NOT NULL,
    caption VARCHAR(300),
    is_primary BOOLEAN DEFAULT false,
    CONSTRAINT fk_competitions_photos_competition 
        FOREIGN KEY (competition_id) REFERENCES competitions(id) ON DELETE CASCADE
);

CREATE TABLE projects_photos (
    id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    photo_url VARCHAR(500) NOT NULL,
    caption VARCHAR(300),
    is_primary BOOLEAN DEFAULT false,
    CONSTRAINT fk_projects_photos_project 
        FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    photo_url VARCHAR(500) NOT NULL,
    caption VARCHAR(300),
    type VARCHAR(50) NOT NULL /* main_carousel, competition_highlight, about_us */
);

-- delete
DROP TABLE IF EXISTS
    projects_photos,
    competitions_photos,
    projects,
    competitions,
    photos,
    members CASCADE;

-- insert into members
INSERT INTO members (name, role, photo_url, instagram_link, github_link, linkedin_link, is_active)
VALUES (
    'Marcos Schlick',
    'Desenvolvedor',
    'https://res.cloudinary.com/dwhpzgmdq/image/upload/perfil_2_oqyhil.jpg',
    'https://www.instagram.com/marcosschlick/',
    'https://github.com/marcosschlick',
    'https://www.linkedin.com/in/marcosschlick/',
    true
);

INSERT INTO members (name, role, photo_url, instagram_link, github_link, linkedin_link, is_active)
VALUES (
    'William Meireles',
    'Engenheiro',
    'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_0040_yzu8kq.png',
    'https://www.instagram.com/villiaaaan/',
    'https://github.com/williamFRZ',
    'https://www.linkedin.com/in/williammeireles/',
    true
);

INSERT INTO members (name, role, photo_url, instagram_link, github_link, linkedin_link, is_active)
VALUES (
    'Any da Rosa',
    'Documentadora',
    'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_0035_ctr752.png',
    NULL,
    'https://github.com/darosagomezany',
    'https://www.linkedin.com/in/any-da-rosa/',
    false
);

INSERT INTO members (name, role, photo_url, instagram_link, github_link, linkedin_link, is_active)
VALUES (
    'Bruno Torres',
    'Fotógrafo',
    'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_0034_iqi347.png',
    'https://www.instagram.com/brunorodriguess00/',
    'https://github.com/brunorafatorres',
    'https://www.linkedin.com/in/bruno-rodr%C3%ADgues-92b7ab295/',
    true
);

INSERT INTO members (name, role, photo_url, instagram_link, github_link, linkedin_link, is_active)
VALUES (
    'Mirta Trindade',
    'Administrativa',
    'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_0045_nlwsfx.png',
    'https://www.instagram.com/mirta.trindade/',
    NULL,
    NULL,
    true
);

INSERT INTO members (name, role, photo_url, instagram_link, github_link, linkedin_link, is_active)
VALUES (
    'Luis Lima',
    'Mecânico',
    'https://res.cloudinary.com/dwhpzgmdq/image/upload/Design_sem_nome_xu8mft.png',
    NULL,
    NULL,
    NULL,
    true
);

-- insert into photos
/* competition_highlight */
INSERT INTO photos (photo_url, caption, type) VALUES
('https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9819_n2ah1f.jpg', 'Team receiving the first place award in the first edition of BRABOTS', 'competition_highlight'),
('https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9742_kzqkw3.jpg', 'Marcos and William in the first edition of BRABOTS', 'competition_highlight'),
('https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9722_chhzyv.jpg', 'Marcos and Willian finishing the car', 'competition_highlight');


/* about us */
INSERT INTO photos (photo_url, caption, type) VALUES
('https://res.cloudinary.com/dwhpzgmdq/image/upload/LOGO_BOTSIL_DARK_TRANSPARENT_knyh8l.png', 'Botsil s logo', 'about_us'),
('https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9742_kzqkw3.jpg', 'Marcos and William in the first edition of BRABOTS', 'about_us');

-- insert into competitions 
INSERT INTO competitions (
    name,
    description,
    result,
    initial_date,
    final_date,
    location,
    status
) VALUES (
    '1ª BRABOTS',
    'Competição de robótica do IFSul Campus Santana do Livramento. Esta edição envolveu criação de carros com Arduino. Modalidades da competição: arrancada, puxar peso, salto em rampa e avaliação das equipes.',
    '1º Lugar',
    '2025-05-29',
    '2025-05-29',
    'IFSul Santana do Livramento - RS',
    'Finalizada'
);

INSERT INTO competitions (
    name,
    description,
    result,
    initial_date,
    final_date,
    location,
    status
) VALUES (
    '2ª BRABOTS',
    'Competição de robótica do IFSul Campus Santana do Livramento. Esta edição envolve criação de carros com Arduino controlados remotamente via Bluetooth. Modalidades da competição: cabo de guerra, pista de obstáculos, corrida maluca e escuderia.',
    '1º Lugar',
    '2025-10-01',
    '2025-10-01',
    'IFSul Santana do Livramento - RS',
    'Finalizada'
);

--insert into competitions_photos
INSERT INTO competitions_photos (competition_id, photo_url, caption, is_primary) VALUES
(1, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9819_n2ah1f.jpg', 'Equipe BOTSIL na premiação do primeiro lugar do BRABOTS', true),
(1, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9742_kzqkw3.jpg', 'Marcos e Willian competindo na primeira edição do BRABOTS', false),
(1, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9768_cjb0az.jpg', 'Marcos e Willian competindo na primeira edição do BRABOTS', false),
(1, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9722_chhzyv.jpg', 'Marcos e Willian finalizando o carro Arduino', false),
(1, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9743_mdya6u.jpg', 'Equipe do BOTSIL para a primeira edição do BRABOTS', false);

INSERT INTO competitions_photos (competition_id, photo_url, caption, is_primary) VALUES
(2, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_2603_ggcjgx.png', 'Equipe BOTSIL após a vitória da segunda edição com o professor organizador Vinicius', true),
(2, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_6354_haf8od.jpg', 'BOTSIL sendo julgada pelos jurados convidados da equipe URUBOTS', false),
(2, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/DSCN9930_wpiqvh.jpg', 'Marcos segurando o computador com o site do BOTSIL', false),
(2, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG_2575_mmwwo5.png', 'Bruno e William mostrando a camiseta do BOTSIL', false),
(2, 'https://res.cloudinary.com/dwhpzgmdq/image/upload/IMG-20251002-WA0092_qlzoem.jpg', 'Pódio da segunda edição do BRABOTS', false);

