## Map Reduce implementation 
Using hadoop-streaming jar implement python codes mapper.py and reducer.py in order:
  * to find the frequency of each words inside text file alice.txt (with the content of the book: "Alice in the wonderland" found here: http://www.gutenberg.org/files/11/11-0.txt)
  * to get the most used (frequent) word in the text file
  * finlaly to get the most used word in the text book (using output of previous wordcount map reduce as input)
  
# Map Reduce with Python
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar -file wordcount/mapper.py -mapper "python mapper.py" -file wordcount/reducer.py -reducer "python reducer.py" -input data/alice.txt -output output/wordcount
