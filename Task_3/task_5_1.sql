add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;
add jar ./reverse/jar/reverse.jar;

USE s49302;

create temporary function reverse as 'com.example.hive.udf.Reverse';

SELECT reverse(IpData.ip)
FROM IpData
LIMIT 10
