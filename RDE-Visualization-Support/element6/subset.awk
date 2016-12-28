{
    # Special value of -1 means don't filter on that value
    if (($vehicle_id_col == vehicle_id || vehicle_id == -1) \
        && ($min_time_col >= min_time || min_time == -1) \
        && ($max_time_col <= max_time || max_time == -1)) {
        print $0;
    }
}
