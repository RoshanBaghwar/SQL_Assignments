create or replace TRIGGER new_entry 
AFTER
INSERT OR
DELETE ON product2
Begin
	IF INSERTING THEN
	INSERT INTO product_entry
	Values('new_entry', current_timestamp);
END
IF;
    IF DELETING THEN
INSERT INTO product_entry
Values('some product stock ends', current_timestamp);
END
IF;
    END;
/