add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;

USE s49302;

SELECT IpData.region, UserData.sex, COUNT(*) as number
FROM UserLogs JOIN IpData ON (UserLogs.ip=IpData.ip) JOIN UserData ON (UserLogs.ip=UserData.ip)
GROUP BY IpData.region, UserData.sex
LIMIT 10
