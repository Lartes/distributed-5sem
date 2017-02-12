add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;

SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;

USE s49302;

DROP TABLE IF EXISTS UserLogsP;

CREATE EXTERNAL TABLE  UserLogsP (
        ip STRING,
        request STRING,
        pagesize INT,
        responseCode INT,
        info STRING
)
PARTITIONED BY (date INT);

INSERT INTO UserLogsP PARTITION (date)
SELECT ip, request, pagesize, responseCode, info, date
FROM UserLogs;

SELECT * FROM UserLogsP LIMIT 5;
SELECT * FROM UserLogs LIMIT 5;
