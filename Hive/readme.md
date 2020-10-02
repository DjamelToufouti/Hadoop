# Hive and beeline: Transform a .csv file to an .orc file

### Create a drivers folder in the HDFS home  
```
[t.djamel-dsti@edge-1 ~]$ mkdir drivers   
```

### Get the drivers.csv file (contains the data structure) located on HDFS and put it in drivers folder on edge  
```
[t.djamel-dsti@edge-1 ~]$ hdfs dfs -get /data/drivers/drivers.csv drivers  
[t.djamel-dsti@edge-1 ~]$ head drivers/drivers.csv  
driverId,name,ssn,location,certified,wage-plan
10,George Vetticaden,621011971,244-4532 Nulla Rd.,N,miles
11,Jamie Engesser,262112338,366-4125 Ac Street,N,miles
12,Paul Coddin,198041975,Ap #622-957 Risus. Street,Y,hours
13,Joe Niemiec,139907145,2071 Hendrerit. Ave,Y,hours
14,Adis Cesir,820812209,Ap #810-1228 In St.,Y,hours
15,Rohit Bakshi,239005227,648-5681 Dui- Rd.,Y,hours
16,Tom McCuch,363303105,P.O. Box 313- 962 Parturient Rd.,Y,hours
17,Eric Mizell,123808238,P.O. Box 579- 2191 Gravida. Street,Y,hours
18,Grant Liu,171010151,Ap #928-3159 Vestibulum Av.,Y,hours
```

### Connect to Hive using beeline  
```
[t.djamel-dsti@edge-1 ~]$ beeline -u "jdbc:hive2://zoo-1.au.adaltas.cloud:2181,zoo-2.au.adaltas.cloud:2181,zoo-3.au.adaltas.cloud:2181/dsti;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2;"    
```

### Set Hive database for schema (using a new putty window)   
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> use dsti_2020_fall_1    
```

### Create both external tables djamel_drivers_csv and djamel_drivers_orc    
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> CREATE EXTERNAL TABLE IF NOT EXISTS djamel_drivers_csv
. . . . . . . . . . . . . . . . . . . . . . .> (driverId INT,name STRING,ssn STRING,location STRING,certified STRING,wageplan STRING)
. . . . . . . . . . . . . . . . . . . . . . .> ROW FORMAT DELIMITED
. . . . . . . . . . . . . . . . . . . . . . .> FIELDS TERMINATED BY ','
. . . . . . . . . . . . . . . . . . . . . . .> STORED AS TEXTFILE
. . . . . . . . . . . . . . . . . . . . . . .> LOCATION '/user/t.djamel-dsti/drivers'
. . . . . . . . . . . . . . . . . . . . . . .> tblproperties ("skip.header.line.count"="1");

0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> CREATE EXTERNAL TABLE IF NOT EXISTS djamel_drivers_orc
. . . . . . . . . . . . . . . . . . . . . . .> (driverId INT,name STRING,ssn STRING,location STRING,certified STRING,wageplan STRING)
. . . . . . . . . . . . . . . . . . . . . . .> ROW FORMAT DELIMITED
. . . . . . . . . . . . . . . . . . . . . . .> FIELDS TERMINATED BY ','
. . . . . . . . . . . . . . . . . . . . . . .> STORED AS TEXTFILE
. . . . . . . . . . . . . . . . . . . . . . .> LOCATION '/user/t.djamel-dsti/drivers';
```

### Check the description of the csv table
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> describe djamel_drivers_csv;
```

### Check the csv table (using SELECT... LIMIT10;)     
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> SELECT * FROM djamel_drivers_csv LIMIT 10;     
```

### Populate the orc table   
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> INSERT INTO TABLE djamel_drivers_orc        
. . . . . . . . . . . . . . . . . . . . . . .> SELECT * FROM djamel_drivers_csv;
```

### Run a HQL script (eg a SELECT) using !run in beeline   

```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> !run drivers.hql
```
The file drivers.hql contains the SQL querie written above to check the csv table. It is located in the edge.
