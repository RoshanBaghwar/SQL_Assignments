SET SERVEROUTPUT ON;
DECLARE
    totalRow number;
BEGIN
    UPDATE customers
    SET salary = salary + 500;
    IF sql%notfound THEN
        dbms_output.put_line('No customers selected');
    ELSIF sql%found THEN
        totalRow := sql%rowcount;
        dbms_output.put_line(totalRow||' customers selected');
    END IF;
    END;
    /


