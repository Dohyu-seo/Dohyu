SELECT
    rno, bno title, name, bdate, click
FROM
    (
        SELECT
            ROWNUM rno, bno, title, name, bdate, click
        FROM
            (
                SELECT
                    bno, title, name, bdate, click
                FROM
                    board, member
                WHERE
                    board.isshow = 'Y'
                    AND bmno = mno
                ORDER BY
                    bdate DESC
            )
    )
WHERE
    rno BETWEEN ? AND ?
;

CREATE TABLE
    board
(
    bno NUMBER(6)
        CONSTRAINT BRD_NO_PK PRIMARY KEY,
    bmno NUMBER(4)
        CONSTRAINT BRD_MNO_FK REFERENCES member(mno)
        CONSTRAINT BRD_MNO_NN NOT NULL,
    title VARCHAR2(50 CHAR)
        CONSTRAINT BRD_TITLE_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT BRD_BODY_NN NOT NULL,
    bdate DATE DEFAULT sysdate
        CONSTRAINT BRD_DATE_NN NOT NULL,
    click NUMBER(6) DEFAULT 0
        CONSTRAINT BRD_CLICK_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT BRD_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT BRD_SHOW_NN NOT NULL
);

/*
ALTER TABLE board
ADD
    click NUMBER(6) DEFAULT 0
        CONSTRAINT BRD_CLICK_NN NOT NULL
;

ALTER TABLE board
ADD
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT BRD_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT BRD_SHOW_NN NOT NULL
;

*/
CREATE TABLE,ㅐㅣ
    brdImage
(
    bino NUMBER(6)
        CONSTRAINT BIMG_NO_PK PRIMARY KEY,
    bi_bno NUMBER(6)
        CONSTRAINT BIMG_BNO_FK REFERENCES board(bno)
        CONSTRAINT BIMG_BNO_NN NOT NULL,
    oriname VARCHAR2(200 CHAR)
        CONSTRAINT BIMG_ONAME_NN NOT NULL,
    savename VARCHAR2(200 CHAR)
        CONSTRAINT BIMG_SNAME_NN NOT NULL
        CONSTRAINT BIMG_SNAME_UK UNIQUE,
    dir VARCHAR2(500 CHAR)  DEFAULT '/brdimg'
        CONSTRAINT BIMG_DIR_NN NOT NULL,
    len NUMBER
        CONSTRAINT BIMG_LEN_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT BIMG_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT BIMG_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT BIMG_SHOW_NN NOT NULL
);
commit;

SELECT
bno, title, name, body, bdate, click, bino, NVL(oriname,'none') oriname , NVL(savename,'none') savename
FROM 
	board, brdimage, member
WHERE 
	bmno = mno 
	AND bno = bi_bno(+)
	AND bno = 1000;
    
INSERT INTO
    board(bno, bmno, title, body)
VALUES(
    (SELECT NVL(MAX(bno)+1, 1000) FROM board),1000,'제목','내용'    
);