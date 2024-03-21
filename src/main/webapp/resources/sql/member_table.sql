create database pethug;
use pethug;

create table user_mem(
	mem_id varchar(15) not null,
    mem_pw varchar(15) not null,
    mem_name varchar(17) not null,
    mem_nickname varchar(10),
    mem_phone varchar(11),
    mem_email varchar(40),
    join_date date
)DEFAULT CHARSET=utf8;
alter table user_mem add constraint primary key(mem_id);

DELIMITER //
CREATE TRIGGER fill_join_date
BEFORE INSERT ON user_mem
FOR EACH ROW
BEGIN
    IF NEW.join_date IS NULL THEN
        SET NEW.join_date = COALESCE(NEW.join_date, NOW());
    END IF;
END//

DELIMITER ;

use pethug;
SELECT COUNT(*) FROM user_mem WHERE mem_id = 'id';
SELECT COUNT(*) FROM user_mem WHERE mem_id = 'id';

select * from user_mem;