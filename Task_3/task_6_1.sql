add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;

USE s49302;

add FILE replace;

SELECT
  TRANSFORM (request)
  USING 'replace'
  AS (request)
FROM UserLogs
LIMIT 10
