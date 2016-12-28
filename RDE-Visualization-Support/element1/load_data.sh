#!/bin/bash

#Bail at first error
set -e

#Open the Network Defintion Zip and find the information for relevant Links
find_network_ids() {
  # File containing the raw links exported from the QGIS spatial query
  links_file="highway_links_manual.geojson"

  #Create the list of our links from the QGIS export
  echo "Link_ID,FromNode,ToNode" > "$links_csv"
  sed -En 's/.*"type": "Feature".*"NO": ([0-9]+).* "FROMNODENO": ([0-9]+).* "TONODENO": ([0-9]+).*/\1,\2,\3/p' "$links_file" >> "$links_csv"
}

#Open zips and extract information
extract_files() {
  local zip_file="$1"
  local out_file="$2"
  local id_flag="$3"
  local fields="$4"

  #Check that the zip is in the working directory
  if [[ ! -f "$zip_file" ]]; then
    echo "$zip_file was not found in your directory. Please follow the README"
    exit 1
  fi

  #Extract the files
  mkdir -p rde
  unzip -j "$zip_file" -d rde

  for file in rde/*; do
    #Check id flag. id=0-->LinkID, id=1-->NodeID, id=2-->DeviceID
    case "$id_flag" in
      "0")
        awk -F ',' 'NR==FNR{a[$1];next} $3 in a' "$links_csv" "$file" | tr -d '\r' | cut -d, -f "$fields" >> "$out_file"
        ;;
    esac
    echo "$file appended"
  done

  rm -rf rde
}

#Set up the data directory
data_dir="data"
mkdir -p "$data_dir"

#Set up the output data files
links_csv="$data_dir/our_links.csv"
simul_link_file="$data_dir/simul_link_highway.csv"
link_spe_file="$data_dir/link_spe_highway.csv"

#Add headers to the output data files
echo "TimeStamp,LinkNo,FromNode,Vol_00" > "$simul_link_file"
echo "ActTime,Link,Sped,Fore,Tail,Head" > "$link_spe_file"

old_ifs="$old_ifs"
IFS=','

#Find the Link and Node IDs associated with our intersections
find_network_ids

#Extract the relevant data from each file
for i in "Simulated_Link_Volumes_text_10_01.zip","$simul_link_file","0","2|3|4|5" \
  "LinkSpeed_Text_2011_10_01.zip","$link_spe_file","0","2|3|6|7|8|9" \
  ; do set -- $i
  # Can't use commas within strings in the above loop or they get interpreted
  # as delimiters for the array... use pipes and replace them with commas
  fields=$(echo "$4" | tr '|' ',')
  extract_files "$1" "$2" "$3" "$fields"
done

IFS="$old_ifs"
