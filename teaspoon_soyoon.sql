CREATE DATABASE teaspoon;
USE teaspoon;

INSERT INTO MEMBER VALUES ('so', '1234', '소정환','admin@buddy.com', '01012341234', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT); 
INSERT INTO MEMBER VALUES ('kang', '1234', '강영현','kang@buddy.com', '01011112222', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT); 
INSERT INTO MEMBER VALUES ('park', '1234', '박정우','park@buddy.com', '01033334444', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT); 

UPDATE member SET pw='$2a$10$B1eSQwtXQMZIht3sHOWS7.a/wOmnXT9T3EqYwl7qBbOfAuj8YuKvW' WHERE id='so';
UPDATE member SET pw='$2a$10$B1eSQwtXQMZIht3sHOWS7.a/wOmnXT9T3EqYwl7qBbOfAuj8YuKvW' WHERE id='kang';
UPDATE member SET pw='$2a$10$B1eSQwtXQMZIht3sHOWS7.a/wOmnXT9T3EqYwl7qBbOfAuj8YuKvW' WHERE id='park';

COMMIT;

-- 자주 묻는 질문 테이블 생성
CREATE TABLE faq (
                     fno int PRIMARY KEY AUTO_INCREMENT,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);

COMMIT;

-- 자주 묻는 질문 더미 데이터 
INSERT INTO faq VALUES (DEFAULT, '화면이 정상적으로 나오지 않습니다. 어떻게 해야 하나요?', 'PC 및 브라우저 환경에 따라 화면이 정상적으로 나오지 않을 수 있습니다. 
티스푼 사이트는 인터넷 익스플로러 9 이상, 크롬 브라우저에 최적화되어있습니다. 
인터넷 익스플로러 8 이하 사용자는 브라우저를 업데이트 하거나 크롬 브라우저로 이용해주시길 바랍니다. ', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '회원 탈퇴 후 이전에 작성한 게시글 및 댓글을 삭제할 수 있나요? ', '작성한 게시글 및 댓글은 탈퇴 후에도 삭제되지 않고 유지됩니다. 
게시글 및 댓글 삭제를 원하시는 경우에는 반드시 삭제하신 후 탈퇴하시기 바랍니다. ', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '회원정보를 수정하고 싶습니다. ', '로그인 후 우측 상단에 있는 마이페이지를 클릭해주세요. ', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '원하는 정보 또는 콘텐츠는 어떻게 찾아볼 수 있나요?', '우측 상단 돋보기 아이콘을 클릭하시어 원하는 정보의 키워드를 입력하시면 메뉴별 검색 결과를 확인하실 수 있습니다. 
또는 메인 화면에서 맞춤추천정보를 클릭 후 키워드를 검색하여 콘텐츠를 검색할 수 있으며, 티스푼이 추천하는 키워드도 확인할 수 있습니다. ', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '교육게시판  전문가의 정보를 알고 싶어요. ', '휴대폰 번호, 이메일 주소등의 개인 연락처는 개인정보 보호를 위해 알려드릴 수 없으니 양해부탁드립니다. ', DEFAULT);

-- 공지사항 테이블 생성 
create table notice(
                       nno int primary KEY AUTO_INCREMENT,
                       title varchar(200) not NULL,
                       content varchar(1000),
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0
);

-- 커뮤니티 전용 공지사항 더미글 추가 10건

INSERT INTO notice VALUES(DEFAULT, "공지사항 1번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 2번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 3번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 4번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 5번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);

INSERT INTO notice VALUES(DEFAULT, "공지사항 6번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 7번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 8번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 9번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 10번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);

INSERT INTO notice VALUES(DEFAULT, "공지사항 11번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 12번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 13번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 14번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 15번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);

-- 묻고 답하기(질문, 답변) 테이블 생성
CREATE TABLE qna(
                    qno int PRIMARY KEY AUTO_INCREMENT,   			            -- 번호
                    title VARCHAR(100) NOT NULL,   					-- 제목
                    content VARCHAR(1000) NOT NULL,   				-- 내용
                    author VARCHAR(16),   							-- 작성자
                    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    -- 등록일
                    visit INT DEFAULT 0,   							-- 조회수
                    lev INT DEFAULT 0, 								-- 질문(0), 답변(1)
                    par INT DEFAULT 0,										-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
                    secret BOOLEAN DEFAULT false,				    -- 비밀글 유무
                    FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev, secret) VALUES('질문1', '질문입니다. 1', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문2', '질문입니다. 2', 'park', 0, true);

UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문3', '질문입니다. 3', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문4', '질문입니다. 4', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문5', '질문입니다. 5', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문6', '질문입니다. 6', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문7', '질문입니다. 7', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문8', '질문입니다. 8', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문9', '질문입니다. 9', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문10', '질문입니다. 10', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=10;

-- 답변

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'admin', 1, 1, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2, true);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10, false);

COMMIT;

-- QnA 리스트 뷰 생성 
create view qnalist1 AS  (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.visit AS visit, a.lev AS lev,
       a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);

-- qna JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
CREATE VIEW qnalist2 AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.visit AS visit, a.lev AS lev,
                                a.par AS par, b.id AS id FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);


-- Notice 댓글 테이블 생성
​
create table notice_comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,
   nno INT,
   author VARCHAR(16) NOT NULL,
   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   content VARCHAR(200),
   FOREIGN KEY(nno) REFERENCES notice(nno) ON DELETE CASCADE
);
​
-- 공지사항 댓글 더미 데이터 추가
INSERT INTO notice_comment(nno, author, content) VALUES(1, 'park', '댓글 기능 더미데이터1');
INSERT INTO notice_comment(nno, author, content) VALUES(2, 'park', '댓글 기능 더미데이터2');
INSERT INTO notice_comment(nno, author, content) VALUES(3, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(4, 'so', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(5, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(6, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(7, 'park', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(8, 'so', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(1, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(1, 'so', '댓글 기능 더미데이터3');
​
-- notice comment 리스트 뷰 생성 
create view noticelist AS (SELECT a.cno AS cno, a.nno as nno, a.content AS content, a.author AS author, a.resdate AS resdate,
       b.name AS name FROM notice_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);
      
-- qna 댓글 테이블 생성
​
create table qna_comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,
   qno INT,
   author VARCHAR(16) NOT NULL,
   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   content VARCHAR(200),
   FOREIGN KEY(qno) REFERENCES qna(qno) ON DELETE CASCADE
);
​
-- 더미 데이터 추가
INSERT INTO qna_comment(qno, author, content) VALUES(1, 'park', '댓글 기능 더미데이터1');
INSERT INTO qna_comment(qno, author, content) VALUES(3, 'park', '댓글 기능 더미데이터2');
INSERT INTO qna_comment(qno, author, content) VALUES(3, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(4, 'so', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(7, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(8, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(8, 'park', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(2, 'so', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(1, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(1, 'so', '댓글 기능 더미데이터3');
​
-- qna comment 리스트
create view qnacommentlist AS (SELECT a.cno AS cno, a.qno as qno, a.content AS content, a.author AS author, a.resdate AS resdate,
       b.name AS name FROM qna_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);


SELECT n.nno, COUNT(nc.cno) AS count
        FROM notice n
            LEFT JOIN notice_comment nc ON n.nno = nc.nno
        GROUP BY n.nno;
        
CREATE TABLE survey(
  sno int auto_increment primary key,
  title VARCHAR(200) NOT NULL,
  q1 varchar(200) NOT null,
  q2 varchar(200),
  q3 varchar(200),
  q4 varchar(200),
  q5 varchar(200),
  q6 varchar(200),
  q7 varchar(200),
  q8 varchar(200),
  q9 varchar(200),
  q10 varchar(200),
  regdate timestamp default current_timestamp,
  ans int default 0,
  lev int default 0,
  par INT DEFAULT 0,
  author VARCHAR(100),
  visited INT(11) DEFAULT 0,
  content VARCHAR(1500)
);
create table EVENT(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) not null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT DEFAULT 0,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT DEFAULT 0 -- 추천수
);
create table winner(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) not null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT DEFAULT 0,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT DEFAULT 0 -- 추천수
);