INSERT INTO artists (name) VALUES
    ('The Weeknd'),
    ('Billie Eilish'),
    ('Dua Lipa'),
    ('Taylor Swift'),
    ('Arctic Monkeys');

INSERT INTO genres (name) VALUES
    ('Pop'),
    ('R&B'),
    ('Indie'),
    ('Electropop'),
    ('Alternative');

INSERT INTO artist_genres (artist_id, genre_id) VALUES
    (1, 1), (1, 2),
    (2, 1), (2, 4),
    (3, 1),
    (4, 1), (4, 3),
    (5, 3), (5, 5);

INSERT INTO albums (title, release_year) VALUES
    ('After Hours', 2020),
    ('Happier Than Ever', 2021),
    ('Future Nostalgia', 2020),
    ('Folklore', 2020),
    ('The Car', 2022),
    ('Midnights', 2022);

INSERT INTO album_artists (album_id, artist_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 4);

INSERT INTO tracks (title, duration, album_id) VALUES
    ('Blinding Lights', '00:03:20', 1),
    ('Save Your Tears', '00:03:35', 1),
    ('Therefore I Am', '00:02:54', 2),
    ('My Future', '00:03:30', 2),
    ('Dont Start Now', '00:03:03', 3),
    ('Levitating', '00:03:23', 3),
    ('Physical', '00:03:45', 3),
    ('Cardigan', '00:03:59', 4),
    ('Exile', '00:04:45', 4),
    ('The 1', '00:03:30', 4),
    ('Thered Better Be A Mirrorball', '00:04:25', 5),
    ('Body Paint', '00:04:50', 5),
    ('Anti-Hero', '00:03:20', 6),
    ('Lavender Haze', '00:03:22', 6),
    ('Long Track', '00:05:30', 1),
    ('My Everything', '00:04:15', 2),
    ('my own', '00:04:15', 2),
    ('own my', '00:04:15', 2),
    ('my', '00:04:15', 2),
    ('oh my god', '00:04:15', 2),
    ('myself', '00:04:15', 2),
    ('by myself', '00:04:15', 2),
    ('bemy self', '00:04:15', 2),
    ('myself by', '00:04:15', 2),
    ('by myself by', '00:04:15', 2),
    ('beemy', '00:04:15', 2),
    ('premyne', '00:04:15', 2);

INSERT INTO compilations (title, release_year) VALUES
    ('Best Pop Hits 2020', 2020),
    ('Chill Vibes', 2019),
    ('Party Mix 2021', 2021),
    ('Indie Selection', 2020),
    ('Summer Hits 2022', 2022),
    ('My Favorite Songs', 2018);

INSERT INTO Compilation_Tracks (compilation_id, track_id) VALUES
    (1, 1), (1, 5), (1, 6),
    (2, 4), (2, 8), (2, 9),
    (3, 2), (3, 5), (3, 6),
    (4, 10), (4, 11),
    (5, 12), (5, 13), (5, 14),
    (6, 1), (6, 3), (6, 7), (6, 16);