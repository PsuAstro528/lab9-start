# Astro 528 Lab 9
## Exercise 2:  Using a workflow management system

Goals:
- Use a workflow management system

In this exercise, you will inspect three different [Snakemake](https://snakemake.readthedocs.io/en/stable/) scripts.

- Initialize conda
```shell
conda init bash
```
Start a new terminal window for future commands.

-  Install snakemake (minimal version)
```shell
conda activate base
mamba create -c bioconda -c conda-forge -n snakemake snakemake-minimal
```

-  Activate the conda environtment for snakemake
```shell
conda activate snakemake
```

1a.  Change into directory for snakemake_ex1 and inspect its Snakemake file.
What do you predict will happen when you run Snakemake? 

INSERT RESPONCE


1b.  Run snakemake.
```shell
snakemake -c 1
```
How did the files created compare to your prediction?

INSERT RESPONCE


1c.  Delete one of the toml files.  E.g., `rm summary_mu=0_sigma=1.toml`.  
What do you predict will happen when you rerun Snakemake?  

INSERT RESPONCE


1d.  Run snakemake again.
How did the resulting actions compare to your prediction?

INSERT RESPONCE


1e.  Delete one of the csv files.  E.g., `rm summary_mu=0_sigma=1.csv`.  
What do you predict will happen when you rerun Snakemake?  

INSERT RESPONCE


1f.  Run snakemake again.
How did the resulting actions compare to your prediction?

INSERT RESPONCE




2a.  Change into directory for snakemake_ex2 and inspect its Snakemake file.
What do you predict will happen when you run Snakemake?

INSERT RESPONCE


2b.  Run snakemake once.
```shell
snakemake -c 1
```
How did the resulting actions compare to your prediction?

INSERT RESPONCE


2c.  What do you predict will happen if you run Snakemake a second time?

INSERT RESPONCE


2d.  Run snakemake a second time, this time using 4 cores.
```shell
snakemake -c 4
```
How did the resulting actions compare to your prediction?

INSERT RESPONCE


2e.  Delete one of the toml files E.g., `rm neidL2_20231014T150537.toml`
What do you predict will happen when you rerun Snakemake?  

INSERT RESPONCE


2f.  Run snakemake again.
How did the resulting actions compare to your prediction?

INSERT RESPONCE


2g.  Delete one of the fits files E.g., `rm neidL2_20231014T150537.fits`
What do you predict will happen when you rerun Snakemake?  

INSERT RESPONCE


2h.  Run snakemake again.
How did the resulting actions compare to your prediction?

INSERT RESPONCE



3a.  Change into directory for snakemake_ex3 and inspect its Snakemake file.
What do you predict will happen when you run Snakemake?

INSERT RESPONCE


3b.  Run snakemake once.
How did the resulting actions compare to your prediction?

INSERT RESPONCE


3c.  What do you predict will happen if you run Snakemake a second time?

INSERT RESPONCE


3d.  Run snakemake a second time, this time using a separate slurm job for each step of the pipeline by running either.
```shell
snakemake --profile=../profile/open --latency-wait=30
```
or
```shell
snakemake --profile=../profile/open --latency-wait=30
```
How did the resulting actions compare to your prediction?

INSERT RESPONCE


3e.  Change the value of `preprocess_param` in `config.yaml`..  
What do you predict will happen when you rerun Snakemake?  

INSERT RESPONCE


3f.  Run snakemake again.
How did the resulting actions compare to your prediction?

INSERT RESPONCE


3g.  (Optional.  Probably helpful if you're considering using Snakemake for your project.)  
Edit the Snakemake file so that snakemake will generate a csv file for each fits file (e.g., neidL2_20231014T150537.csv).
Try running snakemake with your new script.  If you get an error, try editting your Snakemake file to fix it (just a few times is fine).   


Regardless of which step you reach before moving on to the final exercise, commit and push your changes to the ex1.md, ex2.md, ex3.md, snakemake_ex2/config.yaml and snakemake_ex3/Snakefile.


