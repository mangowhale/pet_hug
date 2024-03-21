create table Reserve
(
   num serial primary key,
    title VARCHAR(20) NOT NULL,
    mem_id VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    tel VARCHAR(20) NOT NULL,    
    date VARCHAR(20) NOT NULL,
    contentSeq INT NOT NULL
);

select * from Reserve; 