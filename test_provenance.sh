######## Load configuration file

DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts

SHELL_CONFIG=$DIR_SCRIPT/3config_sra_to_count_by_STAR.sh
SHELL_PROCESS_SINGLE_FILE=$DIR_SCRIPT/B_process_single_file.sh

source $SHELL_CONFIG $SHELL_CONFIG SRR445718 SRR445718.sra

######## Additional parameters

PROJECT_NAME='Stem Cell Data Processing Project'
FOLDER_NAME='Data/RNA Seq Test/sra'
ENTITY_PATH=$PATH_SRA
ENTITY_DESCRIPTION=
ACTIVITY_NAME='Load data'
ACTIVITY_DESCRIPTION=
PROGRAM_NAME=
PROGRAM_VERSION=

echo $ENTITY_PATH
######## Save provenance (input file - sar)
echo ./create_provenance.sh -an "$ACTIVITY_NAME" -ep "$ENTITY_PATH" -fn "$FOLDER_NAME" -pn "$PROJECT_NAME"
./create_provenance.sh -an "$ACTIVITY_NAME" -ep "$ENTITY_PATH" -fn "$FOLDER_NAME" -pn "$PROJECT_NAME"

#./create_provenance.sh -ad $ACTIVITY_DESCRIPTION -an $ACTIVITY_NAME -ed $ENTITY_DESCRIPTION -ep $ENTITY_PATH -fn $FOLDER_NAME -pn $PROJECT_NAME -progn $PROGRAM_NAME -progv $PROGRAM_VERSION

