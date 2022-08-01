CREATE OR REPLACE PROCEDURE WCW_PROC



IS
    annual_leave number;
    TYPE TABLE_TYPE IS TABLE OF number
        INDEX BY BINARY_INTEGER;
    emp_list TABLE_TYPE;
BEGIN
    open c_user from
    select emp_no from 
    
    commit;

END WCW_PROC;