#!/bin/bash
# Shell script para obtener una copia desde mysql
# Desarollador 

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

set -e

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SHOURCE[0]}")" && pwd)"
