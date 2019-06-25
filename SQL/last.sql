SET SERVEROUTPUT ON;
DECLARE
    c_id customers.id%type;
    c_name customers.name%type;
    c_address customers.address%type;
    c_sal customers.salary%type;
    CURSOR c_customers IS
        SELECT id, name, address, salary FROM customers;
    BEGIN
        OPEN c_customers;
        LOOP
        FETCH c_customers INTO c_id, c_name, c_address, c_sal;
        EXIT WHEN c_customers%notfound;
        dbms_output.put_line(c_name||' '||c_sal);
        END LOOP;
        CLOSE c_customers;
    END;
    /

