##INCOMING PARAMETERS: 1-Configuration file path, 2-Sample ID, 3-Sample Path

######## Load configuration fileS

source $1 $1 $2 $3
source $4

######## Run Scripts (see configuration file for script names - C, D, and E)

echo
echo Processing $ID_SAMPLE
echo

######## Provenance of input file

#### Provenance parameters

#PROJECT_NAME='Stem Cell Data Processing Project'
#FOLDER_NAME='Data/RNA_Seq_Test/sra'
#ENTITY_PATH=$PATH_SRA
#ENTITY_DESCRIPTION=
#ACTIVITY_NAME='Load data'
#ACTIVITY_DESCRIPTION=
#PROGRAM_NAME=
#PROGRAM_VERSION=
#IN_SYNAPSE=0

#### Save provenance (input file - sar)
echo Saving input provenance is currently disabled
#$DIR_SCRIPT_PROV/create_provenance.sh -an "$B_ACTIVITY_NAME" -ep "$PATH_SRA" -fn "$SYN_DIR_SRA" -pn "$SYN_PROJECT_NAME" #-store_in_synapse $IN_SYNAPSE


######## Provenance of process
$DIR_SCRIPT_PROV_C
$DIR_SCRIPT_PROV_D
$DIR_SCRIPT_PROV_E

#Original processing code
#
#$SHELL_SRA_TO_FASTQ
#$SHELL_FASTQ_TO_BAM
#$SHELL_BAM_TO_COUNT

