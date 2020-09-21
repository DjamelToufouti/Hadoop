
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

### Check the csv table (using SELECT... LIMIT10;)     
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> SELECT * FROM djamel_drivers_csv LIMIT 10;     
```

### Populate the orc table   
```
0: jdbc:hive2://zoo-1.au.adaltas.cloud:2181,z> INSERT INTO TABLE djamel_drivers_orc        
. . . . . . . . . . . . . . . . . . . . . . .> SELECT * FROM djamel_drivers_csv;
```

### Run a HQL script (eg a SLECT) using !run in beeline   
