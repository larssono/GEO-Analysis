##INCOMING PARAMETERS: 1-Configuration file path, 2-Sample ID, 3-Sample Path

######## Load configuration fileS

source $1 $1 $2 $3
source $4 $5

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
$DIR_SCRIPT_PROV/create_provenance.sh -an "$B_ACTIVITY_NAME" -ep "$B_ENTITY_PATH" -ed "$B_ENTITY_DESC" -fn "$B_SYN_DIR" -pn "$SYN_PROJECT_NAME" $B_UPLOAD


######## Provenance of process
$DIR_SCRIPT_PROV_C
$DIR_SCRIPT_PROV_D
$DIR_SCRIPT_PROV_E

#Original processing code
#
#$SHELL_SRA_TO_FASTQ
#$SHELL_FASTQ_TO_BAM
#$SHELL_BAM_TO_COUNT

