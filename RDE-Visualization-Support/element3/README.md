### Element 3 Data Preparation

This directory contains the scripts needed to prepare the data to recreate Element 3.

####Environment Setup

#####Jupyter Notebook

The scripts are contained in [Jupyter Notebooks](http://jupyter.org/index.html).  You'll first need to [install Jupyter](http://jupyter.readthedocs.io/en/latest/install.html) for **Python 3, NOT Python 2** using either Anaconda or pip.

Once that's done, run `pip3 install -r requirements.txt` from this directory to install Python dependencies.

#####Node

Another data generation script is written using [Node.js](https://nodejs.org).  To run it, you will first need to [install Node and npm](http://blog.npmjs.org/post/85484771375/how-to-install-npm).

Once that's done, run `npm install` to install all dependencies.

####Obtaining Source Data
First you will need to download the following data from the RDE and WxDE.  Both sites require you to make an account before downloading any data.

1. `Minnesota DOT Mobile Observation data` : [Archive data](https://www.its-rde.net/data/showdf?dataSetNumber=10172)
  * All of the files between **2014-02-19 00-00-00 2014-02-19 08-27-25.zip** through **2014-02-22 20-14-37 2014-02-22 23-59-59.zip**
  * There will be 37 files in total.  The RDE will prompt you to download a zip file containing all 37 files.
  * Once downloaded there will be 37 zips files and two documents.  Each zip file contains a single data file.  Unzip all 37 zip files and place the data files within them into the `RDE` folder inside this directory.  Do not place the zip files themself or the two extra text files.
2. `WxDE Minnesota Weather Data` : [Start Here](https://wxde.fhwa.dot.gov/) Follow the steps
	1. Data drop-down --> Observations --> Contributor
	2. Select MN\_State\_DOT from the list, press the `>>` button, then press `Next Page`
	3. Select all options of the following `MN_State_DOT, P, XXX-XXX, 0` from the list, press the `\/` button, then press `Next Page`
		* Where XXX-XXX is some combination of numbers
		* The second field `P` is the important thing to look for, just add everything that has `P`
	4. Leave the drop-down on `All Observations` and press `Run Report`
	5. Now select the start and end date/time.  At the begining start with `Start Date: 2/19/2014 -- Start Time: 0000` and `End Date: 2/19/2014 -- End Time: 0006`  Then press `Download`.  You will be prompted to save the file.  Choose the WxDE folder inside this directory.
	  * Next you must download each 6 hour segment for the entire time period.  This means increasing the start/stop time by 6hours until the entire segment is downloaded.
		* 2/19 0000 - 2/19 0006
		* 2/19 0006 - 2/19 0012
		* 2/19 0012 - 2/19 0018
		* 2/19 0018 - 2/20 0000
		* 2/20 0000 - 2/20 0006
		*  ......
		* 2/22 0018 - 2/23 0000
		* You will end with 16 files.

Now that you have all the files downloaded and placed into the correct directories you can start running the scripts to prepare the data for Element 3.  

####Running the Scripts

Start a Jupyter Notebook server from this directory using the `jupyter notebook` command.  You should then be able to select each notebook and run it all the way through.

First run `Element 3 - Data Preparation`.  This will place a sqlite database into this directory.

Finally run `Element 3 - Down Sample`.  This will create four files in the data folder.  These four files are used in the Element 3 visualization.

#####Minnesota Vertices

There is also a script called `vertex_generation.js` which was used to generate `large3_vertex_variable.js` for Element 3.  This script generates a large number of points inside the bounds of Minnesota so that we could create a smoother extrapolation area for the weather data.

To run this script (assuming npm and all required dependencies are installed), simply run `npm run build`.  It will take a little while (~20 minutes).