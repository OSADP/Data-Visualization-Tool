# Element 6 - Breadth and Depth of Connected Vehicle Data

## Getting the Data
Head to [the RDE](https://its-rde.net/) and make an account.  Then navigate to [the BSM data set in the SPMD data environment](https://www.its-rde.net/data/showdf?dataSetNumber=10178) and download the following files:

 - BrakeByte1Events
 - BsmP1
 - BSM Trip Summary
 - ExteriorLightsEvents
 - PosAccurByte1Events
 - PosAccurByte2Events
 - PosAccurByte3Events
 - PosAccurByte4Events
 - SteerAngleEvents
 - ThrottlePositionEvents
 - TransStateEvents
 - WiperStatusFrontEvents

Place the resulting zip files into the `BSM_FILES` directory.

## Running the Scripts

The script to generate the data is a bash script, which should run without a problem on Linux and OSX;  Windows users will need to provide a POSIX-like environment by installing something like [Cygwin](https://www.cygwin.com/).  The script uses the command line interface for [7zip](http://7-zip.org), as we were unable to extract some of the zip files with the OS X version of `unzip`.

Installing the `7za` command line client:

 - OS X: via [homebrew](http://brew.sh/): `brew install p7zip`
 - Linux (Debian, Ubuntu, Mint): `sudo apt-get install p7zip-full`
 - Linux (Fedora, CentOS, RHEL): `sudo yum install p7zip-full`
 - Windows: Download [here](http://www.7-zip.org/download.html)

Run `./create_data.sh`.  This will populate the `data/` directory with subsetted and cleaned data for the visualization.  Note that some of the files are extremely large (the output of unzipping `BsmP1.csv.zip` by itself is over 300 GB), so a large amount of disk space will be necessary to store the extracted files, and processing the larger files will take a fair bit of time as well (on the order of 30 mins to an hour, depending on your computer).

### Cleaning Details

Using the bash script, we've culled each file to a single device ID in a single representative time span.  Some details on this process are below. 

 - `data/bsm_p1.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #1566) and a representative time span (in this particular file, from GenTime 291864241884364 to GenTime 291865130584320)
- `data/TripSummaryNew.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #11) and covers a limited, representative time span (in this particular file, from EpochStartTime 1364842106 to EpochEndTime 1367368552)
- `data/bsm_posaccurbyte1.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #15501) and covers a limited, representative time span (in this particular file, from StartTime 293466234364067 to EndTime 293467226663928)
- `data/bsm_posaccurbyte2.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #15501) and covers a limited, representative time span (in this particular file, from StartTime 293466226664071 to EndTime 293467226663928)
- `data/bsm_posaccurbyte3.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #15501) and covers a limited, representative time span (in this particular file, from StartTime 293466226664071 to EndTime 293467226663928)
- `data/bsm_posaccurbyte4.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #15501) and covers a limited, representative time span (in this particular file, from StartTime 293466223064080 to EndTime 293466496063419)
- `data/BrakeByte1.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #11) and covers a limited, representative time span  (in this particular file, from StartTime 292784986346466 to EndTime 292790448511562)
- `data/bsm_steerangle.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #10) and covers a limited, representative time span  (in this particular file, from StartTime 276176189642801 to EndTime 276177186343373)
- `data/ExteriorLightsEvents.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #87) and covers a limited, representative time span  (in this particular file, from StartTime 292780035494795 to EndTime 292806339899799)
- `data/ThrottlePositionEvents.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #82) and covers a limited, representative time span  (in this particular file, from StartTime 292762913370720 to EndTime 292763056610625)
- `data/TransStateEvents.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #87) and covers a limited, representative time span  (in this particular file, from StartTime 292763301284190 to EndTime 292803629978980)
- `data/WiperStatus.csv`: Data has been culled to a single RxDevice (in this particular file, to RxDevice #62) and covers a limited, representative time span  (in this particular file, from StartTime 292736266384845 to EndTime 292766657344748)