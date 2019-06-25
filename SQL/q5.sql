declare
    emplno employee.employee_no%type;
    amt number(4);
    cate char(1);
    da number(9,2);
    hra number(9,2);
    gross number(9,2);
    cursor emplcursor is 
        select employee_no from employee;
begin
    open emplcursor;
    loop
        fetch emplcursor into emplno;
        exit when emplcursor%notfound;
        select salary, category into amt, cate from employee where employee_no = emplno;
        da := (0.35*amt);
        hra := (0.15*amt);
        if (hra > 250.00 and cate = 'W') then 
            hra := 250.00;
        elsif (hra > 1000.00 and cate = 'J') then 
            hra := 1000.00;
        elsif(hra > 3000.00 and cate = 'S') then 
            hra := 3000.00;
        end if;
        gross := amt + da + hra;

        update employee
            set grossSalary = gross where employee_no = emplno;

    end loop;
    close emplcursor;
end;
/