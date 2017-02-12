add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;

USE s49302;

SELECT IpData.region, COUNT(*) as number, TT.average
FROM UserLogs JOIN IpData ON (UserLogs.ip=IpData.ip) JOIN
(SELECT AVG (T.number) as average
FROM
(SELECT IpData.region, COUNT(*) as number
FROM UserLogs JOIN IpData ON (UserLogs.ip=IpData.ip)
GROUP BY IpData.region) T) TT
GROUP BY IpData.region, TT.average
HAVING number > TT.average
LIMIT 10
