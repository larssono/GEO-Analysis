######## Provenance of input file

DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts
source DIR_SCRIPT_PROV=/work/DAT_114__PCBC_Data/Scripts/Provenance

SHELL_CONFIG=$DIR_SCRIPT/3config_sra_to_count_by_STAR.sh
SHELL_PROCESS_PROV_B=$DIR_SCRIPT_PROV/B_process_single_file_PROVENANCE.sh

SHELL_PROCESS_PROV_B $SHELL_CONFIG SRR445718 SRR445718.sra
#Original processing code
#
#DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts
#
#SHELL_CONFIG=$DIR_SCRIPT/3config_sra_to_count_by_STAR.sh
#SHELL_PROCESS_SINGLE_FILE=$DIR_SCRIPT/B_process_single_file.sh
#
#$SHELL_PROCESS_SINGLE_FILE $SHELL_CONFIG SRR445718 SRR445718.sra
