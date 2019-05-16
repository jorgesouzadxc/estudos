DROP TABLE ACDB_SECTORS\\
DROP TABLE ACDB_PACKAGES\\
DROP TABLE ACDB_CUSTOMERS\\

CREATE TABLE "ACDB_SECTORS" 
   (	"SECTOR_ID" NUMBER(8,0), 
	"SECTOR_NAME" VARCHAR2(25 BYTE)
   ) \\
Insert into ACDB_SECTORS (SECTOR_ID,SECTOR_NAME) values (2,'Business')\\
Insert into ACDB_SECTORS (SECTOR_ID,SECTOR_NAME) values (1,'Private')\\

CREATE TABLE "ACDB_PACKAGES" 
   (	"PACK_ID" NUMBER(8,0), 
	"SPEED" VARCHAR2(10 BYTE), 
	"MONTHLY_PAYMENT" NUMBER(8,0), 
	"SECTOR_ID" NUMBER(8,0), 
	"STRT_DATE" DATE
   ) \\  

Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (1,'750Kbps',79,1,to_date('03.11.05'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (2,'750Kbps',69,1,to_date('04.09.06'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (3,'750Kbps',59,1,to_date('06.01.07'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (4,'750Kbps',49,1,to_date('28.05.08'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (5,'750Kbps',39,1,to_date('10.10.09'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (6,'750Kbps',29,1,to_date('06.01.10'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (7,'750Kbps',69,2,to_date('03.05.05'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (8,'750Kbps',59,2,to_date('19.08.06'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (9,'750Kbps',49,2,to_date('01.11.07'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (10,'750Kbps',39,2,to_date('26.10.08'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (11,'750Kbps',29,2,to_date('27.11.09'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (12,'750Kbps',19,2,to_date('13.08.10'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (13,'1.5Mbps',89,1,to_date('08.02.06'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (14,'1.5Mbps',79,1,to_date('27.06.07'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (15,'1.5Mbps',69,1,to_date('01.11.08'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (16,'1.5Mbps',59,1,to_date('26.06.09'))\\
Insert into ACDB_PACKAGES (PACK_ID,SPEED,MONTHLY_PAYMENT,SECTOR_ID,STRT_DATE) values (17,'1.5Mbps',49,1,to_date('12.02.10'))\\

CREATE TABLE "ACDB_CUSTOMERS" 
   (	"CUSTOMER_ID" NUMBER(8,0), 
	"FIRST_NAME" VARCHAR2(25 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"CITY" VARCHAR2(45 BYTE), 
	"STATE" VARCHAR2(25 BYTE), 
	"STREET" VARCHAR2(40 BYTE), 
	"MAIN_PHONE_NUM" VARCHAR2(12 BYTE), 
	"SECONDARY_PHONE_NUM" VARCHAR2(12 BYTE), 
	"FAX" VARCHAR2(12 BYTE), 
	"MONTHLY_DISCOUNT" NUMBER(4,2), 
	"PACK_ID" NUMBER(8,0), 
	"BIRTH_DATE" DATE, 
	"JOIN_DATE" DATE
   ) \\
   

Insert into ACDB_CUSTOMERS values (177,'Cedric','Clarke','Cary','North Carolina','3694 Battery Street ','573.985.3508','946.234.9077','785.367.9119',7,7,to_date('28.08.87'),to_date('11.09.05'))\\
Insert into ACDB_CUSTOMERS values (178,'Clark','James','Orange','California','5807 Whipple Avenue','584.479.8597','963.400.3385','723.402.2663',28,null,to_date('12.04.66'),to_date('17.03.05'))\\
Insert into ACDB_CUSTOMERS values (179,'Cortez','Morgan','Pasadena','California','9107 Post Street ','592.889.8105','977.396.2912','728.328.9797',13,34,to_date('16.02.81'),to_date('11.12.08'))\\
Insert into ACDB_CUSTOMERS values (180,'Kelly','Hughes','Fullerton','California','8547 Noe Street','515.675.1257','979.692.7938','749.157.6605',9,23,to_date('05.04.79'),to_date('01.02.07'))\\
Insert into ACDB_CUSTOMERS values (181,'Luke','Edwards','Hampton','Virginia','5991 Ellis Street ','575.921.3984','951.451.8404','744.390.4522',null,27,to_date('04.10.66'),to_date('05.07.07'))\\
Insert into ACDB_CUSTOMERS values (182,'Del03','Hill','Clarksville','Tennessee','6068 Polk Street ','540.421.7470','921.480.6639',null,15,37,to_date('07.08.89'),to_date('19.07.09'))\\
Insert into ACDB_CUSTOMERS values (183,'Roland','Moore','McKinney','Texas','7921 Brannan Street ','562.704.7923',null,'728.647.4700',25,null,to_date('23.07.60'),to_date('15.06.08'))\\
Insert into ACDB_CUSTOMERS values (184,'Mike','Clark','Warren','Michigan','5975 Noe Street','536.750.3185','962.419.7991','769.395.7417',3,39,to_date('28.01.66'),to_date('05.01.09'))\\
Insert into ACDB_CUSTOMERS values (185,'Emory','Harrison','McAllen','Texas','7424 Halleck Street','543.717.5373','987.196.7392','796.853.1842',9,39,to_date('24.11.81'),to_date('20.09.09'))\\
Insert into ACDB_CUSTOMERS values (186,'Leandro','Scott','West Valley City','Utah','9005 Boalt Street ','570.731.2716','995.548.5645','710.690.1687',9,39,to_date('22.03.88'),to_date('07.10.09'))\\
Insert into ACDB_CUSTOMERS values (187,'Thomas','Young','Columbia','South Carolina','3997 Franklin Street','598.901.1970','967.130.4544','746.560.1670',null,37,to_date('27.06.89'),to_date('01.10.09'))\\
Insert into ACDB_CUSTOMERS values (188,'Domenic','Morris','Killeen','Texas','3310 Lick Place ','538.772.7460','955.660.1883','766.859.3377',15,13,to_date('13.01.63'),to_date('25.01.06'))\\
Insert into ACDB_CUSTOMERS values (189,'Tyler','Hall','New Haven','Connecticut','6787 Lick Place ','529.250.4936','972.521.8147','746.689.9722',20,18,to_date('18.12.77'),to_date('03.08.06'))\\
Insert into ACDB_CUSTOMERS values (190,'Errol','Ward','Topeka','Kansas','2279 Bartlett Street ','511.448.5701','959.141.3085',null,6,37,to_date('25.04.89'),to_date('26.05.09'))\\
Insert into ACDB_CUSTOMERS values (191,'Stacey','Turner','Thousand Oaks','California','8300 Alvarado Street','572.863.9216','957.555.9080','747.920.2671',14,null,to_date('05.09.60'),to_date('13.06.10'))\\
Insert into ACDB_CUSTOMERS values (192,'Davis','Carter','Olathe','Kansas','6423 Hyde Street','566.677.2091','975.346.7938',null,18,null,to_date('02.07.85'),to_date('26.10.06'))\\
Insert into ACDB_CUSTOMERS values (193,'Harrison','Phillips','Cedar Rapids','Iowa','3375 Griffith Street ','549.356.9341','983.183.1399','730.596.8418',15,null,to_date('16.02.81'),to_date('09.07.05'))\\
Insert into ACDB_CUSTOMERS values (194,'Enrique','Mitchell','Waco','Texas','7696 King Street','595.843.8430','990.480.3639','767.820.4777',19,1,to_date('05.09.90'),to_date('19.03.05'))\\
Insert into ACDB_CUSTOMERS values (195,'Cory','Patel','Visalia','California','8780 Spear Street ','549.108.9476','978.195.3750',null,29,42,to_date('16.04.82'),to_date('01.10.10'))\\
Insert into ACDB_CUSTOMERS values (196,'Ariel','Adams','Elizabeth','New Jersey','9862 Sutter Street','565.479.1416','994.745.2564','779.118.7503',29,1,to_date('17.08.80'),to_date('22.02.05'))\\
Insert into ACDB_CUSTOMERS values (197,'Russel','Campbell','Simi Valley','California','1446 Wallace Avenue','537.408.7269',null,'720.837.6523',16,18,to_date('08.12.72'),to_date('18.01.06'))\\
Insert into ACDB_CUSTOMERS values (198,'Chadwick','Anderson','Gainesville','Florida','8862 Donahue Street ','578.886.8930',null,'736.691.1889',null,13,to_date('07.03.68'),to_date('01.04.06'))\\
Insert into ACDB_CUSTOMERS values (199,'Lucas','Allen','Hartford','Connecticut','1320 Sunset Boulevard ','525.154.3329','939.543.9762','766.992.2287',13,42,to_date('26.01.73'),to_date('24.12.10'))\\
Insert into ACDB_CUSTOMERS values (200,'Rocky','Cook','Bellevue','Washington','2042 Treat Avenue ','584.693.4590','983.917.6883','766.471.9788',null,27,to_date('05.10.62'),to_date('10.08.07'))\\
Insert into ACDB_CUSTOMERS values (201,'Antonia','Bailey','Mira03','Florida','4980 Funston Avenue ','589.743.5105','931.267.7501','715.510.4632',17,null,to_date('01.02.68'),to_date('08.10.08'))\\
Insert into ACDB_CUSTOMERS values (202,'Buddy','Parker','Concord','California','5770 Galindo Avenue ','521.259.3813','958.793.1406','722.974.9054',21,37,to_date('07.07.78'),to_date('03.07.09'))\\
Insert into ACDB_CUSTOMERS values (203,'Eugenio','Miller','Stamford','Connecticut','9267 McKinnon Avenue','544.317.8051','965.416.8109','750.892.9278',26,7,to_date('27.08.77'),to_date('28.05.05'))\\
Insert into ACDB_CUSTOMERS values (204,'Burton','Davis','Coral Springs','Florida','9805 Folsom Street','595.535.2360','983.311.7460',null,3,27,to_date('05.05.76'),to_date('07.06.07'))\\
Insert into ACDB_CUSTOMERS values (205,'Rufus','Murphy','Charleston','South Carolina','3253 Perry Street','595.693.8699','936.442.7573','772.871.5212',28,41,to_date('04.02.83'),to_date('04.05.10'))\\
Insert into ACDB_CUSTOMERS values (206,'Neil','Price','Carrollton','Texas','1319 Pixley Street ','546.548.6253','940.158.8044',null,29,39,to_date('19.11.68'),to_date('25.03.09'))\\
Insert into ACDB_CUSTOMERS values (207,'Garret','Bell','Lafayette','Louisiana','5282 Phelan Avenue','582.446.8508','995.116.6999','755.135.6800',9,39,to_date('03.02.71'),to_date('01.01.09'))\\
Insert into ACDB_CUSTOMERS values (208,'Art','Baker','Roseville','California','6386 Larkin Street','595.520.9406','996.410.9387','733.615.4496',26,37,to_date('12.05.69'),to_date('05.10.09'))\\
Insert into ACDB_CUSTOMERS values (209,'Garrett','Griffiths','Thornton','Colorado','2535 Scott Street ','523.173.9602','922.133.5235',null,null,18,to_date('27.09.70'),to_date('11.02.06'))\\
Insert into ACDB_CUSTOMERS values (210,'Damian','Kelly','Frisco','Texas','3832 Whipple Avenue','520.951.6402','942.467.1893',null,26,37,to_date('22.08.85'),to_date('13.09.09'))\\
Insert into ACDB_CUSTOMERS values (211,'Roosevelt','Simpson','Kent','Washington','4141 Farragut Avenue','522.964.9354',null,null,27,42,to_date('07.01.69'),to_date('25.02.10'))\\
Insert into ACDB_CUSTOMERS values (212,'Chet','03shall','Surprise','Arizona','3541 Powell Street','597.586.4291',null,null,16,27,to_date('18.06.65'),to_date('10.01.07'))\\
Insert into ACDB_CUSTOMERS values (213,'Cornell','Collins','Allentown','Pennsylvania','7644 Baker Street ','549.703.1520',null,'792.367.4476',24,41,to_date('07.02.90'),to_date('23.05.10'))\\


SELECT * FROM acdb_customers