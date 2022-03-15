
DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	image varchar(255) NULL,
	route VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
	id BIGSERIAL PRIMARY KEY,
	email VARCHAR (255) NOT NULL UNIQUE,
	name VARCHAR (255) NOT NULL,
	lastname VARCHAR (255) NOT NULL,
	phone VARCHAR (80) NOT NULL UNIQUE,
	password VARCHAR (255) NOT NULL,
	image VARCHAR (255) NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR (255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS user_has_roles CASCADE;
CREATE TABLE user_has_roles (
	id_user BIGSERIAL NOT NULL,
	id_rol BIGSERIAL NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (id_user, id_rol)
);

INSERT INTO roles (
	 name, 
	 route,
	 created_at,
	 updated_at
	 )
	VALUES(
		'CLIENTE',
		'client/field/list',
		'2022-03-05',
		'2022-03-05'
		);

		INSERT INTO roles (
	 name, 
	 route,
	 created_at,
	 updated_at
	 )
	VALUES(
		'CANCHA',
		'cancha/field/list',
		'2022-03-05',
		'2022-03-05'
	);

DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	description VARCHAR (255) NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS fields CASCADE;
CREATE TABLE fields(
	ID BIGSERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
	image1 VARCHAR (255) NULL,
	image2 VARCHAR (255) NULL,
	id_category BIGINT NOT NULL,
	id_adress BIGINT NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY (id_category) REFERENCES categories(id)	ON UPDATE CASCADE ON DELETE CASCADE
	FOREIGN KEY (id_adress) REFERENCES adress(id)	ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS adress CASCADE;
CREATE TABLE adress(
	id BIGSERIAL PRIMARY KEY,
	adress VARCHAR(255) NOT NULL,
	street1 VARCHAR (255) NOT NULL,
	street2 VARCHAR (255) NOT NULL,
	reference VARCHAR (255) NOT NULL,
	latitude DECIMAL DEFAULT 0,
	longitude DECIMAL DEFAULT 0,
	id_field BIGINT NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY (id_field) REFERENCES fields(id)	ON UPDATE CASCADE ON DELETE CASCADE
);