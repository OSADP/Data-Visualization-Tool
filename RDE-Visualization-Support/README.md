## RDE-Visualization-Support
Support scripts for the [RDE Visualization Website](https://github.com/FHWA/RDE-Visualization-Website).  This repository contains all scripts and data (or instructions to download the data) used to generate the final data files for each visualization.  An overview of the process for each element follows; each element's subfolder contains a README with more detailed instructions.

### Element 1
Subsets simulated link volume and speed for roads in the Pasadena, CA network.

Requirements: bash shell, sed, awk.

### Element 2

Filters Basic Safety Messages (BSMs) transmitted by vehicles and recorded by roadside equipment (RSE) down to a 500m radius around a single RSE in the Safety Pilot Model Deployment in Ann Arbor, MI.

Requirements: Python 3, Jupyter Notebook.

### Element 3

Filters and downsamples weather data recorded by weather stations and snowplows in Minnesota during a blizzard.

Requirements: Python 3, Jupyter Notebook, Node.js.

### Element 4

Filters and aggregates vehicle BSM and GPS data to examine the effect of Multi-Modal Intelligent Traffic Signal Systems (MMITSS) on delay at an intersection in Anthem, AZ.

Requirements: bash shell, GNU awk.

### Element 5

Joins metadata files exported from the RDE.

Requirements: Python 3.

### Element 6

Samples data files from the Safety Pilot Model Deployment in Ann Arbor, MI.

Requirements: bash shell, awk, 7zip command line client (`7za`).
