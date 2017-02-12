add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;

USE s49302;

SELECT UserLogs.date, COUNT(*) as number
FROM UserLogs
GROUP BY UserLogs.date
ORDER BY number
LIMIT 10

