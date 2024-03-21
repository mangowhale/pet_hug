create table course(
courseNum int auto_increment primary key,
courseName varchar(10),
mem_id varchar(15),
course1 varchar(60),
course2 varchar(60),
course3 varchar(60),
createDate date
)default charset=utf8;
alter table course add constraint foreign key(mem_id) references user_mem(mem_id);


DELIMITER //
CREATE TRIGGER set_createDate
BEFORE INSERT ON course
FOR EACH ROW
BEGIN
    SET NEW.createDate = CURRENT_DATE();
END;
//

CREATE TRIGGER update_createDate
BEFORE UPDATE ON course
FOR EACH ROW
BEGIN
    SET NEW.createDate = CURRENT_DATE();
END;
//
DELIMITER ;
select * from course;