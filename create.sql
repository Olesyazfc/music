create table if not exists genre (
	id serial primary key,
	title varchar(50) not null unique
);

create table if not exists singers (
	id serial primary key,
	singer_name varchar(30) not null
);

create table if not exists SingersGenre (
	singer_id integer  references singers(id),
	genre_id integer references genre(id),
	constraint pk primary key(singer_id, genre_id)
);
	
create table if not exists albums (
	id serial primary key,
	album_title varchar(50) unique not null,
	album_date integer check (album_date > 0)
);

create table if not exists AlbumsSinger (
	album_id integer references albums(id),
	singer_id integer references singers(id),
	constraint pk primary key(album_id, singer_id)
);

create table if not exists songs (
	id serial primary key,
	title varchar(50) not null unique,
	song_time numeric(4,2) check (song_time > 0),
	album_id integer references albums(id)
);

create table if not exists collection (
	id serial primary key,
	collection_name varchar(50) not null,
	collection_date integer check (collection_date > 0)
);

create table if not exists CollectionSongs (
	song_id integer references songs(id),
	collection_id integer references collection(id),
	constraint song_pk primary key(song_id, collection_id)
);
	
	