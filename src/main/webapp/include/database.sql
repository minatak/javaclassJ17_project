show tables;

/* 사용자 계정 및 프로필 정보를 저장 */
CREATE TABLE member (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  /* 회원 고유번호 */
    mid VARCHAR(30) UNIQUE NOT NULL,             /* 사용자 아이디 (중복 확인 필요) */
    pwd VARCHAR(100) NOT NULL,                   /* 비밀번호 (SHA256 암호화 처리) */
    nickname VARCHAR(20) NOT NULL,               /* 회원 별명 (중복 불가능/수정 가능) */
    name VARCHAR(20) NOT NULL,                   /* 이름 */
    email VARCHAR(60) NOT NULL,                  /* 이메일 */
    gender CHAR(2) NOT NULL DEFAULT '남자',       /* 성별 */
    birthdate DATETIME DEFAULT NOW(),            /* 생일 */
    photo VARCHAR(100) DEFAULT 'noimage.jpg',    /* 프로필 사진 */
    country VARCHAR(50) NOT NULL,                /* 거주하는 나라 */
    city VARCHAR(50),                            /* 도시 */
    nativeLanguage VARCHAR(50) NOT NULL,         /* 모국어 */
    learningLanguage VARCHAR(50) NOT NULL,       /* 학습할 언어 */
    languageLevel CHAR(2) NOT NULL DEFAULT '초급', /* 학습할 언어의 수준 ('초급', '중급', '고급') */
    content TEXT,                                	/* 자기소개 */
    userDel CHAR(2) DEFAULT 'NO',                /* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
    level INT DEFAULT 1,                         /* 회원등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원, (4:운영자)) , 99:탈퇴신청회원 */
    startDate DATETIME DEFAULT NOW(),            /* 최초 가입일 */
    lastDate DATETIME DEFAULT NOW()              /* 마지막 접속일 */
);
desc member;

/* 사용자 신고 테이블 */
CREATE TABLE report (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, /* 신고테이블 고유번호 */
    reportedIdx INT,            							   /* 신고된 사용자 idx (member 테이블과 연결) */
    reportingIdx INT,           								 /* 신고한 사용자 idx (member 테이블과 연결) */
    reason TEXT NOT NULL,                        /* 신고 사유 */
    reportDate DATETIME DEFAULT NOW(),           /* 신고 날짜 */
    FOREIGN KEY (reportedIdx) REFERENCES member(idx) ON DELETE CASCADE,  
    FOREIGN KEY (reportingIdx) REFERENCES member(idx) ON DELETE CASCADE  
);

desc report;
drop table report;

/* 텍스트 채팅을 저장 */
CREATE TABLE chat (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, /* 채팅 고유번호 */
    senderIdx INT,                               /* 발신자 회원 고유번호 (member 테이블과 연결) */
    receiverIdx INT,                             /* 수신자 회원 고유번호 (member 테이블과 연결) */
    message TEXT,                                /* 메시지 내용 */
    timestamp DATETIME DEFAULT NOW(),            /* 메시지 전송 시간 */
    FOREIGN KEY (senderIdx) REFERENCES member(idx) ON DELETE CASCADE,    
    FOREIGN KEY (receiverIdx) REFERENCES member(idx) ON DELETE CASCADE   
);
desc chat;


/* 단어장 기능을 위한 테이블 */
CREATE TABLE vocabulary (
    idx INT AUTO_INCREMENT PRIMARY KEY,      /* 단어 고유 ID */
    memberIdx INT,                           /* 사용자 고유번호 (member 테이블과 연결) */
    category VARCHAR(50),                     /* 단어 카테고리(여행 영단어, 친구랑 말하면서 몰랐던 영단어 등 단어를 분류해서 쓰도록)*/
    word VARCHAR(100),                       /* 단어 */
    meaning VARCHAR(100),                    /* 번역 */
    partOfSpeech VARCHAR(50),                /* 품사 */
    example TEXT,                            /* 예문 */
    FOREIGN KEY (memberIdx) REFERENCES member(idx) ON DELETE CASCADE  
);
desc vocabulary;


/* 단어 테스트 테이블 */
CREATE TABLE vocaTest (
    idx INT AUTO_INCREMENT PRIMARY KEY,             /* 단어 테스트 고유 번호 */
    userIdx INT,                                    /* 사용자 고유 번호 (member 테이블과 연결) */
    vocaIdx INT,                                    /* 단어 고유 번호 (vocabulary 테이블과 연결) */
    category VARCHAR(50),                           /* 테스트할 단어의 카테고리 */
    score INT,                                      /* 테스트 점수 */
    testDate DATETIME DEFAULT NOW(),                /* 테스트 일자 */
    FOREIGN KEY (userIdx) REFERENCES member(idx) ON DELETE CASCADE,  
    FOREIGN KEY (vocaIdx) REFERENCES vocabulary(idx) ON DELETE CASCADE  
);
desc vocaTest;
