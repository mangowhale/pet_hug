use pethug;
CREATE TABLE content 
(
    contentSeq INT auto_increment PRIMARY KEY,
    areaName VARCHAR(10),
    partName VARCHAR(10),
    title VARCHAR(30),
    keyword VARCHAR(100),
    address VARCHAR(100),
    latitude VARCHAR(100),
    longitude VARCHAR(100),
    tel VARCHAR(20),
    usedTime VARCHAR(200),
    homePage VARCHAR(255),
    content TEXT,
    provisionSupply TEXT,
    petFacility TEXT,
    restaurant TEXT,
    parkingLog TEXT,
    mainFacility TEXT,
    usedCost TEXT,
    policyCautions TEXT,
    emergencyResponse TEXT,
    memo TEXT,
    bathFlag CHAR(1),
    provisionFlag CHAR(1),
    petFlag CHAR(1),
    petWeight VARCHAR(10),
    dogBreed CHAR(1),
    emergencyFlag CHAR(1),
    entranceFlag CHAR(1),
    parkingFlag CHAR(1),
    inOutFlag VARCHAR(10),
    p1 VARCHAR(255),
    p2 VARCHAR(255),
    p3 VARCHAR(255),
    p4 VARCHAR(255),
    p5 VARCHAR(255),
    p6 VARCHAR(255),
    p7 VARCHAR(255),
    p8 VARCHAR(255),
    p9 VARCHAR(255),
    p10 VARCHAR(255),
    review_num int,
    star_avg int
);



select * from content;