create table review(
num serial primary key,
contentSeq int,
star int,
text text,
mem_id varchar(15),
mem_nickname varchar(10),
rev_date timestamp default current_timestamp,
rev_star int
)default charset=utf8;
alter table review add constraint foreign key(contentSeq) references content(contentSeq);

DELIMITER $$
CREATE TRIGGER update_review_insert
AFTER INSERT ON review
FOR EACH ROW
BEGIN
    DECLARE review_num INT;
    DECLARE star_avg INT;
    
    -- 별점 갱신
    SELECT COUNT(*), ROUND(AVG(rev_star)) INTO review_num, star_avg 
    FROM review WHERE contentSeq = NEW.contentSeq;
    
    UPDATE content
    SET review_num = review_num,
        star_avg = star_avg
    WHERE contentSeq = NEW.contentSeq;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER update_review_update
AFTER UPDATE ON review
FOR EACH ROW
BEGIN
    DECLARE review_num INT;
    DECLARE star_avg INT;
    
    -- 별점 갱신
    SELECT COUNT(*), ROUND(AVG(rev_star)) INTO review_num, star_avg 
    FROM review WHERE contentSeq = NEW.contentSeq;
    
    UPDATE content
    SET review_num = review_num,
        star_avg = star_avg
    WHERE contentSeq = NEW.contentSeq;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER update_review_stats_delete
AFTER DELETE ON review
FOR EACH ROW
BEGIN
    DECLARE review_num INT;
    DECLARE star_avg INT;
    
    -- 별점 갱신
    SELECT COUNT(*), ROUND(AVG(rev_star)) INTO review_num, star_avg 
    FROM review WHERE contentSeq = OLD.contentSeq;
    
    UPDATE content
    SET review_num = review_num,
        star_avg = star_avg
    WHERE contentSeq = OLD.contentSeq;
END$$

DELIMITER ;
