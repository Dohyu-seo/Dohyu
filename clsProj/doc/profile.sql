CREATE TABLE profile(
    pno NUMBER(4)
        CONSTRAINT PROF_NO_PK PRIMARY KEY,
    p_mno NUMBER(4)
        CONSTRAINT PROF_MNO_FK REFERENCES member(mno)
        CONSTRAINT PROF_MNO_NN NOT NULL,
    pcode CHAR(1) DEFAULT 'N'
        CONSTRAINT PROF_CODE_CK CHECK(pcode IN('N','C')),
    oriname VARCHAR2( 100 CHAR)
        CONSTRAINT PROF_ORINAME_NN NOT NULL,
    savename VARCHAR2 (100 CHAR)
        CONSTRAINT PROF_SNAME_UK UNIQUE
        CONSTRAINT PROF_SNAME_NN NOT NULL,
    dir VARCHAR2(100 CHAR) DEFAULT '/profile'
        CONSTRAINT PROF_DIR_NN NOT NULL,
    len NUMBER
        CONSTRAINT PROF_LEN_NN NOT NULL,
    PDATE DATE DEFAULT sysdate
        CONSTRAINT PROF_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT PROF_SHOW_CK CHECK(isshow IN('Y','N'))
        CONSTRAINT PROF_SHOW_NN NOT NULL        
);

INSERT INTO
    memeber(mno, name, id, pw, mail, gen, tel, ano)
VALUES(
    (SELECT NVL(MAX(mno)+ 1, 1000) FROM member WHERE mno < 9998),
    ?, ?, ?, ?, ?, ?, ?    
);

INSERT INTO
    profile(pno, p_mno, oriname, savename,len)
VALUES(
    (SELECT NVL(MAX(pno)+1,1000)FROM profile ),
    (SELECT mno FROM member WHERE id = ? ),
    ?, ?, ?
);