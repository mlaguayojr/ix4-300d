#!/bin/bash
# Mario Aguayo
# 12/29/2022

# Walk through all directories (nested as well) and collect the following information
#  - file_name: name of file
#  - md5: md5 checksum of file
#  - bytes: file size in bytes

# rename existing file if it exists
directory="./Automations"
file="$directory/md5sum.json"
log_directory="$directory/logs"

# make directory if path does not exist
if [ ! -d "$log_directory" ]; then
  mkdir "$log_directory"
fi

# archive last run
if [ -f "$file" ]; then
  mv "$file" "$log_directory/md5sum_$(date +%Y_%m_%d).json"
fi

write_to_log(){
  checksum=$(md5sum "$1" | cut -d ' ' -f 1)
  bytes=$(stat -c '%s' "$1")
  echo "{ \"file_name\": \"$1\", \"md5\": \"${checksum}\", \"bytes\": ${bytes} },"
}

#create file
touch "$file"
echo "[" > "$file"

export -f write_to_log
find -type f -exec bash -c "write_to_log \"{}\"" \; >> "$file"

# remove last ,
truncate -s-2 "$file"

#close file
echo "" >> "$file"
echo "]" >> "$file"
