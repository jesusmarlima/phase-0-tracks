drop table buildings;
drop table apartments;


create table buildings (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  area INT,
  roof_top BOOLEAN
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

INSERT INTO buildings(name,area,roof_top) VALUES ("Green Grass",3000,"true");
INSERT INTO buildings(name,area,roof_top) VALUES ("Preaty Girls",3000,"true");
INSERT INTO buildings(name,area,roof_top) VALUES ("Fluffy Clouds",3000,"false");

INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1A",2,90,"false",1);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1B",2,90,"true",1);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1C",2,90,"true",1);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1D",2,90,"false",1);

INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1A",2,90,"false",2);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1B",2,90,"true",2);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1C",2,90,"true",2);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1D",2,90,"true",2);

INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1A",2,90,"false",3);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1B",2,90,"true",3);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1C",2,90,"true",3);
INSERT INTO apartments(number,beds,area,garage_vacancy,building_id) VALUES ("1D",2,90,"false",3);
