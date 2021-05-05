# Artifact Evaluation - On the Convolution Efficiency for probabilistic analysis of real-time systems

This directory contatins the MATLAB scripts and functions that were used for implementing
the contributions and evaluation from our paper accepted at ECRTS 2021, titled
"On the Convolution Efficiency for ProbabilisticAnalysis of Real-Time Systems".


## PREREQUISITES: 

- Matlab version R2020b and above
- Advanpix toolbox

To run the functions, you need to install ADVANPIX toolbox and add it in your Matlab path.

Here is the download instructions page for Advanpix:
https://www.advanpix.com/download/

Here is the user manual page for Advanpix:
https://www.advanpix.com/documentation/users-manual/


## BEFORE RUNNING THE SCRIPTS:

Before running any script, first import "On the Convolution Efficiency" directory to Matlab, and
then righ-click on the directory within Matlab's **Current folder** view. From the given
options, select **Add to path** ---> **Selected Folders and Subfolders**.


## RERUNING THE EXPERIMENTS:

Experiments are available in directory **On the Convolution Efficiency/experiments**.
There are three subdirectories, for each experiment from the paper 
(available in Sections 5.1, 5.2, and 5.3).
Run, one by one, the following scripts
"downsampling.m", "linearVScircular.m", and "deadlinemissProb.m".
After finishing, the three subdirectories will be filled with images that represent
the experiment results.


## STRUCTURE OF THE ARTIFACT:

The parent directory **On the Convolution Efficiency** contains the following sub-directories:

- **convolution algorithms**: placeholder for circular and linear algorithms that are presented
                          in the paper.

- **deadline-miss module**: placeholder for functions that contribute to the deadline-miss
                        probability computations.

- **deadline-miss SOTA**: placeholder for the Hoeffding and Bernstein inequality bounds
                      as adjusted by von der Brüggen et al. at ECRTS 2018

- **down-sampling algorithms**: placeholder for the proposed down-sampling algorithms
                            optimal (Algorithm 1) and linear (Algorithm 2) from the paper,
                            and other functions used for their development.

- **down-sampling SOTA**: placeholder for SOTA algorithms (Domain Quantisation, Pessimism Reduce)
                      and other functions used for their development.

- **experiments**: placeholder for the experiments performed in the evaluation
               of our paper.

- **response-time analysis**: placeholder for the worst-case deterministic response-time analysis
                          and other functions used for its development.

- **taskset-generation**: placeholder for functions that generate evaluated tasksets



## UNIT TESTING

Unit testing scripts are presented within each module individualy, starting with prefix "test_...".

## NOTE!

If you want to see the documentation of the provided functions within the code, right-click on the
desired function and then choose the option "Help on **function name**".
Code is commented, although it can be commented better and to the greater extent.
We will continue working on this.

In case you find bugs/errors or if you want to contribute, e-mail us at:

- Filip Markovic: filip.markovic@mdh.se
- Alessandro Vittorio Papadopoulos: alessandro.papadopoulos@mdh.se
- Thomas Nolte: thomas.nolte@mdh.se



