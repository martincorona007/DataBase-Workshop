/*
create table estudiante(
id_edu int primary key auto_increment not null,
 name varchar(20) not null,
 lastname varchar(20) not null,
 contry varchar(20) not null,
 email varchar(42) not null,
 phone varchar(15) not null
);*/

Use ejemplo;
DROP function if exists generate_fname;
DELIMITER $$
CREATE FUNCTION generate_fname () RETURNS varchar(255)
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "James","Mary","John","Patricia","Robert","Linda","Michael","Barbara","William","Elizabeth","David","Jennifer","Richard","Maria","Charles","Susan","Joseph","Margaret","Thomas","Dorothy","Christopher","Lisa","Daniel","Nancy","Paul","Karen","Mark","Betty","Donald","Helen","George","Sandra","Kenneth","Donna","Steven","Carol","Edward","Ruth","Brian","Sharon","Ronald","Michelle","Anthony","Laura","Kevin","Sarah","Jason","Kimberly","Matthew","Deborah","Gary","Jessica","Timothy","Shirley","Jose","Cynthia","Larry","Angela","Jeffrey","Melissa","Frank","Brenda","Scott","Amy","Eric","Anna","Stephen","Rebecca","Andrew","Virginia","Raymond","Kathleen","Gregory","Pamela","Joshua","Martha","Jerry","Debra","Dennis","Amanda","Walter","Stephanie","Patrick","Carolyn","Peter","Christine","Harold","Marie","Douglas","Janet","Henry","Catherine","Carl","Frances","Arthur","Ann","Ryan","Joyce","Roger","Diane");
END$$

DELIMITER ;

DROP function if exists generate_lname;
DELIMITER $$
CREATE FUNCTION generate_lname () RETURNS varchar(255)
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
END$$
DELIMITER ;

DROP function if exists contrys;
DELIMITER $
CREATE FUNCTION contrys () RETURNS varchar(255)
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (18-1))),  "Mexico","Germany","Brazil","Argentina","Afghanistan","France","Russia","Chile","Colombia","Egypt","Greece","South Korea","Switzerland","United States","United Arab Emirates","Taildan","Spain","Yemen","Iraq","Australia");
END$
DELIMITER ;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES';

DELIMITER //
DROP FUNCTION IF EXISTS str_random;
//

CREATE FUNCTION str_random(p_pattern VARCHAR(200))
    RETURNS VARCHAR(2000)
    NO SQL
    BEGIN
    /**
    * String function. Returns a random string based on a mask
    * <br>
    * %author Ronald Speelman
    * %version 2.3
    * Example usage:
    * SELECT str_random('dddd CC') AS DutchZipCode;
    * SELECT str_random('d{4} C{2}') AS DutchZipCode;
    * SELECT str_random('*{5}*(4)') AS password;
    * select str_random('Cccc(4)') as name;
    * SELECT str_random('#X{6}') AS htmlColorCode;
    * See more complex examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_pattern String: the pattern describing the random values
    *                          MASKS:
    *                          c returns lower-case character [a-z]
    *                          C returns upper-case character [A-Z]
    *                          A returns either upper or lower-case character [a-z A-Z]
    *                          d returns a digit [0-9]
    *                          D returns a digit without a zero [1-9]
    *                          b returns a bit [0-1]
    *                          X returns hexadecimal character [0-F]
    *                          * returns characters, decimals and special characters [a-z A-Z 0-9 !?-_@$#]
    *                          DIRECTIVES
    *                          "text"      : text is taken literally
    *                          {nn}        : repeat the last mask nn times
    *                          (nn)        : repeat random, but max nn times
    *                          [item|item] : pick a random item from this list, items are separated by a pipe symbol
    *                          All other characters are taken literally
    * %return String
    */

    DECLARE v_iter              SMALLINT DEFAULT 1;
    DECLARE v_char              VARCHAR(1) DEFAULT '';
    DECLARE v_next_char         VARCHAR(1) DEFAULT '';
    DECLARE v_list              VARCHAR(200) DEFAULT '';
    DECLARE v_text              VARCHAR(200) DEFAULT '';
    DECLARE v_result            VARCHAR(2000) DEFAULT '';
    DECLARE v_count             SMALLINT DEFAULT 0;
    DECLARE v_jump_characters   TINYINT DEFAULT 0;
    DECLARE v_end_position      SMALLINT DEFAULT 0;
    DECLARE v_list_count        TINYINT DEFAULT 0;
    DECLARE v_random_item       TINYINT DEFAULT 0;

    WHILE v_iter <= CHAR_LENGTH(p_pattern) DO

        SET v_char := BINARY SUBSTRING(p_pattern,v_iter,1);
        SET v_next_char := BINARY SUBSTRING(p_pattern,(v_iter + 1),1);

        -- check if text is a fixed text
        IF (v_char = '"') THEN
            -- get the text
            SET v_end_position := LOCATE('"', p_pattern, v_iter + 1);
            SET v_text := SUBSTRING(p_pattern,v_iter + 1,(v_end_position - v_iter) - 1);
            -- add the text to the result
            SET v_result := CONCAT(v_result, v_text);
            SET v_iter := v_iter + CHAR_LENGTH(v_text) + 2;
        -- if character has a count specified: repeat it
        ELSEIF (v_next_char = '{') OR (v_next_char = '(') THEN
            -- find out what the count is (max 999)...
            IF (SUBSTRING(p_pattern,(v_iter + 3),1) = '}') OR
               (SUBSTRING(p_pattern,(v_iter + 3),1) = ')') THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),1);
                SET v_jump_characters := 4;
            ELSEIF (SUBSTRING(p_pattern,(v_iter + 4),1) = '}') OR
                   (SUBSTRING(p_pattern,(v_iter + 4),1) = ')')THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),2);
                SET v_jump_characters := 5;
            ELSEIF (SUBSTRING(p_pattern,(v_iter + 5),1) = '}') OR
                   (SUBSTRING(p_pattern,(v_iter + 5),1) = ')')THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),3);
                SET v_jump_characters := 6;
            ELSE
                SET v_count := 0;
                SET v_jump_characters := 3;
            END IF;
            -- if random count: make it random with a max of count
            IF (v_next_char = '(') THEN
                SET v_count := FLOOR((RAND() * v_count));
            END IF;
            -- repeat the characters
            WHILE v_count > 0 DO
                SET v_result := CONCAT(v_result,str_random_character(v_char));
                SET v_count := v_count - 1;
            END WHILE;
            SET v_iter := v_iter + v_jump_characters;
        -- check if there is a list in the pattern
        ELSEIF (v_char = '[') THEN
            -- get the list
            SET v_end_position := LOCATE(']', p_pattern, v_iter + 1);
            SET v_list := SUBSTRING(p_pattern,v_iter + 1,(v_end_position - v_iter) - 1);
            -- find out how many items are in the list, items are seperated by a pipe
            SET v_list_count := (LENGTH(v_list) - LENGTH(REPLACE(v_list, '|', '')) + 1);
            -- pick a random item from the list
            SET v_random_item := FLOOR(1 + (RAND() * v_list_count));
            -- add the item from the list
            SET v_result := CONCAT(v_result,
                                   REPLACE(SUBSTRING(SUBSTRING_INDEX(v_list, '|' ,v_random_item),
                                           CHAR_LENGTH(SUBSTRING_INDEX(v_list,'|', v_random_item -1)) + 1),
                                           '|', '')
                                  );
            SET v_iter := v_iter + CHAR_LENGTH(v_list) + 2;
        -- no directives: just get a random character
        ELSE
            SET v_result := CONCAT(v_result, str_random_character(v_char));
            SET v_iter := v_iter + 1;
        END IF;

   END WHILE;

   RETURN v_result;
END;
//
DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES';

DELIMITER //
DROP FUNCTION IF EXISTS str_random_character;
//

CREATE FUNCTION str_random_character(p_char VARCHAR(1))
    RETURNS VARCHAR(1)
    NO SQL
    BEGIN
    /**
    * String function. Returns random character based on a mask
    * <br>
    * %author Ronald Speelman
    * %version 1.5
    * Example usage:
    * SELECT str_random_character('d') AS digit;
    * SELECT str_random_character('C') AS UPPER;
    * See more examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_pattern String: the pattern describing the random values
    *                          c returns lower-case character [a-z]
    *                          C returns upper-case character [A-Z]
    *                          A returns either upper or lower-case character [a-z A-Z]
    *                          d returns a digit [0-9]
    *                          D returns a digit without a zero [1-9]
    *                          b returns a bit [0-1]
    *                          X returns hexedecimal character [0-F]
    *                          * returns characters, decimals and special characters [a-z A-Z 0-9 !?-_@$#]
    *                          All other characters are taken literally
    * %return VARCHAR(1)
    */

    DECLARE v_result   VARCHAR(1) DEFAULT '';

        CASE p_char
            WHEN BINARY '*' THEN SET v_result := ELT(1 + FLOOR(RAND() * 69),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                                                 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                                                                                 '!','?','-','_','@','$','#',
                                                                                 0,1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'A' THEN SET v_result := ELT(1 + FLOOR(RAND() * 52),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                                                 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            WHEN BINARY 'c' THEN SET v_result := ELT(1 + FLOOR(RAND() * 26),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
            WHEN BINARY 'C' THEN SET v_result := ELT(1 + FLOOR(RAND() * 26),'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            WHEN BINARY 'd' THEN SET v_result := ELT(1 + FLOOR(RAND() * 10), 0,1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'D' THEN SET v_result := ELT(1 + FLOOR(RAND() * 9), 1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'X' THEN SET v_result := ELT(1 + FLOOR(RAND() * 16), 0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F');
            WHEN BINARY 'b' THEN SET v_result := ELT(1 + FLOOR(RAND() * 2), 0,1);
            ELSE
                SET v_result := p_char;
        END CASE;

   RETURN v_result;
END;
//
DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;














INSERT into estudiante(name, lastname, contry, email, phone) values (generate_fname(),generate_fname(),contrys(),str_random('c{3}c(4)[.|_|.]c{4}c(8)@[google.com|yahoo.com|live.com|mail.com|itszapopan.edu.mx|zapopan.tecmm.edu.mx]"'),str_random('[+64|+1|+55|+81|+44|+68] d{8}'));
/*select * from estudiante;*/
