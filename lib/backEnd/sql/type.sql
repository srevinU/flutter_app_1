DROP TABLE IF EXISTS t_category;
DROP TABLE IF EXISTS t_type;
CREATE TABLE t_type(
   sys_uuid uuid DEFAULT uuid_generate_v4 ()
  ,sys_name        VARCHAR(50) NOT NULL UNIQUE
  ,PRIMARY KEY (sys_uuid)
);

INSERT INTO t_type(sys_name) 
VALUES ('Business');
DELETE FROM t_type WHERE sys_uuid='b1e83697-4af3-4ff2-81fc-9cbc01773dcf';