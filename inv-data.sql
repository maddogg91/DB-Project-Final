use inventory;

INSERT INTO `tables` VALUES(1000, 'Round table', 'A round table, plastic, holds up to 6 people'),
(1001, 'Rectangle table', 'A folding rectangular table, plastic, holds up to 6 people'),
(1002, 'Wood table', 'Two foot black wood table used for centerpieces'),
(1003, 'Table 5x30', 'Prep stainless steel'),
(1004, 'Table 32 inch sq', 'High/Low Event table'),
(1005, 'Table banquet 4 x 30', 'A wood table with folding legs'),
(1006, 'Card table', '32 x 32 mesh covered table, perfect for card players'),
(1007, 'Table conference', '8 x 18 conference table'),
(1008, 'Table picnic', 'A picnic table'),
(1009, 'Table serpentine', 'A half moon shaped table');

INSERT INTO `chairs` VALUES(2000, 'Black Plastic Folding', 'A black metal folding chair'),
(2001, 'Black Resin Chair', 'Folding chair with a pad'),
(2002, 'Chiavari Chair', 'A barstool chiavari chair'),
(2003, 'Child folding chair', 'A high end metal table holds up to 2 people'),
(2004, 'Chrome Barstool', 'A chrome barstool, holds up to 200 pounds'),
(2005, 'Directors Chair', 'An exclusive chair made for Directors'),
(2006, 'Cross back chair f', 'A fruitwood crossback chair'),
(2007, 'Cross back chair p', 'A pecan crossback chair'),
(2008, 'Child black stacking chair', 'A black plastic chair'),
(2009, 'Chrome Paris chair', 'A chrome high quality chair');

INSERT INTO `canopy` VALUES(3000, 'Blue Tent A', 'A small blue tent'),
(3001, 'Blue tent B', 'A medium blue tent'),
(3002, 'Blue tent C', 'A large blue tent'),
(3003, 'White Tent A', 'A small white tent'),
(3004, 'White Tent B', 'A medium white tent'),
(3005, 'White Tent C', 'A large white tent'),
(3006, 'Event tent', 'A luxury white tent'),
(3007, 'Camping Tent A', 'Tent for personal use'),
(3008, 'Camping Tent B', 'A multipurpose tent'),
(3009, 'Camping Tent C', 'A large tent used for conference purposes');

INSERT INTO `stock` VALUES(101, 25, 0, 25),
(102, 25, 0, 25),
(103, 25, 0, 25),
(104, 25, 0, 25),
(105, 25, 0, 25),
(106, 25, 0, 25),
(107, 25, 0, 25),
(108, 25, 0, 25),
(109, 25, 0, 25),
(110, 25, 0, 25),
(111, 25, 0, 25),
(112, 25, 0, 25),
(201, 10, 0, 10),
(202, 10, 0, 10),
(203, 10, 0, 10),
(204, 10, 0, 10),
(205, 10, 0, 10),
(206, 10, 0, 10),
(207, 10, 0, 10),
(208, 10, 0, 10),
(209, 10, 0, 10),
(210, 10, 0, 10),
(211, 10, 0, 10),
(212, 10, 0, 10),
(301, 3, 0, 3),
(302, 3, 0, 3),
(303, 3, 0, 3),
(304, 3, 0, 3),
(305, 3, 0, 3),
(306, 3, 0, 3),
(307, 3, 0, 3),
(308, 3, 0, 3),
(309, 3, 0, 3),
(310, 3, 0, 3),
(311, 3, 0, 3),
(312, 3, 0, 3);

INSERT INTO `locations` VALUES(1, 'Atlanta Branch', 'Atlanta', 'GA'),
(2, 'Stone Mtn Branch', 'Stone Mountain', 'GA'),
(3, 'West End Branch', 'Atlanta', 'GA'),
(4, 'East Atlanta Branch', 'Atlanta', 'GA'),
(5, 'Marietta Branch', 'Marietta', 'GA'),
(6, 'Valdosta Branch', 'Valdosta', 'GA'),
(7, 'Nashville Branch', 'Nashville', 'TN'),
(8, 'Memphis Branch', 'Memphis', 'TN'),
(9, 'Houston Branch', 'Houston', 'TX'),
(10, 'San Antonio Branch', 'San Antonio', 'TX');

INSERT INTO `inventory` VALUES(1, 'Instore', 1),
(2, 'Online', 1),
(3, 'Instore', 2),
(4, 'Online', 2),
(5, 'Instore', 3),
(6, 'Online', 3),
(7, 'Instore', 4),
(8, 'Online', 4),
(9, 'Instore', 5),
(10, 'Instore', 5);





INSERT INTO `roles` VALUES(1, '3'),
(2, '3'),
(3, '2'),
(4, '1'),
(5, '1'),
(6, '1'),
(7, '1'),
(8, '1'),
(9, '1'),
(10, '1'),
(11, '1');


INSERT INTO `registration` VALUES(9079011, 'password'),
(9012011, 'YuXnSxO'),
(9079016, 'YuXnSxO'),
(9079017, 'YuXnSxO'),
(9079018, 'YuXnSxO'),
(9079019, 'YuXnSxO'),
(9079020, 'YuXnSxO'),
(9079021, 'YuXnSxO'),
(9079022, 'YuXnSxO'),
(1079012, 'NCIji8jd'),
(1079013, 'JDIjcni0'),
(1079014, 'DJIjidj'),
(9079015, 'password'),
(1079016, 'djai993D'),
(1079017, 'dij939dD'),
(1079018, 'jfJIDJi9'),
(1079019, 'dcni9d93'),
(1079020, 'jfJIDJi9'),
(1079021, 'jfJIDJi9'),
(1079022, 'jfJIDJi9');


INSERT INTO `customers` VALUES(1, 'Mark', 'Jacobs', 1079012),
(2, 'Frank', 'Ocean', 1079013),
(3, 'Shang', 'Proud', 1079014),
(4, 'Erica', 'Campbell', 1079016),
(5, 'Michelle', 'Edwards', 1079017),
(6, 'Trevor', 'Stark', 1079018),
(7, 'Ryan', 'George', 1079019),
(8, 'Penny', 'Proud', 1079020),
(9, 'Tony', 'Snell', 1079021),
(10, 'John', 'Cena', 1079022);

INSERT INTO `staff` VALUES(1, 'Robert', 'Charity', 1 , 1,9079011),
(2, 'Caroline', 'Charity', 1, 2, 9012011),
(3, 'Moxie', 'Charity', 2, 3, 9079015),
(4, 'Michael', 'Edwards', 3, 4, 9079016),
(5, 'Michelle', 'Edwards', 3, 5, 9079017),
(6, 'Chance', 'Young', 2, 6, 9079018),
(7, 'Archie', 'Collins', 4, 7, 9079019),
(8, 'Ashley', 'Dennis', 4, 8, 9079020),
(9, 'Priyanka', 'Patel', 5, 9, 9079021),
(10, 'Mei', 'Ling', 6, 10, 9079022);

INSERT INTO `invtbl` VALUES(1000, 1111, 101, 1),
(1000, 1112, 102, 2),
(1001, 1113, 103, 1),
(1001, 1114, 104, 2),
(1002, 1115, 105, 1),
(1002, 1116, 106, 2),
(1003, 1117, 107, 1),
(1003, 1118, 108, 2),
(1004, 1119, 109, 1),
(1004, 1120, 110, 2),
(1005, 1121, 111, 1),
(1005, 1122, 112, 2);

INSERT INTO `invchairs` VALUES(2000, 2221, 201, 1),
(2000, 2222, 202, 2),
(2001, 2223, 203, 1),
(2001, 2224, 204, 2),
(2002, 2225, 205, 1),
(2002, 2226, 206, 2),
(2003, 2227, 207, 1),
(2003, 2228, 208, 2),
(2004, 2229, 209, 1),
(2004, 2230, 210, 2),
(2005, 2231, 211, 1),
(2005, 2232, 212, 2);

INSERT INTO `invcanopy` VALUES(3000, 3331, 301, 1),
(3000, 3332, 302, 2),
(3001, 3333, 303, 1),
(3001, 3224, 304, 2),
(3002, 3225, 305, 1),
(3002, 3226, 306, 2),
(3003, 3227, 307, 1),
(3003, 3228, 308, 2),
(3004, 3229, 309, 1),
(3004, 3330, 310, 2),
(3005, 3355, 311, 1),
(3005, 3356, 312, 2);


INSERT INTO `orders` VALUES(1,'10 Rectangle tables & a tent', 1, 1),
(2, '5 chairs', 1, 1),
(3, '3 chairs', 1, 2),
(4, '1 chair', 1, 3),
(5, '8 chairs & 1 table', 2, 4),
(6, '3 chairs', 2, 5),
(7, '7 chairs', 3, 6),
(8, '9 chairs', 3, 7),
(9, '11 chairs', 3, 8),
(10, '13 chairs', 4, 8);
