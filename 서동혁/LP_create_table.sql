-- ���ϰ� ��ȣ ���̺�
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

-- �帣 ��ȣ ���̺�
CREATE TABLE  Genre(
    genr NUMBER(2)
        CONSTRAINT GENRE_GENR_PK PRIMARY KEY
        CONSTRAINT GENRE_GENR_NN NOT NULL,
    gname VARCHAR2(10 CHAR)
        CONSTRAINT GENRE_GNAME_NN NOT NULL
);

-- ���� ���̺� 
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

-- ���ϰ� ���̺� ȣ��
SELECT
    tra Ʈ���̸�, song "�� ��", TO_CHAR (TO_DATE(ptime,'sssss'),'mi:ss') ��Ÿ��, genr
FROM
    TRACK
;

-- CDTAB, Ʈ�� ȣ��
SELECT
    CDTAB.alno �ٹ���ȣ, CDTAB.aname �ٹ��̸�, art ��Ƽ��Ʈ, compo �۰, ori ���, lyr �ۻ簡, lan ���, rema "������ũ?",tra Ʈ����ȣ, song ���,TO_CHAR (TO_DATE(ptime,'sssss'),'mi:ss') ��Ÿ��
FROM
TRACK, CDTAB
;

--�帣 ���̺� ȣ��
SELECT
    genr �帣��ȣ, gname �帣
FROM
    genre
;

