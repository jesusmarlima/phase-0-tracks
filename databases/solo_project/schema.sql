drop table buildings;
drop table apartments;


create table buildings (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  area INT,
  roof_top BOOLEAN,
  floors INT
);

create table apartments (
  id INTEGER PRIMARY KEY,
  number VARCHAR(3),
  beds INT,
  area INT,
  garage_vacancy BOOLEAN,
  building_id INT,
  FOREIGN KEY (building_id) references buildings (id)
  );


--DATA--

INSERT INTO buildings(id,name,area,roof_top,floors) VALUES (1,"Green Grass",270,"true",3);
INSERT INTO buildings(id,name,area,roof_top,floors) VALUES (2,"Pretty Girls",300,"true",3);
INSERT INTO buildings(id,name,area,roof_top,floors) VALUES (3,"Fluffy Clouds",600,"false",3);

INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (1,"1A",2,90,"false",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (2,"1B",2,90,"true",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (3,"1C",2,90,"true",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (4,"2A",2,90,"false",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (5,"2B",2,90,"true",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (6,"2C",2,90,"true",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (7,"3A",2,90,"false",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (8,"3B",2,90,"true",1);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (9,"3C",2,90,"true",1);

INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (10,"1A",3,100,"false",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (11,"1B",3,100,"false",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (12,"1C",3,100,"true",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (13,"2A",3,100,"false",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (14,"2B",3,100,"false",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (15,"2C",3,100,"true",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (16,"3A",3,100,"false",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (17,"3B",3,100,"false",2);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (18,"3C",3,100,"true",2);

INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (19,"1A",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (20,"1B",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (21,"1C",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (22,"2A",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (23,"2B",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (24,"2C",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (25,"3A",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (26,"3B",4,200,"true",3);
INSERT INTO apartments(id,number,beds,area,garage_vacancy,building_id) VALUES (27,"3C",4,200,"true",3);