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
The above steps only need to be done once (on Roar Collab).

-  Activate the conda environtment for snakemake
```shell
conda activate snakemake
```
You'll need to repeate this step in each terminal window (when you want to be able to run snakemake).  

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
What do you predict would happen when you run Snakemake?

INSERT RESPONCE

If you think it would run successfully to completion, then try it and see.  Then explain why it didn't.


2b.  We can tell snakemake to run only until it reaches a specified rule or file. 
In this case, we'll first tell snakemake to run until the download rule.  And then we can run it a second time to complete the analysis.
What do you predict would happen when you run Snakemake adding the `--until download` option?
Run snakemake, but limiting it to stop after the download rule.
```shell
snakemake -c 1 --until download
```
How did the resulting actions compare to your prediction?

INSERT RESPONCE


2c.  What do you predict will happen if you run Snakemake a second time (without an until option)?

INSERT RESPONCE


2d.  Run snakemake a second time, this time using 4 cores and letting it run to completion.
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
What do you predict will happen when you run Snakemake twice, first specifying `until download` and the second time letting it run to completion?

INSERT RESPONCE


3b.  Run snakemake once.
```shell
snakemake -c 1 --until download
```
How did the resulting actions compare to your prediction?

INSERT RESPONCE


3c.  What do you predict will happen if you run Snakemake a second time?
 
INSERT RESPONCE


3d.  Run snakemake a second time, this time using a separate slurm job for each step of the pipeline by running either.
```shell
snakemake --profile=../profile/open --latency-wait=30
```
If you find your job is sitting in the open queue for more than ~10 minutes, then you you could try submitting to our classroom allocation.
```shell
snakemake --profile=../profile/sla --latency-wait=30
```
How did the resulting actions compare to your prediction?

INSERT RESPONCE


3e.  Change the value of `preprocess_param` in `config.yaml`..  
What do you predict will happen when you rerun Snakemake?  

INSERT RESPONCE


3f.  Run snakemake again.
How did the resulting actions compare to your prediction?

INSERT RESPONCE


3g.  (Optional.  Hopefully helpful if you're considering using Snakemake for your project.)  
Edit the Snakemake file so that snakemake will generate a csv file for each fits file (e.g., neidL2_20231014T150537.csv).
Try running snakemake with your new script.  If you get an error, try editting your Snakemake file to fix it (just a few times is fine).   


Regardless of which step you reach before moving on to the final exercise, commit and push your changes to the ex1.md, ex2.md, ex3.md, snakemake_ex2/config.yaml and snakemake_ex3/Snakefile.


