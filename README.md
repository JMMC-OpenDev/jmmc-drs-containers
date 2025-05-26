# jmmc-containers
Recipes and source to build containers

This is a work in progress repo starting with experiment to try reductions with various versions of PNDRS

Integration has not yet been finished but you can use next command for a first execution.
## Launch a container
```bash
docker run -it -v /your/path/to/raw_data_parentdir/:/data/ pndrs:latest
```

## Execute reduction inside the container
```bash
export INTROOT=/pionier/pndrs_v3.94 
export PATH=$INTROOT/bin:$INTROOT/yorick/bin:$PATH
cd /data/2013-08-10
pndrsReduce -calibrate | tee -a "pnlog.txt.$(date +%s)"
```

INTROOT will define the path of pndrs version to use. You can ls /pionier to have a look on various versions. Enter the raw data directory and launch the reductions. Reduced and calibrated data will be generated in /data/YOUR_DATE_vNNN_* directories.

Tips: check or remove pnlog.fits that may break process with various versions.







