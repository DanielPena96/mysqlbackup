#!/bin/bash
# Shell script para obtener una copia desde mysql
# Desarollador 

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

set -e

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SHOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "$0")"

run 
make_backup 

function assert_is_installed {
	local readonly name=$1"

	if [[ ! $(command -v ${name}) ]]; then
		log_error "The binario '$name' se requiere pero no esta en nuestro sistema"
		exit 1
}

function log_error { 
	local readonly message "$1"
	log "ERROR" "$message"
}

function log {
	local readonly level="$1"
	local readonly message="$2"
	local readonly timestamp=$(date + "%Y-%m-%d %H:%M:%S") >&2 echo -e "${timestamp} [{$level}] [$SCRIPT_NAME] ${message}"
}


function run { 
	assert_is_installed"mysql"
	assert_is_installed"mysqldump"
	assert_is_installed"gzip"
}
