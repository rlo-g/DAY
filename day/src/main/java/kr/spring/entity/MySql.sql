CREATE TABLE DAYUSER(
USERNAME VARCHAR(100),
PASSWORD VARCHAR(100),
NICKNAME VARCHAR(100),
EMAIL VARCHAR(100),
AUTH VARCHAR(100),
PRIMARY KEY(USERNAME));

CREATE TABLE DAYGUEST (
    IDX INT PRIMARY KEY AUTO_INCREMENT,
    HOST VARCHAR(100) NOT NULL,
    HOSTID VARCHAR(100) NOT NULL,
    VISITOR VARCHAR(100) NOT NULL,
   	INDATE DATETIME DEFAULT NOW(),
    CONTENT VARCHAR(2000));

CREATE TABLE FOLLOW(
    IDX INT PRIMARY KEY,
    FOLLOW_ID VARCHAR(100) NOT NULL,
    FOLLOWING_ID VARCHAR(100) NOT NULL
);
CREATE TABLE DAYLIKE (
    LIKE_IDX INT PRIMARY KEY,
    BOARD_IDX INT NOT NULL,
    USERNAME VARCHAR(100) NOT NULL
);

CREATE TABLE DAYBLOG (
    USERNAME VARCHAR(100) PRIMARY KEY,
    USERNICK VARCHAR(100) NOT NULL,
    BLOG_PROFILE VARCHAR(3000),
    BLOG_INTRO VARCHAR(2000) NOT NULL,
    BLOG_HEADER VARCHAR(3000),
    BLOG_BODY VARCHAR(3000),
    BLOG_SIDE VARCHAR(3000),
   BLOG_TITLE VARCHAR(500) NOT NULL
);

CREATE TABLE DAYSTICKER (
    IDX INT PRIMARY KEY,
    NICKNAME VARCHAR(100) NOT NULL,
    PHOTO VARCHAR(5000) NOT NULL
);
CREATE TABLE DAYBOARD (
    IDX INT PRIMARY KEY,
    DATE DATE NOT NULL,
    LIKE INT NOT NULL,
    CONTENT VARCHAR(5000) NOT NULL,
    NICKNAME VARCHAR(100) NOT NULL,
    CATEGORY VARCHAR(300) NOT NULL,
    DIARYNAME VARCHAR(300) NOT NULL
);

CREATE TABLE AUTH (
    ADMIN VARCHAR(100) NOT NULL,
    VIP VARCHAR(100) NOT NULL,
    USER VARCHAR(100) NOT NULL
);
drop table dayguest;

ALTER TABLE day_follow MODIFY followed_at DATETIME DEFAULT NOW();
ALTER TABLE day_board MODIFY diary_idx int UNSIGNED NOT NULL;

insert into dayguest(host, hostid, visitor, content) values('LL','lee','가나다', '다이어리가 너무 예뻐요! 잘 봤습니다.');
insert into dayguest(host,hostid, visitor, content) values('LL','lee', '명탐정 코난','글 잘보고 갑니다~');
insert into dayguest(host,hostid, visitor, content) values('LL','lee', '둘리','팔로잉해용👻');
insert into dayguest(host,hostid, visitor, content) values('LL','lee', '곰댕','기여운댕 뭔댕');
insert into dayguest(host, hostid,visitor, content) values('LL', 'lee','쵸파','쵸쵸쵸파파파 쵸파에요');
update day_board set diary_idx = '8' WHERE user_id ='admin' AND bd_idx=250038; 
select * from day_blog;
ALTER TABLE day_diary ADD maked_at VARCHAR(1000) NOT NULL COMMENT '다이어리 표지';

ALTER TABLE day_board ADD diary_idx int UNSIGNED NOT NULL COMMENT '해당 게시글이 담긴 다이어리 인덱스';

select * from day_board;
delete from day_user;
select * from day_guestbook;
delete from day_follow where follow_idx=23;
SELECT * FROM day_blog;
SELECT * FROM day_user;
SELECT * FROM day_follow;
ALTER TABLE day_board DROP COLUMN diary_idx;
delete from day_guest where user_id='lee' ;
delete from day_blog where user_id='lee' ;
delete from day_user where user_id='lee' ;

SELECT * FROM day_diary;
select * from day_board WHERE diary_idx=8;
SELECT * FROM day_user;

insert into dayblog(USERNAME,USERNICK, BLOG_INTRO, BLOG_TITLE) values('lee','LL','안냐세요', 'MY DIARY🌼');
insert into DAYUSER values('admin', '1234','관리자','admin@naver.com','ADMIN');
UPDATE day_user set user_pw=MD5('lee123') where user_id='lee'; 

UPDATE day_diary set diary_name = '2023.11.25' where diary_idx=8; 

INSERT INTO day_board (bd_title, bd_content, bd_views, user_id, bd_category, bd_diary, diary_idx)
VALUES (
    '요건 되냐',
    'image3.png',
    '0',
    'mon',
    'life',
    '2023.11.17',
    (SELECT diary_idx FROM day_diary WHERE diary_name = '2023.11.17'AND diary_num=2) -- 여기에 사용하고자 하는 bd_title 값을 입력하세요.
);

INSERT INTO day_board (bd_title, bd_content, bd_views, user_id, bd_category, bd_diary, diary_idx)
VALUES (
    #{bd_title},
    #{bd_content},
    #{ bd_views},
    #{user_id},
    #{bd_category},
    #{bd_diary},
    (SELECT diary_idx FROM day_diary WHERE diary_name = #{bd_diary})
  );

  SELECT A.*, B.user_nick FROM day_board A JOIN day_user B ON A.user_id = B.user_id WHERE A.bd_idx=250030;
    
  SELECT diary_idx FROM day_diary WHERE diary_name = '2023.11.17' AND diary_num = 2;
INSERT INTO day_follow(follower, followee) 
		VALUES('a', 'lee')
SELECT A.user_id as guestId, B.gb_idx as gb_idx, B.host as host,
		 B.user_id as hostId, B.user_nick as user_nick, B.gb_content as gb_content, B.created_at
		FROM day_user A
		JOIN day_guestbook B ON A.user_nick = B.user_nick
		WHERE B.user_id = 'lee'
		ORDER BY B.created_at DESC
		
		
   SELECT db.*, du.user_nick
FROM day_follow AS df
JOIN day_board AS db ON df.followee = db.user_id
JOIN day_user AS du ON df.followee = du.user_id
WHERE df.follower = 'mon';

DELETE day_board, day_diary
		FROM day_board
		JOIN day_diary ON day_board.diary_idx = day_diary.diary_idx
		WHERE day_board.diary_idx = 8;
DELETE day_board, day_diary
		FROM day_diary
		JOIN day_board ON day_diary.diary_idx = day_board.diary_idx
		WHERE day_diary.diary_idx = 23;
SELECT * from day_diary;
SELECT * FROM day_board WHERE diary_idx=23;
delete from day_board WHERE diary_idx=0;
DELETE day_board, day_diary
		FROM day_diary
		JOIN day_board ON day_diary.diary_idx = day_board.diary_idx
		WHERE day_diary.diary_idx = 37;
