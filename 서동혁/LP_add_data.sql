--수록곡 번호
INSERT INTO
    track(trA,genr,alno,song,art,ptime,lan,compo,lyr,ori,rema)
 VALUES(
    'A_1',11,1001,'One Summer’s Day (센과치히로中)','Joe Hisaishi',292,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );

INSERT INTO
    track
 VALUES(
    'A_2',11,1001,'Kiki’Delivery Service (마녀배달부키키中)','Joe Hisaishi',236,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 
 INSERT INTO
    track
 VALUES(
    'A_3',11,1001,'Summer (기쿠지로의여름中)','Joe Hisaishi',158,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 

 INSERT INTO
    track
 VALUES(
    'A_4',11,1001,'ilporcorosso (붉은돼지中)','Joe Hisaishi',294,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );

 INSERT INTO
    track
 VALUES(
    'A_5',11,1001,'Madness (붉은돼지中)','Joe Hisaishi',196,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 
 INSERT INTO
    track
 VALUES(
    'A_6',11,1001,'Water Traveller (물의행인, 사무라이키즈中)','Joe Hisaishi',246,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 
  INSERT INTO
    track
 VALUES(
    'A_7',11,1001,'Oriental Wind','Joe Hisaishi',329,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );

   INSERT INTO
    track
 VALUES(
    'A_8',11,1001,'Silent Love (그여름가장조용한바다中)','Joe Hisaishi',249,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 
   INSERT INTO
    track
 VALUES(
    'A_9',11,1001,'Departures (굿 바이中)','Joe Hisaishi',250,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 
   INSERT INTO
    track
 VALUES(
    'A_10',11,1001,'“PRINCESS MONONOKE” Suite (from모노노케히메,원령공주)','Joe Hisaishi',526,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );

   INSERT INTO
    track
 VALUES(
    'A_11',11,1001,'The Procession of CelestialBeings (카구야공주)','Joe Hisaishi',146,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );

 INSERT INTO
    track
 VALUES(
    'A_12',11,1001,'My Neighbour TOTORO (이웃집토토로中)','Joe Hisaishi',240,'JPY','Joe Hisaishi','Joe Hisaishi','Joe Hisaishi','N'
 );
 
 INSERT INTO
    track
 VALUES(
    'B_1',14,2001,'5 am','이승열',222,'KOR','이승열',null,'이승열','N'
 );

 INSERT INTO
    track
 VALUES(
    'B_2',14,2001,'다행-믿어지니?','이승열',236,'KOR','이승열',null,'이승열','N'
 );

 INSERT INTO
    track
 VALUES(
    'B_3',14,2001,'secret','이승열',248,'KOR','이승열',null,'이승열','N'
 );
           
  INSERT INTO
    track
 VALUES(
    'B_4',14,2001,'아무일 도 없던 것처럼...','이승열',276,'KOR','이승열',null,'이승열','N'
 );

   INSERT INTO
    track
 VALUES(
    'B_5',14,2001,'My 발라드','이승열',213,'KOR','이승열',null,'이승열','N'
 );
 
 INSERT INTO
    track
 VALUES(
    'B_6',14,2001,'기다림(영화 ing 주제곡)','이승열',223,'KOR','이승열',null,'이승열','N'
 );

 INSERT INTO
    track
 VALUES(
    'B_7',14,2001,'흘러가는 시간, 잊혀지는 기억들','이승열',221,'KOR','이승열',null,'이승열','N'
 );

  INSERT INTO
    track
 VALUES(
    'B_8',14,2001,'mo better blues','이승열',252,'KOR','이승열',null,'이승열','N'
 );

 INSERT INTO
    track
 VALUES(
    'B_9',14,2001,'이날, 이때, 이즈음에...','이승열',292,'KOR','이승열',null,'이승열','N'
 );

 INSERT INTO
    track
 VALUES(
    'B_10',14,2001,'분(憤)','이승열',276,'KOR','이승열',null,'이승열','N'
 );

  INSERT INTO
    track
 VALUES(
    'B_11',14,2001,'내 안에 따스한','이승열',272,'KOR','이승열',null,'이승열','N'
 );
 

 INSERT INTO
    track
 VALUES(
    'B_12',14,2001,'비상 (원더풀데이즈 주제곡)','이승열',265,'KOR','이승열',null,'이승열','N'
 );

  INSERT INTO
    track
 VALUES(
    'B_13',14,2001,'푸른 너를 본다','이승열',261,'KOR','이승열',null,'이승열','N'
 );

 
 -- 장르 번호
    INSERT INTO
    Genre
    VALUES(
        10,'발라드'
    );
     INSERT INTO
    Genre
    VALUES(
        11,'뉴에이지'
    );
     INSERT INTO
    Genre
    VALUES(
        12,'재즈'
    );
     INSERT INTO
    Genre
    VALUES(
        13,'인디음악'
    );
     INSERT INTO
    Genre
    VALUES(
        14,'록'
    );
     INSERT INTO
    Genre
    VALUES(
        15,'트로트'
    );
     INSERT INTO
    Genre
    VALUES(
        16,'일렉트로닉'
    );
     INSERT INTO
    Genre
    VALUES(
        17,'힙합'
    );
     INSERT INTO
    Genre
    VALUES(
        18,'J-Pop'
    );
     INSERT INTO
    Genre
    VALUES(
        19,'CCM'
    );
     INSERT INTO
    Genre
    VALUES(
        20,'포크'
    );
     INSERT INTO
    Genre
    VALUES(
        21,'댄스뮤직'
    );
    
    -- 음반 테이블
    INSERT INTO
        CDTAB(alno, aname, pack, sdate)
    VALUES(
        1001,'Dream Songs_The Essential','F','2020/02/21'
    );

    INSERT INTO
        CDTAB
    VALUES(
        2001,'2020-02-21','1집 - 이날, 이때, 이즈음에....','F'
    );
