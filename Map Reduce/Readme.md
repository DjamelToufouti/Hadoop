# Map Reduce with Python

### Download the file and create mapper and reducer python scripts
```
[t.djamel-dsti@edge-1 ~]$ touch mapper.py reducer.py  
[t.djamel-dsti@edge-1 ~]$ nano mapper.py  
[t.djamel-dsti@edge-1 ~]$ nano reducer.py  
[t.djamel-dsti@edge-1 ~]$ wget http://www.gutenberg.org/files/11/11-0.txt  
[t.djamel-dsti@edge-1 ~]$ mv 11-0.txt alice.txt   
[t.djamel-dsti@edge-1 ~]$ ls  
alice.txt  example.txt  mostfrequent  wordcount  
[t.djamel-dsti@edge-1 ~]$ ls wordcount
mapper.py  reducer.py  
```

### Implement mapper.py and reducer.py using hadoop-streaming jar for word counts
```
[t.djamel-dsti@edge-1 ~]$  hdfs dfs -put alice.txt data/  
[t.djamel-dsti@edge-1 ~]$  yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar -file wordcount/mapper.py -mapper "python mapper.py" -file wordcount/reducer.py -reducer "python reducer.py" -input data/alice.txt -output output/wordcount  
[t.djamel-dsti@edge-1 ~]$ hdfs dfs -ls data/wordcount  
Found 2 items  
-rw-r--r--   2 t.djamel-dsti hdfs          0 2020-09-17 11:56 data/wordcount/_SUCCESS  
-rw-r--r--   2 t.djamel-dsti hdfs      61765 2020-09-17 11:56 data/wordcount/part-00000  
[t.djamel-dsti@edge-1 ~]$ hdfs dfs -head output/wordcount/part-00000  
  
```

### Use the output of the first Map Reduce to implement a new Map Reduce for most frequent word  
```
[t.djamel-dsti@edge-1 ~]$ cat example.txt | python wordcount/mapper.py | sort | python wordcount/reducer.py | python mostfrequent/mapper.py | python mostfrequent/reducer.py  
word--DELIMITER--and    2  
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar -file mostfrequent/mapper.py -mapper "python mapper.py" -file mostfrequent/reducer.py -reducer "python reducer.py" -input output/wordcount/part-00000 -output output/mostfrequent  
[t.djamel-dsti@edge-1 ~]$ hdfs dfs -ls output/mostfrequent  
[t.djamel-dsti@edge-1 ~]$ hdfs dfs -head output/mostfrequent/part-00000  
word--DELIMITER--the    1677  
```



