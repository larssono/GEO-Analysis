#INCOMING PARAMETERS: $1-Configuration file path
#                     $2-Sample ID, 
#                     $3-Sample File Name
#                     $4-Full path to provenance configuration file
#                     $5-Synapse ID for Process A (the calling script)

######## Load configuration file

source $1 $1 $2 $3
source $4 $5 $1 

######## Run Scripts (see configuration file for script names - C, D, and E)

echo
echo Processing $ID_SAMPLE
echo

######## Provenance of input file

$DIR_SCRIPT_PROV/create_provenance.sh -an "$B_ACTIVITY_NAME" -en "$B_ENTITY_NAME" -ep "$B_ENTITY_PATH" -ed "$B_ENTITY_DESC" -fn "$B_SYN_DIR" -pn "$SYN_PROJECT_NAME" $B_UPLOAD

echo ***************************** WARNING: sra -> fastq HAS BEEN DISABLED

#$SHELL_SRA_TO_FASTQ
$SHELL_FASTQ_TO_BAM
$SHELL_BAM_TO_COUNT

