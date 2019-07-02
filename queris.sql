--FASE 1

    --Creem la taula d'importacio dels propietaris

     DROP TABLE IF EXISTS TaulaIProp;
     CREATE TABLE TaulaIProp (

       id_prop bigint,
       matricula CHAR(13),
       nom VARCHAR(255)
       );
	--Inserim la informació a la taula

      COPY TaulaIProp FROM 'C:\Program Files\BDD\propietaris.csv' DELIMITER ';';
      SELECT * FROM TaulaIProp;


    --Creem la taula d'importacio de Infraccions de trafic

    DROP TABLE IF EXISTS TaulaITraffic;
    CREATE TABLE TaulaITraffic (
       date_of_stop date,
       time_of_stop time,
       agency CHAR(4),
       sub_agency VARCHAR (255),
       description VARCHAR (255),
       location VARCHAR (255),
       latitude VARCHAR (255),
       longitude VARCHAR (255),
       accident boolean,
       belts boolean,
       personal_injury boolean,
       property_damage boolean,
       fatal boolean,
       hazmat boolean,
       alcohol boolean,
       work_zone boolean,
       state VARCHAR(255),
       license VARCHAR(255),
       vehicle_type VARCHAR(255),
       driving_license CHAR(3),
       year int,
       make VARCHAR(255),
       model VARCHAR(255),
       color VARCHAR(255),
       violation_type VARCHAR(255),
       charge VARCHAR(255),
       contributed boolean,
       race VARCHAR(255),
       gender CHAR(3),
       driver_city VARCHAR(255),
       driver_state CHAR(5),
       dl_state CHAR(5),
       arrest_type VARCHAR(255),
       id_person bigint
       );



	--Inserim la informació a la taula

    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_1.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_2.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_3.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_4.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_5.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_6.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_7.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_8.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_9.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_10.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_11.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_12.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_13.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_14.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_15.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_16.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_17.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_18.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_19.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_20.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_21.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_22.csv' DELIMITER ';' CSV HEADER;
    COPY TaulaITraffic FROM  'C:\Program Files\BDD\traffic_violations_23.csv' DELIMITER ';' CSV HEADER;
    select * from TaulaItraffic;



    --Creem taula comisaria

    DROP TABLE IF EXISTS Comisaria CASCADE;
    CREATE TABLE Comisaria (

       agency CHAR(4),
       PRIMARY KEY (agency)

       );

    --Creem taula districte

    DROP TABLE IF EXISTS District CASCADE;
    CREATE TABLE District (

       sub_agency VARCHAR(255),
       agency CHAR(4),
       FOREIGN KEY (agency) REFERENCES Comisaria(agency),
       PRIMARY KEY (sub_agency)
       );

    --Creem la taula State

    DROP TABLE IF EXISTS State CASCADE;
    CREATE TABLE State (

       state_name VARCHAR(255),
       id_state serial,
       PRIMARY KEY (id_state)
       );

    --Creem la taula City

    DROP TABLE IF EXISTS City CASCADE;
    CREATE TABLE City (

       city_name VARCHAR(255),
       id_city serial,
       id_state integer,
       FOREIGN KEY (id_state) REFERENCES State(id_state),
       PRIMARY KEY (id_city)
       );

    --Creem taula conductor

    DROP TABLE IF EXISTS Conductor CASCADE;
    CREATE TABLE Conductor (

       id_driver bigint,
       race VARCHAR(255),
       gender CHAR(3),
       city integer,
       PRIMARY KEY (id_driver),
       FOREIGN KEY (city) REFERENCES City(id_city)

       );

	--Creem la taula Tipus Carnet

    DROP TABLE IF EXISTS TipusC CASCADE;
    CREATE TABLE TipusC (

       tipus CHAR(3),
       PRIMARY KEY (tipus)

       );

    --Creem la taula Carnet

    DROP TABLE IF EXISTS Carnet CASCADE;
    CREATE TABLE Carnet (

       id_driver bigint,
       id_state int,
       tipus CHAR(3),
       FOREIGN KEY (id_driver) REFERENCES Conductor(id_driver),
       FOREIGN KEY (id_state) REFERENCES State(id_state),
       FOREIGN KEY (tipus) REFERENCES TipusC(tipus),
       PRIMARY KEY(id_driver,tipus)
       );

    --Creem taula propietari

    DROP TABLE IF EXISTS Propietari CASCADE;
    CREATE TABLE Propietari (

       id_driver bigint,
       nom VARCHAR(255),
       FOREIGN KEY (id_driver) REFERENCES Conductor(id_driver),
       PRIMARY KEY (id_driver)
       );


    --Creem taula vehicle

    DROP TABLE IF EXISTS Vehicle CASCADE;
    CREATE TABLE Vehicle (

       matricula VARCHAR(255),
       id_prop bigint,
       vehicle_type VARCHAR(255),
       year int,
       make VARCHAR(255),
       model VARCHAR(255),
       color VARCHAR(255),
       FOREIGN KEY (id_prop) REFERENCES Propietari(id_driver),
       PRIMARY KEY (matricula)
       );

    --Creem la taula Charge

    DROP TABLE IF EXISTS Charge CASCADE;
    CREATE TABLE Charge (

       charge VARCHAR(255),
       description VARCHAR(255),
       PRIMARY KEY (charge)
       );

    --Creem la taula Infraccio

    DROP TABLE IF EXISTS Infraccio;
    CREATE TABLE Infraccio (

       id_Infraccio serial,
       charge VARCHAR(255),
       id_vehicle VARCHAR(255),
       subAgency VARCHAR(255),
       id_driver bigint,
       id_state int,
       violation_type VARCHAR(255),
       ContributedToAccident boolean,
       Belts boolean,
       PersonalInjury boolean,
       PropertyDamage boolean,
       Fatal boolean,
       HAZMAT boolean,
       Alcohol boolean,
       Work_Zone boolean,
       Date_OfStop date,
       Time_OfStop time,
       Location VARCHAR(255),
       Latitude VARCHAR(255),
       Longitude VARCHAR(255),
       FOREIGN KEY (id_vehicle) REFERENCES Vehicle(matricula),
       FOREIGN KEY (subAgency) REFERENCES District(sub_agency),
       FOREIGN KEY (id_driver) REFERENCES Conductor(id_driver),
       FOREIGN KEY (id_state) REFERENCES State(id_state),
       PRIMARY KEY (id_Infraccio)
       );



	--IMPORTACIO DE DADES A TAULES

    --Inserim la informació a la taula Comisaria
    	INSERT INTO Comisaria (agency) SELECT DISTINCT agency FROM TaulaITraffic WHERE agency IS NOT NULL;
   		SELECT * FROM Comisaria;

    --Inserim la informació a la taula District
     	INSERT INTO District (sub_agency, agency)
        SELECT DISTINCT ON  (sub_agency) TaulaITraffic.sub_agency, Comisaria.agency FROM TaulaITraffic, Comisaria
        WHERE TaulaITraffic.agency = Comisaria.agency AND TaulaITraffic IS NOT NULL;
        SELECT * FROM District;

    --Inserim la informació a la taula State
        INSERT INTO State (state_name) SELECT DISTINCT TaulaITraffic.State FROM TaulaITraffic --CAL FER SUBQUERY??
        WHERE TaulaITraffic.state IS NOT NULL;
        INSERT INTO State (state_name) SELECT DISTINCT driver_state FROM TaulaITraffic
        WHERE NOT EXISTS (SELECT  TaulaITraffic FROM State WHERE state.state_name = TaulaITraffic.driver_state) AND TaulaITraffic.driver_state IS NOT NULL;
        INSERT INTO State (state_name) SELECT DISTINCT dl_state FROM TaulaITraffic
        WHERE NOT EXISTS (SELECT  TaulaITraffic FROM State WHERE state.state_name = TaulaITraffic.dl_state) AND TaulaITraffic.driver_state IS NOT NULL;
        SELECT * FROM State;

    --Inserim la informació a la taula City
        INSERT INTO City(city_name, id_state)
        SELECT DISTINCT ON  (driver_city)  TaulaITraffic.driver_city, State.id_state FROM TaulaITraffic, State
        WHERE TaulaITraffic.driver_state = State.state_name AND  TaulaITraffic.driver_city IS NOT NULL;
        SELECT * FROM City;

    --Inserim la informació a la taula Conductor
        INSERT INTO Conductor (id_driver, race, gender, city)
        SELECT DISTINCT ON (id_person) t.id_person, t.race, t.gender,  c.id_city
        FROM City AS c, TaulaITraffic AS t
        WHERE t.driver_city = c.city_name;
        SELECT * FROM Conductor;

    --Inserim la informació a la taula TipusC
        INSERT INTO TipusC (tipus)
        SELECT DISTINCT ON (TaulaITraffic.driving_license) TaulaITraffic.driving_license
        FROM TaulaITraffic WHERE TaulaITraffic.driving_license IS NOT NULL;
        SELECT * FROM TipusC w;

    --Inserim la informació a la taula Carnet
        INSERT INTO Carnet (id_driver, id_state, tipus) SELECT DISTINCT ON (d.id_driver, t.driving_license)d.id_driver, s.id_state, t.driving_license
        FROM Conductor AS d, TaulaITraffic AS t, State AS s, tipusC AS ti
        WHERE d.id_driver = t.id_person AND s.state_name = t.dl_state AND ti.tipus = t.driving_license;
        SELECT * FROM Carnet;

    --Inserim la informació a la taula Propietari
        INSERT INTO Propietari (id_driver, nom)
        SELECT DISTINCT ON  (t.id_prop) t.id_prop, t.nom
        FROM TaulaIProp AS t, conductor As d
        WHERE t.id_prop = d.id_driver ;
        SELECT * FROM Propietari;

    --Inserim la informació a la taula Vehicle
        INSERT INTO Vehicle (matricula,id_prop, vehicle_type, year, make, model, color)
        SELECT DISTINCT ON (t.license) t.license,p.id_driver, t.vehicle_type, t.year, t.make, t.model, t.color
        FROM TaulaITraffic AS t, propietari AS p, TaulaIProp AS ip
        WHERE license IS NOT NULL AND p.id_driver = ip.id_prop AND ip.id_prop = t.id_person ;
        SELECT * FROM Vehicle;

    --Inserim la informació a la taula Charge
        INSERT INTO Charge (charge, description) SELECT DISTINCT ON (charge) charge, description
        FROM TaulaITraffic AS t WHERE t.charge IS NOT NULL ;
        SELECT * FROM charge;

    --Inserim la informació a la taula Infraccio
		INSERT INTO Infraccio( charge, id_vehicle, SubAgency, id_driver,id_state,violation_type, ContributedToAccident, Belts, PersonalInjury, PropertyDamage, Fatal, HAZMAT, Alcohol, Work_Zone, Date_OfStop, Time_OfStop, Location, Latitude, Longitude)
       	SELECT  c.charge, v.matricula, d.Sub_Agency, co.id_driver,s.id_state,t.violation_type, t.Contributed, t.Belts, t.Personal_Injury, t.Property_Damage, t.Fatal, t.HAZMAT, t.Alcohol, t.Work_Zone, t.Date_Of_Stop, t.Time_Of_Stop, t.Location, t.Latitude, t.Longitude
      	FROM State AS s, Charge AS c, Vehicle AS v, District AS d, TaulaITraffic AS t, Conductor AS co
      	WHERE  c.charge = t.charge AND v.matricula = t.license AND d.sub_agency = t.sub_agency AND co.id_driver = t.id_person AND s.state_name = t.state;
      	SELECT * from Infraccio;



        SELECT	count(id_infraccio) FROM Infraccio;






    --FASE 2: QUERYS


    --QUERY 1

        SELECT COUNT(c.charge) AS "nsancions", v.color FROM Vehicle AS v, Infraccio AS i, Charge AS c
        WHERE v.matricula = i.id_vehicle AND c.charge= i.charge
        GROUP BY v.matricula ORDER BY count(c.charge) DESC LIMIT 1;


    --QUERY 2

        SELECT  p.nom, c.race FROM Propietari AS p, Conductor AS c, Vehicle AS v
        WHERE p.id_driver = c.id_driver AND v.id_prop = p.id_driver
        AND (v.matricula  LIKE '%1%' OR v.matricula LIKE '%2%' OR v.matricula LIKE'%3%' OR v.matricula LIKE'%4%' OR v.matricula LIKE'%5%')
        ORDER BY v.make DESC, v.model, v.year;


    --QUERY 3

       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2007  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  DESC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2008  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  ASC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2009  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  DESC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2010  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  ASC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2011  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  DESC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2012  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  ASC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2013  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  DESC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2014  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  ASC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2015  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  DESC LIMIT 6
       )AS sub
       UNION ALL
       SELECT matricula, year FROM(
           SELECT v.matricula AS matricula, v.year AS year FROM Infraccio AS i, Vehicle AS v
           WHERE v.year = 2016  AND v.matricula = i.id_vehicle AND ContributedToAccident = false AND i.Belts = true
           ORDER BY   v.matricula  ASC LIMIT 6
       )AS sub


    --QUERY 4

        SELECT DISTINCT Charge.description FROM Infraccio, Vehicle, Propietari, Conductor,Charge
        WHERE (Charge.description LIKE '%a%' OR Charge.description LIKE '%A%') AND (Charge.description LIKE '%e%' OR Charge.description LIKE '%E%')
        AND (Charge.description LIKE '%i%' OR Charge.description LIKE '%I%') AND (Charge.description LIKE '%o%' OR Charge.description LIKE '%O%')
        AND (Charge.description LIKE '%u%' OR Charge.description LIKE '%U%')
        AND Infraccio.id_vehicle = Vehicle.matricula AND charge.charge = Infraccio.charge AND Propietari.id_driver = Vehicle.id_prop
        AND Propietari.id_driver = Conductor.id_driver AND Propietari.id_driver=Infraccio.id_driver AND (Conductor.gender ='F' AND Conductor.race ='BLACK' OR Vehicle.color='GOLD' );


    --QUERY 5

        SELECT EXTRACT (year FROM i.Date_OfStop) AS any, COUNT(*) AS nincidents  FROM Infraccio AS i
        WHERE i.Alcohol=TRUE AND EXTRACT(month FROM i.Date_OfStop)=7 AND EXTRACT (day FROM i.Date_OfStop) BETWEEN 4 AND 5
        GROUP BY EXTRACT (year FROM i.Date_OfStop) ORDER BY nincidents DESC LIMIT 1;


    --QUERY 6

        SELECT c.gender AS gènere, COUNT(i.id_infraccio) AS "nincidents" FROM Infraccio AS i, Conductor AS c
        WHERE c.id_driver = i.id_driver
        GROUP BY c.gender ORDER BY COUNT(i.id_infraccio) DESC LIMIT 1 ;


    --QUERY 7

		SELECT c.gender AS gènere, CAST((COUNT(i.id_infraccio)*100)AS FLOAT) / CAST((SELECT COUNT(i.id_infraccio) FROM Infraccio AS i)AS FLOAT)
        AS "incidents_percentatge" FROM Infraccio AS i, Conductor AS c
        WHERE c.id_driver = i.id_driver
        GROUP BY c.gender


    --QUERY 8

        SELECT i.id_driver AS Identificador, p.nom AS Nom, 24-COUNT(i.alcohol=true)-(COUNT(i.belts=true)) AS "Punts Restants"
        FROM Conductor AS c, Propietari AS p, Infraccio AS i
        WHERE c.id_driver = p.id_driver AND  i.id_driver = c.id_driver AND (i.alcohol= true OR i.belts=true)
        GROUP BY i.id_driver,p.nom
        ORDER BY "Punts Restants" ASC;


    --QUERY 9

        SELECT p.id_driver AS Identificador, p.nom, COUNT(*) AS "Num cotxes" FROM Propietari AS p, Vehicle AS v
        WHERE v.id_prop = p.id_driver
        GROUP BY p.id_driver
        ORDER BY "Num cotxes" DESC LIMIT 1;


    --QUERY 10

        SELECT p.id_driver AS Identificador, p.nom, v.matricula, v.make AS Marca, v.model, v.year FROM Propietari AS p, Vehicle AS v
		WHERE v.id_prop = p.id_driver AND v.color='BLACK'
        ORDER BY v.year ASC LIMIT 4;
