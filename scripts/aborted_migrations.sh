#!/bin/bash

# Aborted migrations:
# Prints all versions inside the `schema_migrations` table that DO NOT
# have a corresponding migration file in ARGV[0].
# These versions can be safely deleted from `schema_migrations` without breaking
# `db/schema.rb` or `db/structure.sql`.
# Usage: `aborted_migrations /path/to/migrations database_name`

MIGRATION_DIR=$1
DATABASE=$2

if ! [[ -d $MIGRATION_DIR ]]; then
  echo "Provide a directory to search for schema migrations"
  exit 1
fi

ALL_VERSIONS=$(mysql -uroot -D$DATABASE -ss -e "SELECT version from schema_migrations")

for version in $ALL_VERSIONS; do
  schema_migration_file=$(find -E $MIGRATION_DIR -regex ".*\/0?0?$version.*" -print | wc -l | tr -d ' ')
  if [[ $schema_migration_file == "0" ]]; then
    echo $version
  fi
done
