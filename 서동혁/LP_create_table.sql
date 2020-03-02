-- 수록곡 번호 테이블
CREATE TABLE track(
    tra VARCHAR2(10 CHAR)
        CONSTRAINT TRACK_TRA_PK PRIMARY KEY
        CONSTRAINT TRACK_TRA_NN NOT NULL,
    genr NUMBER(2)
        CONSTRAINT TRACK_GENR_FK REFERENCES Genre(genr)
        CONSTRAINT TRACK_GENR_NN NOT NULL,
    alno NUMBER(4)
        CONSTRAINT TRACK_ALNO_FK REFERENCES CDTAB(alno)
        CONSTRAINT TRACK_ALNO_NN NOT NULL,
    song VARCHAR2(30 CHAR)
        CONSTRAINT TRACK_SONG_NN NOT NULL,
    art VARCHAR2(20 CHAR)
        CONSTRAINT TRACK_ART_NN NOT NULL,
    ptime NUMBER(4)
        CONSTRAINT TRACK_PTIME_NN NOT NULL,
    lan VARCHAR2(10 CHAR)
        CONSTRAINT TRACK_LAN_NN NOT NULL,
    compo VARCHAR2(20),
    lyr VARCHAR2(20),
    ori VARCHAR2(20),
    rema CHAR(1)
        CONSTRAINT TRACK_REMA_NN NOT NULL
        CONSTRAINT TRACK_REMA_CK CHECK (rema IN('Y','N'))
);

-- 장르 번호 테이블
CREATE TABLE  Genre(
    genr NUMBER(2)
        CONSTRAINT GENRE_GENR_PK PRIMARY KEY
        CONSTRAINT GENRE_GENR_NN NOT NULL,
    gname VARCHAR2(10 CHAR)
        CONSTRAINT GENRE_GNAME_NN NOT NULL
);

-- 음반 테이블 
CREATE TABLE CDTAB(
    alno NUMBER(4)
        CONSTRAINT CDTAB_ALNO_PK PRIMARY KEY
        CONSTRAINT CDTAB_ALNO_NN NOT NULL,
    aname VARCHAR2(100 CHAR)
        CONSTRAINT CDTAB_ANAME_NN NOT NULL,
    sdate DATE
        CONSTRAINT CDTAB_SDATE_NN NOT NULL,
    pack CHAR(2)
        CONSTRAINT CDTAB_PACK_NN NOT NULL
        CONSTRAINT CDTAB_PACK_CK CHECK (pack IN ('S','M','F'))

);

--@d:\class\Oracle\sql\LP_add_data.sql

-- 수록곡 테이블 호출
SELECT
    tra 트랙이름, song "곡 명", TO_CHAR (TO_DATE(ptime,'sssss'),'mi:ss') 런타임, genr
FROM
    TRACK
;

-- CDTAB, 트랙 호출
SELECT
    CDTAB.alno 앨범번호, CDTAB.aname 앨범이름, art 아티스트, compo 작곡가, ori 원곡가, lyr 작사가, lan 언어, rema "리메이크?",tra 트랙번호, song 곡명,TO_CHAR (TO_DATE(ptime,'sssss'),'mi:ss') 런타임
FROM
TRACK, CDTAB
;

--장르 테이블 호출
SELECT
    genr 장르번호, gname 장르
FROM
    genre
;

