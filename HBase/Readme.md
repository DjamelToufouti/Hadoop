
### Enter into HBase shell command
```
[t.djamel-dsti@edge-1 ~]$ hbase shell
```

### Create a table with 2 column family: opinion and metadata
```
hbase(main):003:0> create 'dsti_2020_fall_1:djamel_table', 'opinion', 'metadata'
```

### Check the description of the data
```
hbase(main):004:0> list
hbase(main):006:0> describe 'dsti_2020_fall_1:djamel_table'
```

### Update the number of vesrions to have an access to the history of an entry
```
hbase(main):003:0> alter 'dsti_2020_fall_1:djamel_table', {NAME => 'opinion', VERSIONS => 5}
```

### Insert Data into the table in 'metadata' column
```
hbase(main):008:0> put 'dsti_2020_fall_1:djamel_table', 't123_u234, 'metadata:tconst', 'tt123'
```

### Insert Data into the table in 'opinion' column (with 5 versions)
```
hbase(main):010:0> put 'dsti_2020_fall_1:djamel_table', 't123_u234, 'opinion:comment', 'great movie'
```

### Update the same row
```
hbase(main):015:0> put 'dsti_2020_fall_1:djamel_table', 't123_u234', 'opinion:comment', 'not so great movie'
```

### Check the different versions of the entries
```
hbase(main):017:0> scan 'dsti_2020_fall_1:djamel_table' VERSIONS => 5
```
 t123_u234                                   column=opinion:comment, timestamp=1601899290643, value=not so great movie
 t123_u234                                   column=opinion:comment, timestamp=1601899280406, value=great movie
