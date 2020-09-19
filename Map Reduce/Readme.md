# Map Reduce implementation
Goal is to implement mapper.py and reducer.py using hadoop-streaming jar:
  * to find the frequency of each words inside text file alice.txt (with the content of the book: "Alice in the wonderland" found here: http://www.gutenberg.org/files/11/11-0.txt)
  * to get the most used (frequent) word in the text file
  * finlaly to get the most used word in the text book (using output of previous wordcount map reduce as input)
  
### Map Reduce with Python
[t.djamel-dsti@edge-1 ~]$ touch mapper.py  
[t.djamel-dsti@edge-1 ~]$ nano mapper.py  
[t.djamel-dsti@edge-1 ~]$ touch reducer.py  
[t.djamel-dsti@edge-1 ~]$ nano reducer.py  
[t.djamel-dsti@edge-1 ~]$ wget http://www.gutenberg.org/files/11/11-0.txt  
[t.djamel-dsti@edge-1 ~]$ mv 11-0.txt alice.txt   
[t.djamel-dsti@edge-1 ~]$  hdfs dfs -put alice.txt data/  
[t.djamel-dsti@edge-1 ~]$  yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar -file mapper.py -mapper "python mapper.py" -file reducer.py -reducer "python reducer.py" -input data/alice.txt -output output/wordcount  
[t.djamel-dsti@edge-1 ~]$ hdfs dfs -ls data/word_count  
Found 2 items  
-rw-r--r--   2 t.djamel-dsti hdfs          0 2020-09-17 11:56 data/word_count/_SUCCESS  
-rw-r--r--   2 t.djamel-dsti hdfs      61765 2020-09-17 11:56 data/word_count/part-r-00000  


