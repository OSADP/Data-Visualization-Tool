# Element 4 - Impact of Interventions

## Getting the Data
Head to [the RDE](https://www.its-rde.net/) and make an account. Then navigate to [the MMITSS data environment](https://www.its-rde.net/data/showds?dataEnvironmentNumber=10019) and download the following datasets:

 - Basic Safety Message
   * `bsm_mar03_15_AM_asd_veh1233.zip`
   * `bsm_mar03_15_AM_truck34_log_02_03_15_07_41.csv.zip`
   * `bsm_mar0315_PM_transit35.zip`
   * `bsm_mar0315_PM_truck33.zip`
   * `bsm_mar04_2015_asd_vehicle.zip`
   * `bsm_mar04_2015_obe_vehicle.zip`
 - GPS
   * `2015_03_03_GPS.zip`
   * `2015_03_04_GPS.zip`

Place the zips from the "Basic Safety Message" dataset into the `BSM` directory; place the zips from the "GPS" dataset into the `GPS` directory.

## Running the Scripts

The script to generate the data is a bash script, which should run without a problem on Linux;  Windows users will need to provide a POSIX-like environment by installing something like [Cygwin](https://www.cygwin.com/).  The script uses the GNU version of awk (`gawk`), while OS X has the BSD version installed by default; OS X users will need to install the GNU version.  For example, using [homebrew](http://brew.sh/): `brew install gawk`

Run `./create_data.sh`.  This will populate the `data/` directory with subsetted and cleaned data for the visualization.
