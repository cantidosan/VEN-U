
CREATE DATABASE venue;

-- DROP TABLE  IF EXISTS  users,venues,events,venueissues,amentities,pictures_events,pictures_venues,customer, ;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE user_type AS ENUM ('HOST', 'BOOKEE', 'CUSTOMER');
CREATE TYPE event_type AS ENUM ('1-1', '1-M', '1-S');

CREATE TABLE "users" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "username" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "created_at" date,
  "email" varchar(250),
  "password" varchar(250),
  "last_logged" varchar(250),
  "updated_at" varchar(250),
  "is_active" boolean,
  "user_type" user_type,
  "phone" varchar(250)
);



CREATE TABLE "events" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "name" varchar UNIQUE,
  "location" varchar(250),
  "bookee_id" uuid,
  "created_at" date,
  "type" event_type,
  "entry_price" int,
  "start_date" date,
  "duration" int,
  "start_time" time,
  "promotional_details" varchar(250),
  "venue_id" uuid,
  "is_active" boolean
);



CREATE TABLE "venueissues" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "title" varchar(250),
  "comment" varchar(250),
  "venue_id" uuid,
  "user_id" uuid
);


CREATE TABLE "venues" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "location" varchar(250) NOT NULL,
  "price" int NOT NULL,
  "host_id" uuid,
  "created_at" date,
  "updated_at" varchar(250),
  "is_active" boolean
);

CREATE TABLE "event_dates"(
  "id" uuid ,
  "event_id" uuid,
  "date"

);
-- CREATE TABLE "amenities" (
--   "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
--   "venue_id" uuid UNIQUE,
--   "amenity_id" uuid,
--   "amenity_name" varchar,
  
  
-- );

ALTER TABLE "events" ADD FOREIGN KEY("bookee_id") REFERENCES "users"("id");
ALTER TABLE "events" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");


CREATE TABLE "amenities"(

  "id" uuid  DEFAULT uuid_generate_v4() PRIMARY KEY,
  "name" VARCHAR
  
);



CREATE TABLE "venue_amenities"(

    "venue_id" uuid ,
    "amenity_id" uuid UNIQUE,
    "is_active" BOOLEAN,
    PRIMARY KEY(venue_id,amenity_id)
);

ALTER  TABLE "venue_amenities" ADD FOREIGN KEY("venue_id") REFERENCES "venues"("id");
ALTER  TABLE "venue_amenities" ADD FOREIGN KEY("amenity_id") REFERENCES "amenities"("id");



CREATE TABLE "events_pictures" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "event_id" uuid,
  "pic_url" varchar(250),
  "is_active" boolean
);

CREATE TABLE "venues_pictures" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "venue_id" uuid,
  "pic_url" varchar(250),
  "is_active" boolean
);

CREATE TABLE "customer" (
  "id" uuid  DEFAULT uuid_generate_v4 () PRIMARY KEY,
  "user_id" uuid,
  "event_id" uuid,
  "purchase_status" boolean
);

CREATE TABLE "dates"(
    "id" uuid 
);


ALTER TABLE "venues" ADD FOREIGN KEY ("host_id") REFERENCES "users" ("id");

ALTER TABLE "venueissues" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "venueissues" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");



ALTER TABLE "pictures_events" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

ALTER TABLE "pictures_venues" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

-- -- POPULATE THE USERS TABLE
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('rvallantine0', 'Retha', 'Vallantine', '9/2/2021', 'rvallantine0@thetimes.co.uk', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/24/2021', '4/22/2022', true, 'HOST', '979-395-5903');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('gevill1', 'Glenden', 'Evill', '12/10/2021', 'gevill1@economist.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/19/2022', '6/27/2021', false, 'CUSTOMER', '509-917-7392');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('fkennet2', 'Frasquito', 'Kennet', '3/26/2022', 'fkennet2@mit.edu', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/28/2022', '4/29/2021', false, 'BOOKEE', '676-947-0438');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('odurand3', 'Oren', 'Durand', '3/23/2022', 'odurand3@uol.com.br', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/14/2021', '7/19/2021', false, 'HOST', '333-560-3146');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('edionisii4', 'Emmeline', 'Dionisii', '9/5/2021', 'edionisii4@plala.or.jp', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/19/2022', '8/8/2021', false, 'CUSTOMER', '881-591-1433');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('mwarmisham5', 'Maryrose', 'Warmisham', '7/15/2021', 'mwarmisham5@google.fr', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/24/2021', '12/16/2021', false, 'BOOKEE', '778-790-2020');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('alyes6', 'Antoine', 'Lyes', '5/19/2021', 'alyes6@nature.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/29/2021', '7/8/2021', true, 'HOST', '333-682-6551');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('ecolbertson7', 'Emery', 'Colbertson', '10/14/2021', 'ecolbertson7@home.pl', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '9/1/2021', '5/22/2021', true, 'CUSTOMER', '858-105-3736');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('eodeegan8', 'Ealasaid', 'O''Deegan', '9/13/2021', 'eodeegan8@pbs.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/25/2021', '9/3/2021', false, 'BOOKEE', '143-189-9220');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dmetham9', 'Drucill', 'Metham', '5/8/2021', 'dmetham9@comsenz.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/14/2022', '1/28/2022', true, 'HOST', '489-420-1452');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('smacquakera', 'Siffre', 'MacQuaker', '2/18/2022', 'smacquakera@gnu.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '5/2/2021', '7/25/2021', true, 'CUSTOMER', '676-808-6095');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('lpaslowb', 'Lucy', 'Paslow', '8/3/2021', 'lpaslowb@amazonaws.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '2/5/2022', '8/17/2021', false, 'BOOKEE', '195-905-6899');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('mmarfieldc', 'Modestine', 'Marfield', '8/3/2021', 'mmarfieldc@xing.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/29/2021', '11/5/2021', true, 'HOST', '806-624-9904');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('nputtond', 'Natalie', 'Putton', '7/18/2021', 'nputtond@parallels.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/13/2022', '1/29/2022', true, 'CUSTOMER', '220-859-2454');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('vbloise', 'Vale', 'Blois', '12/31/2021', 'vbloise@cmu.edu', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/23/2022', '11/11/2021', true, 'BOOKEE', '905-439-3906');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('fheightonf', 'Finley', 'Heighton', '4/18/2022', 'fheightonf@gizmodo.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/24/2021', '11/17/2021', false, 'HOST', '341-485-5668');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('sastlettg', 'Stephine', 'Astlett', '1/31/2022', 'sastlettg@columbia.edu', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '9/18/2021', '9/22/2021', false, 'CUSTOMER', '453-651-0249');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dkillelayh', 'Delano', 'Killelay', '1/21/2022', 'dkillelayh@hugedomains.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/21/2022', '9/6/2021', false, 'BOOKEE', '216-526-1486');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('bgehrelsi', 'Boyd', 'Gehrels', '4/2/2022', 'bgehrelsi@zdnet.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/1/2021', '5/8/2021', false, 'HOST', '438-710-7843');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('jspellecyj', 'Jory', 'Spellecy', '10/24/2021', 'jspellecyj@fema.gov', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/17/2022', '10/2/2021', true, 'CUSTOMER', '368-515-6675');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('bludlammek', 'Bunni', 'Ludlamme', '7/3/2021', 'bludlammek@nifty.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '1/23/2022', '6/8/2021', true, 'BOOKEE', '596-699-8083');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('esertinl', 'Eziechiele', 'Sertin', '7/22/2021', 'esertinl@tumblr.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/14/2021', '10/27/2021', true, 'HOST', '434-521-3907');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dbarusm', 'Daniella', 'Barus', '10/18/2021', 'dbarusm@jimdo.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '7/26/2021', '5/18/2021', true, 'CUSTOMER', '295-913-0516');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('amccarlien', 'Atlanta', 'McCarlie', '6/2/2021', 'amccarlien@usatoday.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '9/17/2021', '3/29/2022', true, 'BOOKEE', '134-756-0896');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('jmcinneryo', 'Jayne', 'McInnery', '4/3/2022', 'jmcinneryo@aboutads.info', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '12/14/2021', '4/25/2021', true, 'HOST', '832-610-7937');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('btedmanp', 'Bertram', 'Tedman', '4/11/2022', 'btedmanp@wired.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '4/8/2022', '11/29/2021', false, 'CUSTOMER', '246-702-4312');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('vstockbridgeq', 'Valenka', 'Stockbridge', '2/5/2022', 'vstockbridgeq@dmoz.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '3/27/2022', '9/11/2021', false, 'BOOKEE', '119-373-4348');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('gsenussir', 'Garvey', 'Senussi', '1/26/2022', 'gsenussir@mozilla.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '12/4/2021', '2/2/2022', true, 'HOST', '358-913-4936');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('hguilletons', 'Henri', 'Guilleton', '5/29/2021', 'hguilletons@samsung.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/21/2021', '8/31/2021', true, 'CUSTOMER', '561-981-6903');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('tscheffelt', 'Tyler', 'Scheffel', '7/8/2021', 'tscheffelt@forbes.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/31/2021', '6/20/2021', false, 'BOOKEE', '645-101-3120');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('gwinnyu', 'Grover', 'Winny', '8/22/2021', 'gwinnyu@businessweek.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/6/2021', '8/21/2021', false, 'HOST', '129-785-7030');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('swrightonv', 'Sol', 'Wrighton', '6/29/2021', 'swrightonv@list-manage.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/7/2021', '9/17/2021', false, 'CUSTOMER', '937-420-7114');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('tmerigonw', 'Thadeus', 'Merigon', '11/29/2021', 'tmerigonw@slate.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/1/2021', '4/15/2022', true, 'BOOKEE', '583-639-1173');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('jkenningtonx', 'Joela', 'Kennington', '11/14/2021', 'jkenningtonx@reference.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '5/13/2021', '10/1/2021', true, 'HOST', '155-630-5826');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('ejanosevicy', 'Ettie', 'Janosevic', '12/5/2021', 'ejanosevicy@ca.gov', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '3/12/2022', '12/29/2021', false, 'CUSTOMER', '224-296-9051');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('dbaymanz', 'Dahlia', 'Bayman', '5/22/2021', 'dbaymanz@spiegel.de', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '11/24/2021', '12/7/2021', true, 'BOOKEE', '530-697-1038');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('cblagdon10', 'Charlie', 'Blagdon', '5/21/2021', 'cblagdon10@cbc.ca', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/10/2021', '1/3/2022', false, 'HOST', '951-605-3873');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('ismiz11', 'Ignacio', 'Smiz', '6/23/2021', 'ismiz11@miibeian.gov.cn', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '10/19/2021', '11/29/2021', true, 'CUSTOMER', '159-773-7741');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('megell12', 'Murielle', 'Egell', '6/30/2021', 'megell12@unesco.org', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/8/2021', '9/10/2021', false, 'BOOKEE', '324-883-0400');
insert into users (username, first_name, last_name, created_at, email, password, last_logged, updated_at, is_active, user_type, phone) values ('djeayes13', 'Dov', 'Jeayes', '9/23/2021', 'djeayes13@cyberchimps.com', '$2a$08$EeQcxhHIh4d7Q3JpOlBCq.M.wky0s19Gs.2L/kYfTmqwAGgjDTSVm', '8/29/2021', '8/25/2021', true, 'HOST', '478-261-7023');


-- --POPULATE THE AMENITIES TABLE
insert into amenities (name) values ('parking');
insert into amenities (name) values ('blankets');
insert into amenities (name) values ('food');
insert into amenities (name) values ('Electricity');
insert into amenities (name) values ('WiFi');

-- -- PROCEDURE-- 

-- CREATE OR REPLACE FUNCTION on_insert()
--   RETURNS trigger AS
-- $$
-- BEGIN
--          INSERT INTO venue_amenities(venue_id,amenity_id,is_active)
--          VALUES(NEW.venue_id,(SELECT id FROM amenities where name = 'parking'),false);
--          INSERT INTO venue_amenities(venue_id,amenity_id,is_active)
--          VALUES(NEW.venue_id,(SELECT id FROM amenities where name = 'blankets'),false);
--          INSERT INTO venue_amenities(venue_id,amenity_id,is_active)
--          VALUES(NEW.venue_id,(SELECT id FROM amenities where name = 'food'),false);
--          INSERT INTO venue_amenities(venue_id,amenity_id,is_active)
--          VALUES(NEW.venue_id,(SELECT id FROM amenities where name = 'Electricity'),false);
--          INSERT INTO venue_amenities(venue_id,amenity_id,is_active)
--          VALUES(NEW.venue_id,(SELECT id FROM amenities where name = 'WiFi'),false);
         
 
--     RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- -- TRIGGER

-- CREATE TRIGGER ins_same_rec
--   AFTER INSERT
--   ON venues
--   FOR EACH ROW
--   EXECUTE PROCEDURE on_insert();
  

-- --


-- POPULATE VENUES TABLE
-- NEEDS USERID
-- insert into venue_amenities(venue_id,amenities_id,is_active) VALUES(
--   (insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dallmark0', '9 Veith Hill', 1.59, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '7/28/2021', '10/19/2021', false) RETURNING id;),
--   (SELECT id FROM amenities where name = 'parking'),false)
-- )
  














-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('mmathis1', '207 Burning Wood Circle', 3, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '5/4/2021', '10/15/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('abeaston2', '6180 Rutledge Center', 4, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '1/18/2022', '5/29/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('drodell3', '698 Glacier Hill Way', 7, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '4/11/2022', '5/11/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('lallsupp4', '54 Shopko Terrace', 7, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '9/12/2021', '4/11/2022', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('mgreensted5', '8 Park Meadow Terrace', 5, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '11/11/2021', '5/8/2021', true);



-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('mgarretts6', '83452 1st Trail', 1, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '4/20/2022', '9/3/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('cmaudsley7', '83047 Clove Drive', 4, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '5/31/2021', '4/26/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('abernollet8', '616 Autumn Leaf Trail', 9, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '7/1/2021', '4/2/2022', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('vstclair9', '8100 Village Green Crossing', 2, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '2/27/2022', '1/12/2022', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ssteffensa', '83 Briar Crest Crossing', 5, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '9/29/2021', '4/21/2022', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('smccartb', '7070 Division Hill', 4, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '11/12/2021', '1/15/2022', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dlotsc', '1190 Roth Place', 1, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '1/17/2022', '1/1/2022', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ecourtind', '635 Marcy Place', 4, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '4/12/2022', '5/30/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('nbrusselse', '2538 Parkside Place', 7, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '6/8/2021', '5/15/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dbicklef', '572 Porter Alley', 8, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '6/22/2021', '6/22/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dpattieg', '7 Northfield Court', 1, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '12/8/2021', '5/20/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('spozzih', '0719 Dayton Alley', 3.49, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '6/23/2021', '5/10/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('tbramei', '1 7th Drive', 1.83, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '12/4/2021', '11/11/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('fmanwellj', '0 Washington Circle', 6, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '9/4/2021', '7/21/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('cbettesonk', '08730 Di Loreto Park', 7, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '11/10/2021', '6/10/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ihowell', '2887 Badeau Place', 2, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '3/5/2022', '8/14/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('npietrzakm', '3566 Kipling Parkway', 2.71, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '1/2/2022', '9/3/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ppennazzin', '793 Waywood Crossing', 3.97, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '1/31/2022', '9/18/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('nrammo', '65 Forest Avenue', 1, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '12/5/2021', '11/7/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dsotheronp', '91664 Charing Cross Plaza', '3.37', (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '6/5/2021', '5/6/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('abusheq', '821 Stuart Alley', 7.06, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '3/4/2022', '6/15/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('spriestlandr', '9402 Talmadge Alley', 1.49, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '2/25/2022', '10/27/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('bfyalls', '98 Forster Parkway', 6.41, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '8/14/2021', '2/10/2022', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ckyndert', '558 Lerdahl Pass', 5.98, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '7/10/2021', '2/18/2022', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('asandifordu', '276 Fordem Crossing', 8.2, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '10/17/2021', '7/13/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('ccaplisv', '84901 Marcy Road', 1.44, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '1/25/2022', '3/22/2022', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('dfeakew', '6 Quincy Way', 7.09, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '7/31/2021', '1/23/2022', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('bfullalovex', '7475 Nelson Court', 8, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '8/7/2021', '11/18/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('chearmony', '1397 Gerald Parkway', 52, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '12/30/2021', '1/5/2022', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('amcrillz', '909 South Court', 9, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '5/24/2021', '6/17/2021', true);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('tpolack10', '48 Butterfield Alley', 8.35, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '9/30/2021', '11/29/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('alinnit11', '7 Arkansas Lane', 4.29, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '9/9/2021', '5/27/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('sopie12', '45 Randy Drive', 3.21, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '11/5/2021', '6/13/2021', false);
-- insert into venues (name, location, price, host_id, created_at, updated_at, is_active) values ('rherreros13', '80 Crowley Trail', 3.46, (SELECT id FROM users WHERE user_type = 'HOST' ORDER BY RANDOM() LIMIT 1), '2/21/2022', '7/30/2021', false);


-- POPULATE THE EVENTS TABLE
-- NEEDS USERID AND VENUE ID

-- insert into events (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Torphy Group', '4 South Point', (SELECT id FROM users WHERE user_type='BOOKEE' ORDER BY RANDOM() LIMIT 1), '10/26/2021', '1-S', 5, '1/1/2022', 74, '7:10 PM', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', (SELECT id from venues WHERE is_active = true ORDER BY RANDOM() LIMIT 1)  , true);
-- insert into events (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Reinger, Wilderman and Cummings', '748 Tomscot Alley', (SELECT id FROM users WHERE user_type='BOOKEE' ORDER BY RANDOM() LIMIT 1), '8/6/2021', '1-M', 89, '11/22/2021', 57, '1:04 PM', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.',(SELECT id from venues WHERE is_active = true ORDER BY RANDOM() LIMIT 1), false);
-- insert into events (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Robel and Sons', '035 Division Crossing', (SELECT id FROM users WHERE user_type='BOOKEE' ORDER BY RANDOM() LIMIT 1), '7/14/2021', '1-S', 77, '1/16/2022', 3, '9:20 PM', 'Fusce posuere felis sed lacus. Morbi sem mauris, us.sque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', (SELECT id from venues WHERE is_active = true ORDER BY RANDOM() LIMIT 1), false);
-- insert into events (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Collier, Collins and Stracke', '194 Pankratz Lane', (SELECT id FROM users WHERE user_type='BOOKEE' ORDER BY RANDOM() LIMIT 1), '4/30/2021', '1-M', 21, '3/9/2022', 15, '5:52 AM', 'Maecenas tristique, est et tempus semper, est quaa Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', (SELECT id from venues WHERE is_active = true ORDER BY RANDOM() LIMIT 1), false);
-- insert into events (name, location, bookee_id, created_at, type, entry_price, start_date, duration, start_time, promotional_details, venue_id, is_active) values ('Kling, Beahan and Kuhlman', '05 Cardinal Hill', (SELECT id FROM users WHERE user_type='BOOKEE' ORDER BY RANDOM() LIMIT 1), '12/2/2021', '1-1', 68, '10/8/2021', 55, '7:56 PM', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', (SELECT id from venues WHERE is_active = true ORDER BY RANDOM() LIMIT 1), true);







-- NEEDS VENUEID

-- insert into venue_amenities (venue_id, amenity_id, is_active) values ('b00f31aa-2e36-43a0-b672-a3913d9c2ad5', '1ff4786d-cd58-47a5-9683-a48568ae1f3d',false);
-- insert into venue_amenities (venue_id,amenity_id, is_active ) values ('b00f31aa-2e36-43a0-b672-a3913d9c2ad5', '80e5964f-6409-41c1-a620-bdc329cd5def',false);
-- insert into venue_amenities (venue_id,amenity_id, is_active ) values ('b00f31aa-2e36-43a0-b672-a3913d9c2ad5', 'cdd5fcb7-7e93-4e45-b4e3-eb1f6b8a96cb',false);
-- insert into venue_amenities (venue_id,amenity_id, is_active ) values ('b00f31aa-2e36-43a0-b672-a3913d9c2ad5','25ab1821-07db-41db-b384-2950ef4f754a',false);








-- -- POPULATE EVENT PICTURES TABLE
-- insert into pictures_events (event_id, pic_url, is_active) values ('3b26f2ac-b306-41af-8179-3bcf41f91e50', 'https://unsplash.com/photos/hTv8aaPziOQ', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('3b26f2ac-b306-41af-8179-3bcf41f91e50', 'https://unsplash.com/photos/hzgs56Ze49s', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('3b26f2ac-b306-41af-8179-3bcf41f91e50', 'https://unsplash.com/photos/ULHxWq8reao', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('3b26f2ac-b306-41af-8179-3bcf41f91e50', 'https://unsplash.com/photos/fIHozNWfcvs', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('56c86030-05a8-490a-891a-46604d66a63a', 'https://unsplash.com/photos/I9j8Rk-JYFM', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('56c86030-05a8-490a-891a-46604d66a63a', 'https://unsplash.com/photos/9vDdkxSCAD4', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('56c86030-05a8-490a-891a-46604d66a63a', 'https://unsplash.com/photos/74tlEYKgrBE', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('ed2249bb-b217-4400-97c1-a35ab773bdbf', 'https://unsplash.com/photos/nLUb9GThIcg', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('ed2249bb-b217-4400-97c1-a35ab773bdbf', 'https://unsplash.com/photos/_HXFz-0g9w8', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('ed2249bb-b217-4400-97c1-a35ab773bdbf', 'https://unsplash.com/photos/3skLpaOBlMw', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('a7994559-83ef-4464-a8e7-69c6095c6554', 'https://unsplash.com/photos/OQOKSsj8QME', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('a7994559-83ef-4464-a8e7-69c6095c6554', 'https://unsplash.com/photos/ya631mqQ7Ng', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('a7994559-83ef-4464-a8e7-69c6095c6554', 'https://unsplash.com/photos/UV3GmG_HEqI', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('933510e5-d960-4bd2-a67e-48d702df7fad', 'https://unsplash.com/photos/AZMmUy2qL6A', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('933510e5-d960-4bd2-a67e-48d702df7fad', 'https://unsplash.com/photos/vFMY_lgJ8rg', true);
-- insert into pictures_events (event_id, pic_url, is_active) values ('933510e5-d960-4bd2-a67e-48d702df7fad', 'https://unsplash.com/photos/pYjRGc81avs', true);



-- -- POPULATE VENUE PICTURES TABLE
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('29594aa7-9160-4344-96b4-ccca63e15bf0', 'https://unsplash.com/photos/olVJDJYKPSI', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('29594aa7-9160-4344-96b4-ccca63e15bf0', 'https://unsplash.com/photos/fqUmkIyFMNk', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('d3136f4b-e852-4be1-94db-13245240e295', 'https://unsplash.com/photos/skAv-NHClaE', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('d3136f4b-e852-4be1-94db-13245240e295', 'https://unsplash.com/photos/NMcC4oakPKc', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('c385fc4b-070a-4fca-a512-11f219f60b71', 'https://unsplash.com/photos/vTA42h-v0pw', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('c385fc4b-070a-4fca-a512-11f219f60b71', 'https://unsplash.com/photos/ZYT7O6UlB14', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('3bc97358-d171-4c02-846a-e38425f53993', 'https://unsplash.com/photos/s08uwbS1DkE', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('3bc97358-d171-4c02-846a-e38425f53993', 'https://unsplash.com/photos/NmInovQT-Rs', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('b00f31aa-2e36-43a0-b672-a3913d9c2ad5', 'https://unsplash.com/photos/iJgmwXLc35g', true);
-- insert into pictures_venues (venue_id, pic_url, is_active) values ('b00f31aa-2e36-43a0-b672-a3913d9c2ad5', 'https://unsplash.com/photos/Y9xVffMVZNM', true);



-- --POPULATE VENUEiSSUES TABLE


-- --POPULATE THE CUSTOMER TABLE

-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');
-- INSERT INTO customer(user_id,event_id,purchase_status) VALUES('','','F');








-- RENAME PICTURES VENUES TO VENUE_PICTURES


