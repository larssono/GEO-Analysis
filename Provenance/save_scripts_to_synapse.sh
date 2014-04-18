A1_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A2_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A3_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A4_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A5a_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A5b_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A5c_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
A5d_DESCRIPTION="First level script - contains file name(s) and ID(s) to process"
B_DESCRIPTION="Second level script - complete process for single file"
C_DESCRIPTION="Converts sra file to fastq file"
D1_DESCRIPTION="Converts fastq file to bam"
D2_DESCRIPTION="Converts fastq file to bam"
E_DESCRIPTION="Converts bam to bed"
CONFIG_1_DESCRIPTION="Configuration file for entire process - USED WITH A1"
CONFIG_2_DESCRIPTION="Configuration file for entire process - USED WITH A2"
CONFIG_3_DESCRIPTION="Configuration file for entire process - USED WITH A3, A4, AND all A5"

SCRIPT_DIR=/work/DAT_114__PCBC_Data/Scripts

A1_FILE=A1_test_single_PCBC_file_fastq_tophat.sh
A2_FILE=A2_test_single_PCBC_file_fastq_STAR.sh
A3_FILE=A3_test_single_GEO_file_sra.sh
A4_FILE=A4_test_two_GEO_files_sra_STAR.sh
A5a_FILE=A5a_GEO_files_grp_a.sh
A5b_FILE=A5b_GEO_files_grp_b.sh
A5c_FILE=A5c_GEO_files_grp_c.sh
A5d_FILE=A5d_GEO_files_grp_d.sh
B_FILE=B_process_single_file.sh
C_FILE=Csra_to_fastq.sh
D1_FILE=Dfastq_to_bam_by_STAR.sh
D2_FILE=Dfastq_to_bam_by_tophat.sh
E_FILE=Ebam_to_count.sh
CONFIG_1_FILE=1config_fastq_to_count_by_tophat.sh
CONFIG_2_FILE=2config_fastq_to_count_by_STAR.sh
CONFIG_3_FILE=3config_sra_to_count_by_STAR.sh

synapse store --parentid syn2417754 --description  "$A1_DESCRIPTION" --file "$SCRIPT_DIR/$A1_FILE"
synapse store --parentid syn2417754 --description  "$A2_DESCRIPTION" --file "$SCRIPT_DIR/$A2_FILE"
synapse store --parentid syn2417754 --description  "$A3_DESCRIPTION" --file "$SCRIPT_DIR/$A3_FILE"
synapse store --parentid syn2417754 --description  "$A4_DESCRIPTION" --file "$SCRIPT_DIR/$A4_FILE"
synapse store --parentid syn2417754 --description "$A5a_DESCRIPTION" --file "$SCRIPT_DIR/$A5a_FILE"
synapse store --parentid syn2417754 --description "$A5b_DESCRIPTION" --file "$SCRIPT_DIR/$A5b_FILE"
synapse store --parentid syn2417754 --description "$A5c_DESCRIPTION" --file "$SCRIPT_DIR/$A5c_FILE"
synapse store --parentid syn2417754 --description "$A5d_DESCRIPTION" --file "$SCRIPT_DIR/$A5d_FILE"
synapse store --parentid syn2417754 --description   "$B_DESCRIPTION" --file "$SCRIPT_DIR/$B_FILE"
synapse store --parentid syn2417754 --description   "$C_DESCRIPTION" --file "$SCRIPT_DIR/$C_FILE"
synapse store --parentid syn2417754 --description  "$D1_DESCRIPTION" --file "$SCRIPT_DIR/$D1_FILE"
synapse store --parentid syn2417754 --description  "$D2_DESCRIPTION" --file "$SCRIPT_DIR/$D2_FILE"
synapse store --parentid syn2417754 --description   "$E_DESCRIPTION" --file "$SCRIPT_DIR/$E_FILE"
synapse store --parentid syn2417754 --description "$CONFIG_1_DESCRIPTION" --file "$SCRIPT_DIR/$CONFIG_1_FILE"
synapse store --parentid syn2417754 --description "$CONFIG_2_DESCRIPTION" --file "$SCRIPT_DIR/$CONFIG_2_FILE"
synapse store --parentid syn2417754 --description "$CONFIG_3_DESCRIPTION" --file "$SCRIPT_DIR/$CONFIG_3_FILE"
