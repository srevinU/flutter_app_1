#!/bin/bash

# Colors print
cyan='\033[0;36m'
purple='\033[0;35m'
NOCOLOR='\033[0m'

# Functions
function displayInfo {
    if [ $3 = "Created" ]
    then 
        echo -e "✅ ${cyan} $1 ${purple} $2 ${cyan} $3 ${NOCOLOR}"
    else
        echo "----------------------------------------------------" 
        echo -e "⏳ ${cyan} $1 ${purple} $2 ${cyan} $3 ${NOCOLOR}"
    fi
}

function checkError {
  if [[ 0 -ne $? ]]; then
    echo $1
    exit
  fi
}


# Start setUp
dbName='db_flutter_app_1'

# Create database
displayInfo "Database" $dbName "setUp"
psql -U postgres -c "DROP DATABASE IF EXISTS ${dbName}"
checkError
psql postgres -c "CREATE DATABASE ${dbName} WITH ENCODING 'UTF8'
                  TEMPLATE template0"
checkError

# Extension creation

psql ${dbName} -U postgres -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
checkError
displayInfo "Database" $dbName "Created"

# Category table creation
table='t_category'
displayInfo "Table" $table "setUp"
# psql ${dbName} -U postgres -c "DROP TABLE IF EXISTS ${table}"
psql ${dbName} -U postgres -c "CREATE TABLE ${table}(
  sys_uuid uuid DEFAULT uuid_generate_v4()
  ,u_name VARCHAR(50) NOT NULL
  ,u_color VARCHAR(25) NULL
  ,u_description VARCHAR(250) NULL
  ,UNIQUE(sys_uuid, u_name)
  ,PRIMARY KEY (sys_uuid)
);"
checkError
displayInfo "Table" $table "Created"

# Person table creation
table='t_person'
displayInfo "Table" $table "setUp"
# psql ${dbName} -U postgres -c "DROP TABLE IF EXISTS ${table}"
psql ${dbName} -U postgres -c "CREATE TABLE t_person(
  sys_uuid uuid DEFAULT uuid_generate_v4()
  ,sys_context     VARCHAR(50) NULL
  ,sys_type        VARCHAR(50) NOT NULL
  ,u_street_address VARCHAR(120) NOT NULL
  ,u_country       VARCHAR(60) NOT NULL
  ,u_postal_code    VARCHAR(30) NOT NULL
  ,u_email         VARCHAR(50) NOT NULL UNIQUE
  ,sys_image       VARCHAR(50) NULL
  ,u_job_title      VARCHAR(50) NULL
  ,u_name          VARCHAR(50) NOT NULL
  ,u_birth_date     DATE NOT NULL
  ,u_gender        VARCHAR(50) NOT NULL
  ,u_phone         VARCHAR(50) NULL UNIQUE
  ,sys_url         VARCHAR(50) NULL
  ,sys_category    uuid NULL
  ,UNIQUE(sys_uuid)
  ,PRIMARY KEY (sys_uuid)
  ,CONSTRAINT fk_category FOREIGN KEY(sys_category) REFERENCES t_category(sys_uuid)  
);"
checkError
displayInfo "Table" $table "Created"

