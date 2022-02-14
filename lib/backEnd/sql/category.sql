
DROP TABLE IF EXISTS t_person;
DROP TABLE IF EXISTS t_category;
CREATE TABLE t_category(
   sys_uuid uuid DEFAULT uuid_generate_v4()
  ,sys_type uuid NOT NULL
  ,sys_cat_name VARCHAR(50) NOT NULL
  ,UNIQUE(sys_type, sys_cat_name)
  ,PRIMARY KEY (sys_uuid)
  ,CONSTRAINT fk_type FOREIGN KEY(sys_type) REFERENCES t_type(sys_uuid)
);

INSERT INTO t_category(sys_cat_name, sys_type) 
VALUES ('Business',
        '50f27c34-c388-496a-a004-cb13c92855d2'
        );

-- INSERT INTO t_category(sys_type,
--                 sys_label) 
-- VALUES ('Type test',
--         'Label test'
--         );