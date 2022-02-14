-- CREATE EXTENSION IF NOT EXISTS 'uuid-ossp';
DROP TABLE IF EXISTS t_person;
CREATE TABLE t_person(
   sys_uuid uuid DEFAULT uuid_generate_v4()
  ,sys_context     VARCHAR(50) NULL
  ,sys_type        VARCHAR(50) NOT NULL
  ,u_streetAddress VARCHAR(120) NOT NULL
  ,u_country       VARCHAR(60) NOT NULL
  ,u_postalCode    VARCHAR(30) NOT NULL
  ,u_email         VARCHAR(50) NOT NULL UNIQUE
  ,sys_image       VARCHAR(50) NULL
  ,u_jobTitle      VARCHAR(50) NULL
  ,u_name          VARCHAR(50) NOT NULL
  ,u_birthPlace    VARCHAR(60) NULL
  ,u_birthDate     DATE NOT NULL
  ,u_height        INTEGER NULL
  ,u_gender        VARCHAR(50) NOT NULL
  ,u_nationality   VARCHAR(60) NULL
  ,u_phone         VARCHAR(50) NULL UNIQUE
  ,sys_url         VARCHAR(50) NULL
  ,sys_category    uuid NULL
  ,PRIMARY KEY (sys_uuid)
  ,CONSTRAINT fk_category FOREIGN KEY(sys_category) REFERENCES t_category(sys_uuid)  
);
INSERT INTO t_person(sys_context,
                sys_type,
                u_streetAddress,
                u_country,
                u_postalCode,
                u_email,
                sys_image,
                u_jobTitle,
                u_name,
                u_birthPlace,
                u_birthDate,
                u_height,
                u_gender,
                u_nationality,
                u_phone,
                sys_url,
                sys_category) 
VALUES ('context_test',
        'type_test',
        'streetAddress_test',
        'country_test',
        'postalCode_test',
        'email_test',
        'image_test',
        'jobTitle_test',
        'name_test',
        'birthPlace_test',
        '2022-01-01',
        '0000',
        'gender_test',
        'nationality_test',
        'uphone_test',
        'url_test',
        '9e467197-5af5-45ef-a6d6-5cecc6edafdc');


