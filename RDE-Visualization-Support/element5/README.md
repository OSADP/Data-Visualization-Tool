### Element 5 Data Preparation

This directory contains the script and source data needed to recreate Element 5.

#### Setup
The only required software is [Python 3](https://www.python.org/downloads/).  Once installed, run `pip install -r requirements.txt` in this directory to install required libraries.

All necessary source data is included in the repository; `data environments and data sets.csv` and `tags and datasets.csv` are dumps of RDE metadata provided by the maintainers of the RDE.

Also note the included `data/locations.csv`; this is a manually compiled mapping from location names in the RDE metadata file to latitude/longitude coordinates, used to place each location on a map.

#### Running the Script
Run `python make_data.py`.  This will join the two files, rename some columns, and generate `data/rde.csv`, which is the base file used for the visualization.
