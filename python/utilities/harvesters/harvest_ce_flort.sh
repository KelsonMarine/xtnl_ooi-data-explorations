#!/usr/bin/env bash
#
# harvest_ce_flort.sh
#
# Harvest the FLORT data from all of the OOI Coastal Endurance moorings. Data
# sets include telemetered and recovered host and recovered instrument data
# (for the inshore moorings only). Data is downloaded from OOI Net and reworked
# to create a cleaner and more consistent set of files named and organized by
# the mooring, mooring sub-location, data delivery method and deployment.
#
# C. Wingard, 2019-07-22 -- Initial code

# set the base directory python command for all subsequent processing
. $(dirname $CONDA_EXE)/../etc/profile.d/conda.sh
conda activate ooi
PYTHON="python -m ooi_data_explorations.uncabled.process_flort"

### CE01ISSM ###
BUOY_FLAGS="-s CE01ISSM -n SBD17 -sn 06-FLORTD000"
BUOY_FILE="${HOME}/ooidata/m2m/ce01issm/buoy/flort/ce01issm.buoy.flort"
NSIF_FLAGS="-s CE01ISSM -n RID16 -sn 02-FLORTD000"
NSIF_FILE="${HOME}/ooidata/m2m/ce01issm/nsif/flort/ce01issm.nsif.flort"
for i in $(seq -f "%02g" 1 15); do
    $PYTHON $BUOY_FLAGS -mt telemetered -st flort_sample -dp $i -o "$BUOY_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $BUOY_FLAGS -mt recovered_host -st flort_sample -dp $i -o "$BUOY_FILE.deploy$i.recovered_host.flort_sample.nc"
    $PYTHON $BUOY_FLAGS -mt recovered_inst -st flort_sample -dp $i -o "$BUOY_FILE.deploy$i.recovered_inst.flort_sample.nc"

    $PYTHON $NSIF_FLAGS -mt telemetered -st flort_sample -ba -dp $i -o "$NSIF_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $NSIF_FLAGS -mt recovered_host -st flort_sample -ba -dp $i -o "$NSIF_FILE.deploy$i.recovered_host.flort_sample.nc"
done

### CE02SHSM ###
BASE_FLAGS="-s CE02SHSM -n RID27 -sn 02-FLORTD000"
BASE_FILE="${HOME}/ooidata/m2m/ce02shsm/nsif/flort/ce02shsm.nsif.flort"
for i in $(seq -f "%02g" 1 13); do
    $PYTHON $BASE_FLAGS -mt telemetered -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $BASE_FLAGS -mt recovered_host -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.recovered_host.flort_sample.nc"
done

### CE04OSSM ###
BASE_FLAGS="-s CE04OSSM -n RID27 -sn 02-FLORTD000"
BASE_FILE="${HOME}/ooidata/m2m/ce04ossm/nsif/flort/ce04ossm.nsif.flort"
for i in $(seq -f "%02g" 1 12); do
    $PYTHON $BASE_FLAGS -mt telemetered -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $BASE_FLAGS -mt recovered_host -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.recovered_host.flort_sample.nc"
done

### CE06ISSM ###
BUOY_FLAGS="-s CE06ISSM -n SBD17 -sn 06-FLORTD000"
BUOY_FILE="${HOME}/ooidata/m2m/ce06issm/buoy/flort/ce06issm.buoy.flort"
NSIF_FLAGS="-s CE06ISSM -n RID16 -sn 02-FLORTD000"
NSIF_FILE="${HOME}/ooidata/m2m/ce06issm/nsif/flort/ce06issm.nsif.flort"
for i in $(seq -f "%02g" 1 14); do
    $PYTHON $BUOY_FLAGS -mt telemetered -st flort_sample -dp $i -o "$BUOY_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $BUOY_FLAGS -mt recovered_host -st flort_sample -dp $i -o "$BUOY_FILE.deploy$i.recovered_host.flort_sample.nc"
    $PYTHON $BUOY_FLAGS -mt recovered_inst -st flort_sample -dp $i -o "$BUOY_FILE.deploy$i.recovered_inst.flort_sample.nc"

    $PYTHON $NSIF_FLAGS -mt telemetered -st flort_sample -ba -dp $i -o "$NSIF_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $NSIF_FLAGS -mt recovered_host -st flort_sample -ba -dp $i -o "$NSIF_FILE.deploy$i.recovered_host.flort_sample.nc"
done

### CE07SHSM ###
BASE_FLAGS="-s CE07SHSM -n RID27 -sn 02-FLORTD000"
BASE_FILE="${HOME}/ooidata/m2m/ce07shsm/nsif/flort/ce07shsm.nsif.flort"
for i in $(seq -f "%02g" 1 13); do
    $PYTHON $BASE_FLAGS -mt telemetered -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $BASE_FLAGS -mt recovered_host -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.recovered_host.flort_sample.nc"
done

### CE09OSSM ###
BASE_FLAGS="-s CE09OSSM -n RID27 -sn 02-FLORTD000"
BASE_FILE="${HOME}/ooidata/m2m/ce09ossm/nsif/flort/ce09ossm.nsif.flort"
for i in $(seq -f "%02g" 1 13); do
    $PYTHON $BASE_FLAGS -mt telemetered -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.telemetered.flort_sample.nc"
    $PYTHON $BASE_FLAGS -mt recovered_host -st flort_sample -ba -dp $i -o "$BASE_FILE.deploy$i.recovered_host.flort_sample.nc"
done
