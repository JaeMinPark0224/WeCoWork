
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명1', 'www.회사명1.com', DEFAULT
    , '담당자1 이름', 'admin1@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명2', 'www.회사명2.com', DEFAULT
    , '담당자2 이름', 'admin2@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명3', 'www.회사명3.com', DEFAULT
    , '담당자3 이름', 'admin3@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명4', 'www.회사명4.com', DEFAULT
    , '담당자4 이름', 'admin4@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명5', 'www.회사명5.com', DEFAULT
    , '담당자5 이름', 'admin5@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');    

INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명6', 'www.회사명6.com', DEFAULT
    , '담당자6 이름', 'admin6@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명7', 'www.회사명7.com', DEFAULT
    , '담당자7 이름', 'admin7@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명8', 'www.회사명8.com', DEFAULT
    , '담당자8 이름', 'admin8@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명9', 'www.회사명9.com', DEFAULT
    , '담당자9 이름', 'admin9@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
    
INSERT INTO TB_COMPANY
    (CP_NO, CP_NAME, CP_URL, CP_DATE
    , CP_JOIN_NAME, CP_JOIN_EMAIL, CP_JOIN_PHONE
    , CP_APPR_YN, CP_PWD)
    VALUES
    ((SELECT NVL(MAX(CP_NO),0)+1 FROM TB_COMPANY), '회사명10', 'www.회사명10.com', DEFAULT
    , '담당자10 이름', 'admin10@email.com', '010-0000-0000', DEFAULT, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');       

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '영업팀'
    , DEFAULT, DEFAULT, NULL, NULL);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '국내 영업팀'
    , DEFAULT, DEFAULT, NULL, 10);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '해외 영업팀'
    , DEFAULT, DEFAULT, NULL, 10);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '인사팀'
    , DEFAULT, DEFAULT, NULL, NULL);
    
INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '개발팀'
    , DEFAULT, DEFAULT, NULL, NULL);    

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '마캐팅팀'
    , DEFAULT, DEFAULT, NULL, NULL); 

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 1, '생산팀'
    , DEFAULT, DEFAULT, NULL, NULL);
    
INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '영업팀'
    , DEFAULT, DEFAULT, NULL, NULL);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '국내 영업팀'
    , DEFAULT, DEFAULT, NULL, 17);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '해외 영업팀'
    , DEFAULT, DEFAULT, NULL, 17);

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '인사팀'
    , DEFAULT, DEFAULT, NULL, NULL);
    
INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '개발팀'
    , DEFAULT, DEFAULT, NULL, NULL);    

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '마캐팅팀'
    , DEFAULT, DEFAULT, NULL, NULL); 

INSERT INTO TB_DEPARTMENT
    (DEPT_NO, CP_NO, DEPT_NAME
    , DEPT_DATE, ACTIVE_YN, EMP_NO
    , DEPT_UPPER_NO)
    VALUES
    ((SELECT NVL(MAX(DEPT_NO), 9)+1 FROM TB_DEPARTMENT), 2, '생산팀'
    , DEFAULT, DEFAULT, NULL, NULL);    
    

INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '대표', 0, 1);
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '전무', 1, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '상무', 2, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '부장', 3, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '차장', 4, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '과장', 5, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '대리', 6, 1);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '주임', 7, 1);     
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '사원', 8, 1);
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '인턴', 9, 1); 
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '대표', 0, 2);
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '전무', 1, 2);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '상무', 2, 2);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '부장', 3, 2);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '차장', 4, 2);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '과장', 5, 2);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '대리', 6, 2);    
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '주임', 7, 2);     
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '사원', 8, 2);
    
INSERT INTO TB_JOB_TITLE
    (JOB_TITLE_NO, JOB_TITLE, JOB_LEVEL, CP_NO)
    VALUES
    ((SELECT NVL(MAX(JOB_TITLE_NO), 0)+1 FROM TB_JOB_TITLE), '인턴', 9, 2);     
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp1@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '대표1', '0001', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 1, 'Y');
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp2@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '전무1', '0002', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 2, 'Y');
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp3@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '상무1', '0003', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 3, 'Y');    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp4@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '부장1', '0004', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 4, 'Y');    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp5@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '차장1', '0005', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 5, 'Y');    
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp6@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '과장1', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 6, 'Y');    

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'jaeminpark0224@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '박재민', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 10, 6, 'Y');   

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp7@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '박재민1', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 11, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp8@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '박재민2', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 11, 6, DEFAULT);
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp9@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '박재민3', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 11, 6, DEFAULT);
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp10@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '박재민4', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 11, 6, DEFAULT);    

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp11@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '서유빈', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 12, 6, DEFAULT); 

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp12@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '서유빈1', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 12, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp13@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '서유빈2', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 12, 6, DEFAULT);    

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp14@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '이진정', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 13, 6, DEFAULT); 

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp15@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '이진정1', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 13, 6, DEFAULT); 

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp16@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '이진정2', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 13, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp17@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '이진정3', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 13, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp18@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '민승택', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 14, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp19@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '민승택1', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 14, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp20@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '민승택2', '0006', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 14, 6, DEFAULT);

INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp21@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '사원1', '0001', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 17, 11, 'Y');
    
INSERT INTO TB_EMPLOYEE
    (EMP_NO, EMAIL, PWD
    , NAME, INTL_NO, PHONE
    , PROFILE, SIGN, IP
    , JOIN_DATE, RESIGN_DATE, RESIGN_YN
    , DEPT_NO, JOB_TITLE_NO, HR_YN)
    VALUES
    ((SELECT NVL(MAX(EMP_NO), 99)+1 FROM TB_EMPLOYEE), 'emp22@email.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'
    , '사원2', '0002', '010-0000-0000'
    , NULL, NULL, '127.0.0.1'
    , DEFAULT, NULL, DEFAULT
    , 17, 11, 'Y');
    

insert into tb_attendance values (202207011100, 100, '2022-07-01', '2022-07-01 09:00:01', '2022-07-01 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207041100, 100, '2022-07-04', '2022-07-04 09:00:02', '2022-07-04 17:00:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207051100, 100, '2022-07-05', '2022-07-05 09:00:02', '2022-07-05 17:00:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207061100, 100, '2022-07-06', '2022-07-06 09:00:01', '2022-07-06 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207071100, 100, '2022-07-07', '2022-07-07 09:00:01', '2022-07-07 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207081100, 100, '2022-07-08', '2022-07-08 09:00:01', '2022-07-08 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207111100, 100, '2022-07-11', '2022-07-11 09:00:01', '2022-07-11 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207121100, 100, '2022-07-12', '2022-07-12 09:00:01', '2022-07-12 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207131100, 100, '2022-07-13', '2022-07-13 09:00:01', '2022-07-13 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207141100, 100, '2022-07-14', '2022-07-14 09:00:01', '2022-07-14 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207151100, 100, '2022-07-15', '2022-07-15 09:00:01', '2022-07-15 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207181100, 100, '2022-07-18', '2022-07-18 09:00:01', '2022-07-18 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207191100, 100, '2022-07-19', '2022-07-19 09:00:01', '2022-07-19 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207201100, 100, '2022-07-20', '2022-07-20 09:00:01', '2022-07-20 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207211100, 100, '2022-07-21', '2022-07-21 09:00:01', '2022-07-21 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207221100, 100, '2022-07-22', '2022-07-22 09:00:01', '2022-07-22 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207251100, 100, '2022-07-25', '2022-07-25 09:00:01', '2022-07-25 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207261100, 100, '2022-07-26', '2022-07-26 09:00:01', '2022-07-26 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207271100, 100, '2022-07-27', '2022-07-27 09:00:01', '2022-07-27 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207281100, 100, '2022-07-28', '2022-07-28 09:00:01', '2022-07-28 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');
insert into tb_attendance values (202207291100, 100, '2022-07-29', '2022-07-29 09:00:01', '2022-07-29 17:00:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'N');

insert into tb_attendance values (202207011101, 101, '2022-07-01', '2022-07-01 09:00:01', '2022-07-01 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207021101, 101, '2022-07-02', '2022-07-02 13:00:01', '2022-07-02 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207041101, 101, '2022-07-04', '2022-07-04 09:00:02', '2022-07-04 17:00:02', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207051101, 101, '2022-07-05', '2022-07-05 09:00:02', '2022-07-05 17:00:02', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207061101, 101, '2022-07-06', '2022-07-06 09:00:01', '2022-07-06 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207071101, 101, '2022-07-07', '2022-07-07 10:00:01', '2022-07-07 20:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207081101, 101, '2022-07-08', '2022-07-08 09:00:01', '2022-07-08 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207111101, 101, '2022-07-11', '2022-07-11 09:00:01', '2022-07-11 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207121101, 101, '2022-07-12', '2022-07-12 09:00:01', '2022-07-12 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207131101, 101, '2022-07-13', '2022-07-13 08:00:01', '2022-07-13 19:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207141101, 101, '2022-07-14', '2022-07-14 11:00:01', '2022-07-14 21:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207151101, 101, '2022-07-15', '2022-07-15 10:00:01', '2022-07-15 19:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207191101, 101, '2022-07-19', '2022-07-19 09:00:01', '2022-07-19 18:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207201101, 101, '2022-07-20', '2022-07-20 10:00:01', '2022-07-20 19:45:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207211101, 101, '2022-07-21', '2022-07-21 09:00:01', '2022-07-21 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207221101, 101, '2022-07-22', '2022-07-22 11:30:01', '2022-07-22 22:08:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207251101, 101, '2022-07-25', '2022-07-25 09:00:01', '2022-07-25 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');
insert into tb_attendance values (202207261101, 101, '2022-07-26', '2022-07-26 09:00:01', '2022-07-26 17:00:01', '0:0:0:0:0:0:1:1', '0:0:0:0:0:0:1:1', 'N');

insert into tb_attendance values (202207011102, 102, '2022-07-01', '2022-07-01 09:00:01', '2022-07-01 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207041102, 102, '2022-07-04', '2022-07-04 09:00:02', '2022-07-04 17:00:02', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207051102, 102, '2022-07-05', '2022-07-05 09:00:02', '2022-07-05 17:00:02', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207061102, 102, '2022-07-06', '2022-07-06 09:00:01', '2022-07-06 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207111102, 102, '2022-07-11', '2022-07-11 09:00:01', '2022-07-11 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207121102, 102, '2022-07-12', '2022-07-12 09:00:01', '2022-07-12 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207131102, 102, '2022-07-13', '2022-07-13 09:00:01', '2022-07-13 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207141102, 102, '2022-07-14', '2022-07-14 09:00:01', '2022-07-14 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207151102, 102, '2022-07-15', '2022-07-15 09:00:01', '2022-07-15 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207181102, 102, '2022-07-18', '2022-07-18 09:00:01', '2022-07-18 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207191102, 102, '2022-07-19', '2022-07-19 09:00:01', '2022-07-19 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207201102, 102, '2022-07-20', '2022-07-20 09:00:01', '2022-07-20 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207211102, 102, '2022-07-21', '2022-07-21 09:00:01', '2022-07-21 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207221102, 102, '2022-07-22', '2022-07-22 09:00:01', '2022-07-22 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207261102, 102, '2022-07-26', '2022-07-26 09:00:01', '2022-07-26 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207271102, 102, '2022-07-27', '2022-07-27 09:00:01', '2022-07-27 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207281102, 102, '2022-07-28', '2022-07-28 09:00:01', '2022-07-28 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');
insert into tb_attendance values (202207291102, 102, '2022-07-29', '2022-07-29 09:00:01', '2022-07-29 17:00:01', '0:0:0:0:0:1:1:1', '0:0:0:0:0:1:1:1', 'N');

insert into tb_attendance values (202207011103, 103, '2022-07-01', '2022-07-01 10:00:01', '2022-07-01 19:20:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207041103, 103, '2022-07-04', '2022-07-04 09:00:02', '2022-07-04 17:00:02', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207051103, 103, '2022-07-05', '2022-07-05 09:00:02', '2022-07-05 17:00:02', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207061103, 103, '2022-07-06', '2022-07-06 08:00:01', '2022-07-06 18:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207071103, 103, '2022-07-07', '2022-07-07 11:00:01', '2022-07-07 19:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207081103, 103, '2022-07-08', '2022-07-08 09:00:01', '2022-07-08 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207111103, 103, '2022-07-11', '2022-07-11 09:00:01', '2022-07-11 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207121103, 103, '2022-07-12', '2022-07-12 09:00:01', '2022-07-12 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207131103, 103, '2022-07-13', '2022-07-13 09:00:01', '2022-07-13 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207141103, 103, '2022-07-14', '2022-07-14 08:25:01', '2022-07-14 18:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207151103, 103, '2022-07-15', '2022-07-15 09:00:01', '2022-07-15 18:15:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207161103, 103, '2022-07-16', '2022-07-16 11:00:01', '2022-07-16 18:20:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207181103, 103, '2022-07-18', '2022-07-18 09:00:01', '2022-07-18 18:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207191103, 103, '2022-07-19', '2022-07-19 09:00:01', '2022-07-19 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207201103, 103, '2022-07-20', '2022-07-20 09:00:01', '2022-07-20 18:50:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207211103, 103, '2022-07-21', '2022-07-21 10:00:01', '2022-07-21 19:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207221103, 103, '2022-07-22', '2022-07-22 09:00:01', '2022-07-22 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207261103, 103, '2022-07-26', '2022-07-26 09:00:01', '2022-07-26 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207271103, 103, '2022-07-27', '2022-07-27 09:03:01', '2022-07-27 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207281103, 103, '2022-07-28', '2022-07-28 09:00:01', '2022-07-28 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');
insert into tb_attendance values (202207291103, 103, '2022-07-29', '2022-07-29 09:00:01', '2022-07-29 17:00:01', '0:0:0:0:1:1:1:1', '0:0:0:0:1:1:1:1', 'N');

insert into tb_attendance values (202207011104, 104, '2022-07-01', '2022-07-01 10:00:01', '2022-07-01 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207041104, 104, '2022-07-04', '2022-07-04 10:00:02', '2022-07-04 17:00:02', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207051104, 104, '2022-07-05', '2022-07-05 10:30:02', '2022-07-05 19:00:02', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207061104, 104, '2022-07-06', '2022-07-06 10:00:01', '2022-07-06 19:40:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207071104, 104, '2022-07-07', '2022-07-07 10:00:01', '2022-07-07 19:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207081104, 104, '2022-07-08', '2022-07-08 10:00:01', '2022-07-08 19:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207111104, 104, '2022-07-11', '2022-07-11 09:00:01', '2022-07-11 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207121104, 104, '2022-07-12', '2022-07-12 09:00:01', '2022-07-12 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207131104, 104, '2022-07-13', '2022-07-13 09:00:01', '2022-07-13 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207141104, 104, '2022-07-14', '2022-07-14 09:00:01', '2022-07-14 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207151104, 104, '2022-07-15', '2022-07-15 07:50:01', '2022-07-15 18:40:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207181104, 104, '2022-07-18', '2022-07-18 09:00:01', '2022-07-18 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207191104, 104, '2022-07-19', '2022-07-19 09:00:01', '2022-07-19 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207201104, 104, '2022-07-20', '2022-07-20 10:08:01', '2022-07-20 20:15:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207211104, 104, '2022-07-21', '2022-07-21 09:00:01', '2022-07-21 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207221104, 104, '2022-07-22', '2022-07-22 09:00:01', '2022-07-22 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207251104, 104, '2022-07-25', '2022-07-25 09:30:01', '2022-07-25 19:50:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207261104, 104, '2022-07-26', '2022-07-26 09:00:01', '2022-07-26 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207271104, 104, '2022-07-27', '2022-07-27 09:00:01', '2022-07-27 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207281104, 104, '2022-07-28', '2022-07-28 09:00:01', '2022-07-28 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');
insert into tb_attendance values (202207291104, 104, '2022-07-29', '2022-07-29 09:00:01', '2022-07-29 17:00:01', '0:0:0:1:1:1:1:1', '0:0:0:1:1:1:1:1', 'N');

insert into tb_attendance values (202207011105, 105, '2022-07-01', '2022-07-01 10:00:01', '2022-07-01 18:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207041105, 105, '2022-07-04', '2022-07-04 10:00:02', '2022-07-04 18:00:02', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207051105, 105, '2022-07-05', '2022-07-05 10:00:02', '2022-07-05 18:00:02', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207061105, 105, '2022-07-06', '2022-07-06 10:00:01', '2022-07-06 19:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207071105, 105, '2022-07-07', '2022-07-07 10:00:01', '2022-07-07 19:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207081105, 105, '2022-07-08', '2022-07-08 10:00:01', '2022-07-08 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207111105, 105, '2022-07-11', '2022-07-11 09:00:01', '2022-07-11 18:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207121105, 105, '2022-07-12', '2022-07-12 10:20:01', '2022-07-12 19:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207131105, 105, '2022-07-13', '2022-07-13 09:00:01', '2022-07-13 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207141105, 105, '2022-07-14', '2022-07-14 09:00:01', '2022-07-14 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207151105, 105, '2022-07-15', '2022-07-15 09:00:01', '2022-07-15 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207181105, 105, '2022-07-18', '2022-07-18 11:00:01', '2022-07-18 19:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207191105, 105, '2022-07-19', '2022-07-19 10:30:01', '2022-07-19 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207201105, 105, '2022-07-20', '2022-07-20 09:00:01', '2022-07-20 18:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207211105, 105, '2022-07-21', '2022-07-21 09:40:01', '2022-07-21 20:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207221105, 105, '2022-07-22', '2022-07-22 09:00:01', '2022-07-22 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207251105, 105, '2022-07-25', '2022-07-25 09:00:01', '2022-07-25 18:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207261105, 105, '2022-07-26', '2022-07-26 09:00:01', '2022-07-26 21:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207271105, 105, '2022-07-27', '2022-07-27 09:00:01', '2022-07-27 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207281105, 105, '2022-07-28', '2022-07-28 08:20:01', '2022-07-28 22:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');
insert into tb_attendance values (202207291105, 105, '2022-07-29', '2022-07-29 09:00:01', '2022-07-29 17:00:01', '0:0:1:1:1:1:1:1', '0:0:1:1:1:1:1:1', 'N');


insert into tb_vacation values (10120220713, 101, 1, '22/07/18', '22/07/18', 1, '개인사유', '22/07/13', 2, null, 1, null);
insert into tb_vacation values (10120220720, 101, 1, '22/07/27', '22/07/29', 3, '개인사유', '22/07/20', 2, null, 1, null);
insert into tb_vacation values (10220220701, 102, 1, '22/07/07', '22/07/08', 2, '개인사유', '22/07/01', 2, null, 1, null);
insert into tb_vacation values (10222020724, 102, 5, '22/07/25', '22/07/25', 1, '생리휴가', '22/07/24', 2, null, 1, null);
insert into tb_vacation values (10322020701, 103, 1, '22/07/25', '22/07/25', 1, '개인사유', '22/07/01', 2, null, 1, null);

    
commit;    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    