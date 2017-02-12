add jar /opt/cloudera/parcels/CDH/jars/hive-contrib-1.1.0-cdh5.7.0.jar;
add jar /opt/cloudera/parcels/CDH/jars/hive-serde-1.1.0-cdh5.7.0.jar;

USE s49302;

DROP TABLE IF EXISTS UserData;

CREATE EXTERNAL TABLE  UserData (
	ip STRING,
	browser STRING,
	sex STRING,
	age INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
	"input.regex" = '^(\\S*)\\t(\\S*)\\t(\\S*)\\t(\\S*).*$', "output.format.string" = "%1$s %2$s %3$s %4$s"
)
STORED AS TEXTFILE
LOCATION '/data/user_logs/user_data_S';

select * from UserData limit 10;
