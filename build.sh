#!/usr/bin/env bash
#
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

_build_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${_build_dir}" || exit 1

: ${RANGER_VERSION:=2.6.0}

./download-archives.sh
./download-ranger.sh

for dockerfile in Dockerfile.service-*; do
  service=${dockerfile#Dockerfile.service-}

  docker build \
    --build-arg RANGER_BASE_IMAGE \
    --build-arg RANGER_BASE_VERSION \
    --build-arg RANGER_DB_TYPE \
    --build-arg RANGER_VERSION \
    -t "apache/ranger-${service}:${RANGER_VERSION}-dev" \
    -f "${dockerfile}" \
    $@ .
done
