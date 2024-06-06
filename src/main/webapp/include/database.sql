show tables;

/* 사용자 계정 및 프로필 정보를 저장 */
create table member (
	idx int not null auto_increment primary key,  /* 회원 고유번호 */
	mid varchar(30) unique not null,             /* 사용자 아이디 (중복 확인 필요) */
	pwd varchar(100) not null,                   /* 비밀번호 (SHA256 암호화 처리) */
	nickName varchar(20) not null,               /* 회원 별명 (중복 불가능/수정 가능) */
	name varchar(20) not null,                   /* 이름 */
	email varchar(60) not null,                  /* 이메일 */
	gender char(2) not null default '남자',       /* 성별 */
	birthday datetime default now(),            /* 생일 */
	photo varchar(100) default 'noimage.jpg',    /* 프로필 사진 */
	country varchar(50) not null,                /* 거주하는 나라 */
	city varchar(50),                            /* 도시 */
	nativeLanguage varchar(50) not null,         /* 모국어 */
	learningLanguage varchar(50) not null,       /* 학습할 언어 */
	languageLevel char(2) not null default '초급', /* 학습할 언어의 수준 ('초급', '중급', '고급') */
	content text,                                /* 자기소개 */
	userDel char(2) default 'no',                /* 회원 탈퇴신청여부(no:현재 활동중, ok: 탈퇴신청중/숨김처리된 회원) */
	level int default 1,                         /* 회원등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원, (4:운영자)) , 99:탈퇴신청회원 */
	startDate datetime default now(),            /* 최초 가입일 */
	lastDate datetime default now()              /* 마지막 접속일 */
);



desc member;

insert into member values (default,'atom','07de18b42f5f7548aaa36fd6b07e3910aecf7a6feb0bb18cc1b00701f455c9b32d71a6c4',
'아톰맨1','아톰1','atom@naver.com',default,'1987-06-04','noimage.png','미국', '','영어','러시아어','중급','안녕하세요! 열심히 하겠습니다!!.','NO','1',default,default);

insert into member values (default,'atom12','07de18b42f5f7548aaa36fd6b07e3910aecf7a6feb0bb18cc1b00701f455c9b32d71a6c4',
'아톰맨12','아톰12','atom12@naver.com',default,'1987-06-04','noimage.png','독일', '','독일어','프랑스어','중급','시험공부중인데 실제 회화를 공부하러 왔어요. 잘 부탁드려요.','NO','1',default,default);

insert into member values (default,'atom123','07de18b42f5f7548aaa36fd6b07e3910aecf7a6feb0bb18cc1b00701f455c9b32d71a6c4',
'아톰맨123','아톰123','atom123@naver.com',default,'1987-06-04','noimage.png','러시아', '','러시아어','영어','초급','안녕하세요! 같이 영어공부해여 :)','NO','1',default,default);

insert into member values (default,'atom1234','07de18b42f5f7548aaa36fd6b07e3910aecf7a6feb0bb18cc1b00701f455c9b32d71a6c4',
'아톰맨1234','아톰1234','atom1234@naver.com',default,'1987-06-04','noimage.png','중국', '','한국어','중국어','중급','안녕하세요! 아톰입나덩!.','NO','1',default,default);

insert into member values (default,'atom2','07de18b42f5f7548aaa36fd6b07e3910aecf7a6feb0bb18cc1b00701f455c9b32d71a6c4',
'아톰맨2','아톰2','atom2@naver.com',default,'1987-06-04','noimage.png','미국', '','영어','중국어','중급','안녕하세요! 잘 하겠습니다!!.','NO','1',default,default);

insert into member values (default,'atom3','07de18b42f5f7548aaa36fd6b07e3910aecf7a6feb0bb18cc1b00701f455c9b32d71a6c4',
'아톰맨3','아톰3','ato3m@naver.com',default,'1987-06-04','noimage.png','일본', '','영어','일본어','중급','열심히 하겠습니다!!.','NO','1',default,default);




select * from member;
select * from member where learningLanguage = '한국어' order by idx;
select * from member where learningLanguage != '한국어' order by idx;
select * from member where learningLanguage='한국어' order by idx desc union select * from member where learningLanguage != '한국어' order by idx; 
select * from member where learningLanguage='한국어' union select * from member where learningLanguage != '한국어' order by idx;
select * from member where learningLanguage='한국어' union select * from member where learningLanguage != '한국어';
select * from (select count(*) from member where learningLanguage='한국어') as cnt1 + (select count(*) from member where learningLanguage != '한국어') as cnt2;
create view learningLanguageGroup as select * from member where learningLanguage='한국어' union select * from member where learningLanguage != '한국어';
drop view learningLanguageGroup;
select * from learningLanguageGroup;

select * from member where nativeLanguage = '한국어';


/* 사용자 신고 테이블 */
CREATE TABLE report (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, /* 신고테이블 고유번호 */
	reportedMid VARCHAR(30) NOT NULL,            /* 신고된 사용자 mid (member 테이블과 연결) */
	reportingMid VARCHAR(30) NOT NULL,        	 /* 신고한 사용자 mid (member 테이블과 연결) */
	reason TEXT NOT NULL,                        /* 신고 사유 */
	reportDate DATETIME DEFAULT NOW()            /* 신고 날짜 */
);

/* 사용자 신고 테이블 */
create table report (
	idx int not null auto_increment primary key, /* 신고테이블 고유번호 */
	reportedMid varchar(30) not null,            /* 신고된 사용자 mid (member 테이블과 연결) */
	reportingMid varchar(30) not null,           /* 신고한 사용자 mid (member 테이블과 연결) */
	reason text not null,                        /* 신고 사유 */
	reportDate datetime default now()            /* 신고 날짜 */
);


desc report;
drop table report;

/* 신고, 회원 테이블 정보 가져오기 */
SELECT DATE_FORMAT(r.reportDate, '%Y-%m-%d %H:%i') AS reportDate, r.*, m.mid AS mid, m.nickName AS nickName, m.name AS name, m.email AS email, m.gender AS gender, m.birthday AS birthday, m.startDate AS startDate 
FROM report r JOIN member m ON r.reportedMid = m.idx ORDER BY r.idx DESC;

  m.mid AS mid, 
    m.nickName AS nickName, 
    m.name AS name, 
    m.email AS email, 
    m.gender AS gender, 
    m.birthday AS birthday, 
    m.startDate AS startDate
 

/* 텍스트 채팅을 저장 */
CREATE TABLE chat (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, /* 채팅 고유번호 */
	senderMid varchar(20) not null,              /* 발신자 회원 아이디 (member 테이블과 연결) */
	receiverMid varchar(20) not null,            /* 수신자 회원 아이디 (member 테이블과 연결) */
	message varchar(200) not null,               /* 메시지 내용 */
	chatDate datetime default now(),            /* 메시지 전송 시간 */
	FOREIGN KEY (senderMid) REFERENCES member(mid), 
	FOREIGN KEY (receiverMid) REFERENCES member(mid) 
);

/* 텍스트 채팅을 저장 */
create table chat (
	idx int not null auto_increment primary key, /* 채팅 고유번호 */
	senderMid varchar(20) not null,              /* 발신자 회원 아이디 (member 테이블과 연결) */
	receiverMid varchar(20) not null,            /* 수신자 회원 아이디 (member 테이블과 연결) */
	message varchar(200) not null,               /* 메시지 내용 */
	chatDate datetime default now(),            /* 메시지 전송 시간 */
	foreign key (senderMid) references member(mid), 
	foreign key (receiverMid) references member(mid) 
);


desc chat;
drop table chat;

select *,(select photo from member where mid=c.receiverMid) as photo from chat c where receiverMid = 'admin' order by chatDate desc;
select *, (select photo from member where mid=c.receiverMid) as photo from chat c where (senderMid = 'admin' or receiverMid = 'admin') and receiverMid like '%admin%' group by receiverMid order by chatDate desc

insert into chat value (default,'admin', 'mina1234', '관리자님 안녕하세요', default);
insert into chat value (default,'admin', 'mina1234', '관리자님 안녕하세요2', default);
insert into chat value (default,'admin', 'Martin', '마틴님 안녕하세요', default);
insert into chat value (default,'mina1234', 'admin', '안녕하세요 민아님 :)', default);

/* 텍스트 채팅 저장 - 다시 설계함 -이거안씀 */
CREATE TABLE chat (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,    /* 채팅 고유번호 */
	content text not null, 											    /* 메세지 내용 */
	sendId varchar(20) not null, 			 						  /* 보내는 사람 아이디 */
	sendSw char(1)		 not null default 's', 			  /* 보낸 메세지(s), 휴지통(g), 휴지통 삭제(x) 표시 */
	sendDate datetime default now(),   						  /* 메세지 보낸 날짜 */
	receiveId varchar(20) not null,   			 				/* 받는 사람 아이디 */
	receiveSw char(1)		 not null default 'n', 		  /* 받은 메세지(n), 읽은 메세지(r), 휴지통(g), 휴지통 삭제(x) 표시 */
	foreign key(sendId) references member(mid),
	foreign key(receiveId) references member(mid)
);
desc chat;

insert into chat value (default, '안녕하세요 !', 'mina', default,default,'atom1234','r');
insert into chat value (default, 'hi ! how r u?', 'atom1234', default,default,'mina','n');
insert into chat value (default, 'i miss u! where have u been?', 'atom1234', default,default,'mina','n');
insert into chat value (default, '관리자님! 할 말이 있는데요..', 'mina', default,default,'admin','r');
insert into chat value (default, '웹사이트 조아여~', 'mina', default,default,'admin','r');
insert into chat value (default, '감사합니다 ㅎㅎ', 'admin', default,default,'mina','n');

select *, (select photo from member where mid=c.receiverMid) as photo from chat c where (senderMid = 'admin' or receiverMid = 'admin') group by receiverMid order by chatDate desc;


/* 단어장 기능을 위한 테이블 */
CREATE TABLE voca(
	idx INT AUTO_INCREMENT PRIMARY KEY,      /* 단어 고유 ID */
	memberMid varchar(30),                   /* 사용자 고유번호 (member 테이블과 연결) */
	category VARCHAR(50),                    /* 단어 카테고리(여행 영단어, 친구랑 말하면서 몰랐던 영단어 등 단어를 분류해서 쓰도록)*/
	word VARCHAR(100),                       /* 단어 */
	meaning VARCHAR(100),                    /* 번역 */
	partOfSpeech VARCHAR(50),                /* 품사 */
	example TEXT,                            /* 예문 */
	FOREIGN KEY (memberMid) REFERENCES member(mid) ON DELETE CASCADE  
);
desc voca;


/* 단어장 테이블 */
create table voca(
	idx int auto_increment primary key,      /* 단어 고유 id */
	memberMid varchar(30),                   /* 사용자 고유번호 (member 테이블과 연결) */
	category varchar(50),                    /* 단어 카테고리 */
	word varchar(100),                       /* 단어 */
	meaning varchar(100),                    /* 번역 */
	partOfSpeech varchar(50),                /* 품사 */
	example text,                            /* 예문 */
	foreign key (memberMid) references member(mid) on delete cascade  
);


/* 단어 테스트 테이블 */
CREATE TABLE vocaTest (
	idx INT AUTO_INCREMENT PRIMARY KEY,             /* 단어 테스트 고유 번호 */
	memberMid varchar(30),                          /* 테스트 하는 사용자 아이디 (member 테이블과 연결) */
	vocaIdx INT,                                    /* 단어 고유 번호 (vocabulary 테이블과 연결) */
	category VARCHAR(50),                           /* 테스트할 단어의 카테고리 */
	score INT,                                      /* 테스트 점수 */
	testDate DATETIME DEFAULT NOW(),                /* 테스트 일자 */
	FOREIGN KEY (memberMid) REFERENCES member(mid) ON DELETE CASCADE,  
	FOREIGN KEY (vocaIdx) REFERENCES vocabulary(idx) ON DELETE CASCADE  
);
desc vocaTest;



/* 단어 테스트 테이블 */
create table vocaTest (
	idx int auto_increment primary key,             /* 단어 테스트 고유 번호 */
	memberMid varchar(30),                          /* 테스트 하는 사용자 아이디 (member 테이블과 연결) */
	vocaIdx int,                                    /* 단어 고유 번호 (voca 테이블과 연결) */
	category varchar(50),                           /* 테스트할 단어의 카테고리 */
	score int,                                      /* 테스트 점수 */
	testDate datetime default now(),                /* 테스트 일자 */
	foreign key (membermid) references member(mid) on delete cascade,  
	foreign key (vocaidx) references vocabulary(idx) on delete cascade  
);
