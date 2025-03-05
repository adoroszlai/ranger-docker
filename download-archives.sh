#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -u -o pipefail

source lib.sh

mkdir -p "downloads/db"

pushd "downloads"
download_if_not_exists https://repo1.maven.org/maven2/com/googlecode/log4jdbc/log4jdbc/1.2/log4jdbc-1.2.jar log4jdbc-1.2.jar
popd

pushd "downloads/db"
download_if_not_exists https://download.oracle.com/otn-pub/otn_software/jdbc/236/ojdbc8.jar oracle.jar
download_if_not_exists https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/12.8.1.jre8/mssql-jdbc-12.8.1.jre8.jar mssql.jar
download_if_not_exists https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar mysql-connector.jar
download_if_not_exists https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.16.jre7/postgresql-42.2.16.jre7.jar postgresql.jar
popd
