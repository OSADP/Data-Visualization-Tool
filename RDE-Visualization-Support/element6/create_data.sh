#!/bin/bash

# Bail at first error
set -e

init_file() {
    local file="$1"
    local header="$2"

    if [[ ! -e "$file" ]]; then
        echo "$header" > "$file"
    fi
}

sample_file() {
    local infile="$1"
    local outfile="$2"
    local vehicle_id="$3"
    local vehicle_id_col="$4"
    local min_time="$5"
    local min_time_col="$6"
    local max_time="$7"
    local max_time_col="$8"

    awk -F, -v vehicle_id="$vehicle_id" -v vehicle_id_col="$vehicle_id_col" -v min_time="$min_time" -v min_time_col="$min_time_col" -v max_time="$max_time" -v max_time_col="$max_time_col" -f 'subset.awk' "$infile" | tr -d "\r" >> "$outfile"

    echo "Finished extracting $infile to $outfile."
}

# Make sure the user passed the correct arguments
if [[ $# -ne 0 ]]; then
    echo "Usage: ./create_data.sh"
    echo "Simply use the command ./create_data.sh"
fi

bsm_dir="BSM_FILES"
out_dir="data"

mkdir -p "$out_dir"


old_ifs="$IFS"
IFS=','
for i in \
    "$out_dir/bsm_p1.csv","$bsm_dir/april_BsmP1.csv","$bsm_dir/BsmP1.csv.zip","1","1566","4","291864241884364","4","291865130584320","RxDevice|FileId|TxDevice|GenTime|TxRandom|MsgCount|DSecond|Latitude|Longitude|Elevation|Speed|Heading|Ax|Ay|Az|Yawrate|PathCount|RadiusOfCurve|Confidence" \
    "$out_dir/BrakeByte1.csv","$bsm_dir/BrakeByte1Events.csv","$bsm_dir/BrakeByte1Events.csv.zip","1","11","4","292784986346466","5","292790448511562","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/TripSummaryNew.csv","$bsm_dir/Trip_Summary_File_BsmP1_April.csv","$bsm_dir/BsmP1Summary.csv.zip","1","11","3","-1","6","-1","DeviceID|TripID|EpochStartTime|StartDate|StartTime|EpochEndTime|EndDate|EndTime|TotalTripDistance|DistanceOver25MPH|DistanceOver55MPH|TripDuration|AverageSpeed|MaximumSpeed" \
    "$out_dir/ExteriorLightsEvents.csv","$bsm_dir/ExteriorLightsEvents.csv","$bsm_dir/ExteriorLightsEvents.csv.zip","1","87","4","292763301284190","5","292806497633615","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/bsm_posaccurbyte1.csv","$bsm_dir/PosAccurByte1Events.csv","$bsm_dir/PosAccurByte1Events.csv.zip","1","15501","4","293466234364067","5","293552634364067","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/bsm_posaccurbyte2.csv","$bsm_dir/PosAccurByte2Events.csv","$bsm_dir/PosAccurByte2Events.csv.zip","1","15501","4","293466226664071","5","293552626664071","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/bsm_posaccurbyte3.csv","$bsm_dir/PosAccurByte3Events.csv","$bsm_dir/PosAccurByte3Events.csv.zip","1","15501","4","293466226664071","5","293552626664071","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/bsm_posaccurbyte4.csv","$bsm_dir/PosAccurByte4Events.csv","$bsm_dir/PosAccurByte4Events.csv.zip","1","15501","4","293466223064080","5","293552623064080","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/bsm_steerangle.csv","$bsm_dir/SteerAngleEvents.csv","$bsm_dir/SteerAngleEvents.csv.zip","1","10","4","276176189642801","5","276177186343373","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/ThrottlePositionEvents.csv","$bsm_dir/ThrottlePositionEvents.csv","$bsm_dir/ThrottlePositionEvents.csv.zip","1","82","4","292762913370720","5","292763056610625","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/TransStateEvents.csv","$bsm_dir/TransStateEvents.csv","$bsm_dir/TransStateEvents.csv.zip","1","87","4","292763301284190","5","292803629978980","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    "$out_dir/WiperStatus.csv","$bsm_dir/WiperStatusFrontEvents.csv","$bsm_dir/WiperStatusFrontEvents.csv.zip","1","62","4","292736266384845","5","292766657344748","RxDevice|FileId|TxDevice|StartTime|Endtime|Value" \
    ; do set -- $i

    outfile="$1"
    infile="$2"
    zipfile="$3"
    vehicle_id_col="$4"
    vehicle_id="$5"
    min_time_col="$6"
    min_time="$7"
    max_time_col="$8"
    max_time="$9"
    header="${10}"

    # only unzip the file if we haven't already
    if [[ ! -e "$infile" ]]; then
        7za e -o"$bsm_dir" "$zipfile"
    fi

    # only sample the file if we haven't already
    if [[ ! -e "$outfile" ]]; then
        echo "$header" | tr '|' ',' > "$outfile"
        sample_file "$infile" "$outfile" "$vehicle_id" "$vehicle_id_col" "$min_time" "$min_time_col" "$max_time" "$max_time_col"
    fi
done

IFS="$old_ifs"
