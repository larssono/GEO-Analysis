#INCOMING PARAMETERS: 1-Configuration file path, 2-Sample ID, 3-Sample Path

######## Load configuration file

source $1 $1 $2 $3

######## Provenance of input file

######## Run Scripts (see configuration file for script names - C, D, and E)

echo
echo Processing $ID_SAMPLE
echo

echo WARNING: sra -> fastq HAS BEEN DISABLED
echo WARNING: fastq -> bam HAS BEEN DISABLED

#$SHELL_SRA_TO_FASTQ
#$SHELL_FASTQ_TO_BAM
$SHELL_BAM_TO_COUNT

