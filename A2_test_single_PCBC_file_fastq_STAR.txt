DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts

SHELL_CONFIG=$DIR_SCRIPT/2config_fastq_to_count_by_STAR.sh
SHELL_PROCESS_SINGLE_FILE=$DIR_SCRIPT/B_process_single_file.sh

$SHELL_PROCESS_SINGLE_FILE $SHELL_CONFIG H9.102.2.5 run0102_lane2_read1_index5\=H9-P37T7-1.fastq.gz

