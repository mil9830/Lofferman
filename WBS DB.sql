************Example 1 Action Query *****************/

BEGIN
   INSERT INTO VENDOR 
      ( 
      V_CODE     ,   
      V_NAME     , 
      V_CONTACT  ,
      V_AREACODE ,     
      V_PHONE    ,     
      V_STATE    ,     
      V_ORDER    
	  )
   VALUES 
      (
	   25678,
       'Microsoft Corp.', 
       'Bill Gates',
       '765',
       '546-8484',
       'WA',
       'N');
   DBMS_OUTPUT.PUT_LINE('New Vendor Added!');
END;
/

SELECT * FROM VENDOR;

ROLLBACK;

SELECT * FROM VENDOR;

/************Example 2 Simple Anonymous Block Without Loop or Cursor *****************/

DECLARE
   W_P1  NUMBER(3) := 0;
   W_P2  NUMBER(3) := 10;
   W_NUM NUMBER(2) := 0;
BEGIN

      SELECT COUNT(P_CODE) INTO W_NUM FROM PRODUCT 
      WHERE P_PRICE BETWEEN W_P1 AND W_P2;
      DBMS_OUTPUT.PUT_LINE('There are ' || W_NUM || ' Products with price between ' || W_P1 || ' and ' || W_P2);

END;
/

/************Example 3 Simple Anonymous Block Having Loop Without Cursor *****************/

DECLARE
   W_P1  NUMBER(3) := 0;
   W_P2  NUMBER(3) := 10;
   W_NUM NUMBER(2) := 0;
BEGIN
   WHILE W_P2 < 300 LOOP
      SELECT COUNT(P_CODE) INTO W_NUM FROM PRODUCT 
      WHERE P_PRICE BETWEEN W_P1 AND W_P2;
      DBMS_OUTPUT.PUT_LINE('There are ' || W_NUM || ' Products with price between ' || W_P1 || ' and ' || W_P2);
      W_P1 := W_P2 + 1;
      W_P2 := W_P2 + 50;
   END LOOP;
END;
/

/************Example 4 Simple Anonymous Block Having Loop and Cursor *****************/

DECLARE 
   W_P_CODE	PRODUCT.P_CODE%TYPE;
   W_P_DESCRIPT	PRODUCT.P_DESCRIPT%TYPE;
   W_TOT		NUMBER(3);

   CURSOR PROD_CURSOR IS
      SELECT 
	     P_CODE, P_DESCRIPT
      FROM 
	     PRODUCT
      WHERE 
	     P_QOH > (SELECT AVG(P_QOH) FROM PRODUCT);
BEGIN
   DBMS_OUTPUT.PUT_LINE('PRODUCTS WITH P_QOH > AVG(P_QOH)');
   DBMS_OUTPUT.PUT_LINE('======================================');

   OPEN PROD_CURSOR;

      LOOP
         FETCH PROD_CURSOR INTO W_P_CODE, W_P_DESCRIPT;
         EXIT WHEN PROD_CURSOR%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE(W_P_CODE ||' -> ' || W_P_DESCRIPT );
      END LOOP;
   
      DBMS_OUTPUT.PUT_LINE('======================================');
      DBMS_OUTPUT.PUT_LINE('TOTAL PRODUCT PROCESSED ' || PROD_CURSOR%ROWCOUNT); 
      DBMS_OUTPUT.PUT_LINE('--- END OF REPORT ----');

   CLOSE PROD_CURSOR;

END;
/

/************Example 5 Simple Procedure Without Input Parameter *****************/

CREATE OR REPLACE PROCEDURE EXAMPLE_5 AS 
   W_P1  NUMBER(3) := 0;
   W_P2  NUMBER(3) := 10;
   W_NUM NUMBER(2) := 0;
   
BEGIN
      SELECT COUNT(P_CODE) INTO W_NUM FROM PRODUCT 
      WHERE P_PRICE BETWEEN W_P1 AND W_P2;
      DBMS_OUTPUT.PUT_LINE('There are ' || W_NUM || ' Products with price between ' || W_P1 || ' and ' || W_P2);
END;
/

EXEC EXAMPLE_5;

 


/************Example 6 Simple Procedure With Input Parameter *****************/
 
CREATE OR REPLACE PROCEDURE EXAMPLE_6
   (
    W_P1 IN NUMBER,
    W_P2 IN NUMBER
	)
AS 
   W_NUM NUMBER(2) := 0;
   
BEGIN
      SELECT COUNT(P_CODE) INTO W_NUM FROM PRODUCT 
      WHERE P_PRICE BETWEEN W_P1 AND W_P2;
      DBMS_OUTPUT.PUT_LINE('There are ' || W_NUM || ' Products with price between ' || W_P1 || ' and ' || W_P2);
END;
/

EXEC EXAMPLE_6 (1,10);
 
/************Example 7 Action Procedure Without Input Parameter *****************/

CREATE OR REPLACE PROCEDURE EXAMPLE_7 AS 
  BEGIN
   INSERT INTO VENDOR 
      (
	  V_CODE     ,   
      V_NAME     , 
      V_CONTACT  ,
      V_AREACODE ,     
      V_PHONE    ,     
      V_STATE    ,     
      V_ORDER    
	  )
   VALUES 
      (
	   25678,
       'Microsoft Corp.', 
       'Bill Gates',
       '765',
       '546-8484',
       'WA',
       'N');
   DBMS_OUTPUT.PUT_LINE('New Vendor Added!');
END;
/

SELECT * FROM VENDOR;

EXEC EXAMPLE_7;

SELECT * FROM VENDOR;

ROLLBACK;

SELECT * FROM VENDOR;

/************Example 8 Action Procedure With Input Parameter *****************/

CREATE OR REPLACE PROCEDURE EXAMPLE_8 
   (
	W_V_CODE      IN NUMBER   ,   
    W_V_NAME      IN VARCHAR2 , 
    W_V_CONTACT   IN VARCHAR2 ,
    W_V_AREACODE  IN VARCHAR2 ,     
    W_V_PHONE     IN VARCHAR2 ,     
    W_V_STATE     IN VARCHAR2 ,     
    W_V_ORDER     IN VARCHAR2 
	)
AS 
  BEGIN
   INSERT INTO VENDOR 
      (
	  V_CODE     ,   
      V_NAME     , 
      V_CONTACT  ,
      V_AREACODE ,     
      V_PHONE    ,     
      V_STATE    ,     
      V_ORDER    
	  )
   VALUES 
      (
	   W_V_CODE      ,  
       W_V_NAME      ,
       W_V_CONTACT   ,
       W_V_AREACODE  ,     
       W_V_PHONE     ,     
       W_V_STATE     ,    
       W_V_ORDER     
	   );
   DBMS_OUTPUT.PUT_LINE('Vendor ' || W_V_NAME || ' has been added!');
END;
/

SELECT * FROM VENDOR;

EXEC EXAMPLE_8 (25678, 'Microsoft Corp.', 'Bill Gates', '765','546-8484','WA','N');

SELECT * FROM VENDOR;

ROLLBACK;

SELECT * FROM VENDOR;

/************Example 9 Trigger -  Statement Level - runs for all rows *****************/

SELECT * FROM PRODUCT;

CREATE OR REPLACE TRIGGER TRG_PRODUCT_REORDER
AFTER INSERT OR UPDATE OF P_QOH, P_MIN ON PRODUCT
BEGIN 
   UPDATE PRODUCT
     SET P_REORDER = 1 
       WHERE P_QOH <= P_MIN;
END;


SELECT * FROM PRODUCT;

UPDATE PRODUCT 
   SET P_QOH = 4
   WHERE
    P_CODE = '11QER/31';

SELECT * FROM PRODUCT;



/*** 
 prep to show action on row not in update -
 change trigger P_REORDER = 2 
 will see update on first two rows now, even though only second row in update 
***/

CREATE OR REPLACE TRIGGER TRG_PRODUCT_REORDER
AFTER INSERT OR UPDATE OF P_QOH, P_MIN ON PRODUCT
BEGIN 
   UPDATE PRODUCT
     SET P_REORDER = 2 
       WHERE P_QOH <= P_MIN;
END;

SELECT * FROM PRODUCT; 

UPDATE PRODUCT 
   SET P_MIN = 35
   WHERE
    P_CODE = '13-Q2/P2';
	
SELECT * FROM PRODUCT; 



/************Example 10 Trigger - Row Level - runs on row affected by action *****************/

select * from invoice;
select * from customer;

CREATE OR REPLACE TRIGGER TRG_LINE_CUS
AFTER INSERT ON LINE 
FOR EACH ROW
DECLARE 
W_CUS CHAR(5);
W_TOT NUMBER:= 0;    -- to compute total cost
BEGIN
   -- this trigger fires up after an INSERT of a LINE
   -- it will update the CUS_BALANCE in CUSTOMER   

   -- 1) get the CUS_CODE
   SELECT CUS_CODE INTO W_CUS 
     FROM INVOICE
      WHERE INVOICE.INV_NUMBER = :NEW.INV_NUMBER;
       
   -- 2) compute the total of the current line
   
   W_TOT := :NEW.LINE_PRICE * :NEW.LINE_UNITS;
    
   -- 3) Update the CUS_BALANCE in CUSTOMER
   UPDATE CUSTOMER
    SET CUS_BALANCE = CUS_BALANCE + W_TOT
     WHERE CUS_CODE = W_CUS;

   DBMS_OUTPUT.PUT_LINE(' * * * Balance updated for customer: ' || W_CUS);  

END;


select * from invoice;
select * from customer;

INSERT INTO LINE VALUES(1001,3,'1546-QQ2',7,1.00);

select * from invoice;
select * from customer;
