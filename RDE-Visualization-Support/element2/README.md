### Element 2 Data Preparation

This directory contains the scripts needed to recreate the data used in Element 2.

####Environment Setup

#####Jupyter Notebooks

Some of the scripts are contained in [Jupyter Notebooks](http://jupyter.org/index.html).  You'll first need to [install Jupyter](http://jupyter.readthedocs.io/en/latest/install.html) for **Python 3, NOT Python 2** using either Anaconda or pip.

Once that's done, run `pip3 install -r requirements.txt` from this directory to install Python dependencies.


####Obtaining Source Data
First you will need to download the following datasets from RDE.  You will need to make an account before downloading any data.

1. `Basic Safety Message` : [BsmP1 file](https://www.its-rde.net/data/showdf?dataSetNumber=10178)
2. `Roadside Equpment` : [BSM file](https://www.its-rde.net/data/showdf?dataSetNumber=10182)

Once you have downloaded you should have two zip files.  Unzip both the files.  Inside each zip should be one folder.  Place both folders into this directory.

####Running the Scripts

#####Data

Start a Jupyter Notebook server from this directory using the `jupyter notebook` command.  You should then be able to select the `Element 2 - DownSample` notebook and run it all the way through.  It will populate `data/` with several data files.  The most imporant of which will be `data/p1_latlon_min.csv`, `data/rse_latlon_min.csv`, and `data/heat.csv`.  These three files are used in the Element 2 visualization.
