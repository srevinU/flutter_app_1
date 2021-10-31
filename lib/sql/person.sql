-- CREATE EXTENSION IF NOT EXISTS 'uuid-ossp';

CREATE TABLE person(
   sys_uuid uuid DEFAULT uuid_generate_v4 ()
  ,sys_context     VARCHAR(50) NULL
  ,sys_type        VARCHAR(50) NOT NULL
  ,u_streetAddress VARCHAR(120) NOT NULL
  ,u_country       VARCHAR(60) NOT NULL
  ,u_postalCode    VARCHAR(30) NOT NULL
  ,u_email         VARCHAR(50) NOT NULL
  ,sys_image       VARCHAR(50) NULL
  ,u_jobTitle      VARCHAR(50) NULL
  ,u_name          VARCHAR(50) NOT NULL
  ,u_birthPlace    VARCHAR(60) NULL
  ,u_birthDate     DATE NOT NULL
  ,u_height        INTEGER NULL
  ,u_gender        VARCHAR(50) NOT NULL
  ,u_nationality   VARCHAR(60) NULL
  ,u_phone         VARCHAR(50) NULL
  ,sys_url         VARCHAR(50) NULL
  ,PRIMARY KEY (sys_uuid)
);
INSERT INTO person(sys_context,
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
                sys_url) 
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
        'url_test');


