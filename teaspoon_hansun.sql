CREATE DATABASE teaspoon;

USE teaspoon;

-- 자유게시판
CREATE TABLE free(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) NOT null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT -- 추천수
);

CREATE TABLE free_comment(
cno INT PRIMARY KEY AUTO_INCREMENT,
bno INT,
author VARCHAR(16) NOT NULL,
resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
content VARCHAR(200),
FOREIGN KEY(bno) REFERENCES free(bno) ON DELETE CASCADE
);

CREATE VIEW freecommentlist AS (SELECT a.cno AS cno, a.bno as bno, a.content AS content, a.author AS author, a.resdate AS resdate,
                                       b.name AS name FROM free_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);

CREATE TABLE reco (
rno INT AUTO_INCREMENT PRIMARY KEY,
bno INT REFERENCES free(bno) ON DELETE CASCADE,
id VARCHAR(20),
flag INT DEFAULT 0
);

-- 교재게시판
CREATE TABLE booktalk(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) NOT null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT -- 추천수
);

CREATE TABLE booktalk_comment(
cno INT PRIMARY KEY AUTO_INCREMENT,
bno INT,
author VARCHAR(16) NOT NULL,
resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
content VARCHAR(200),
FOREIGN KEY(bno) REFERENCES booktalk(bno) ON DELETE CASCADE
);

CREATE VIEW booktalkcommentlist AS (SELECT a.cno AS cno, a.bno as bno, a.content AS content, a.author AS author, a.resdate AS resdate,
                                           b.name AS name FROM booktalk_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);

CREATE TABLE bookreco (
rno INT AUTO_INCREMENT PRIMARY KEY,
bno INT REFERENCES booktalk(bno) ON DELETE CASCADE,
id VARCHAR(20),
flag INT DEFAULT 0
);

