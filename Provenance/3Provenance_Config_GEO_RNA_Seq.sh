#Parameters used in create_provenance.sh:
#
#PROJECT_NAME: Synapse project name where data will be stored. 
#              Ex: 'Stem Cell Data Processing Project'
#FOLDER_NAME: Synapse folder name for storing data. 
#              Ex: 'Data/RNA_Seq_Test/fastq'
#ENTITY_PATH: Local file path (directory and filename). 
#              Ex: $PATH_FASTQ
#ENTITY_DESCRIPTION: Additional information about entity. 
#              Ex: 'fastq file of RNA seq data'
#ACTIVITY_NAME: Name for process used to make file. 
#              Ex: 'sra -> fastq'
#ACTIVITY_DESCRIPTION: Additional information about process. 
#              Ex: 'Converted sra file from GEO into a fastq file
#PROGRAM_NAME: Synapse ID(s) of program(s) used to complete Activity. 
#              Ex: syn2415895
#PROGRAM_VERSION: Synapse version number of program(s). 
#              Ex: 2
#IN_SYNAPSE: Describe if file should be uploaded to Synapse. Not currently implemented. 
#              Ex: 0

#Synaps IDs for the scripts, for reference:
# Config 1: syn2417997
# Config 2: syn2417998
# Config 3: syn2417999
# A1:  syn2417987
# A2:  syn2417988
# A3:  syn2417973
# A4:  syn2417990
# A5:  
# A5a: syn2417991
# A5b: syn2418001
# A5c: syn2418002
# A5d: syn2418003
# B:   syn2417974
# C:   syn2417993
# D_STAR:   syn2417994
# D_tophat: syn2417995
# E:   syn2417996
# rna-star s.3.0:	syn2243150
# tophat 2.0.9:		syn2243144
# cufflinks 2.1.1: 	syn2243146
# samtools 0.1.19:	syn2243148
# sra_toolkit 2.3.5	syn2415895

SYN_DIR_DATA_ROOT='Data/RNA_Seq_Test'

SYNID_A_SCRIPT=$1
SYNID_B_SCRIPT=syn2417974
SYNID_C_SCRIPT=syn2417993
SYNID_D_SCRIPT=syn2417994
SYNID_E_SCRIPT=syn2417996
SYNID_CONFIG=syn2417999

SYNID_SRA_TOOLKIT=syn2415895
SYNID_SAMTOOLS=syn2243148
SYNID_STAR=syn2243150
SYNID_CUFFLINKS=syn2243146

SYN_NAME_SRA=$FILE_SRA
SYN_NAME_FASTQ=$FILE_FASTQ
SYN_NAME_BAM=$FILE_BAM
SYN_NAME_COUNT_1=$ID_SAMPLE\_$FILE_COUNT_1
SYN_NAME_COUNT_2=$ID_SAMPLE\_$FILE_COUNT_2

SYN_DIR_SRA=$SYN_DIR_DATA_ROOT/sra
SYN_DIR_FASTQ=$SYN_DIR_DATA_ROOT/fastq
SYN_DIR_BAM=$SYN_DIR_DATA_ROOT/bam
SYN_DIR_COUNT=$SYN_DIR_DATA_ROOT/count

SYN_PATH_SRA=$SYN_DIR_SRA/$SYN_NAME_SRA
SYN_PATH_FASTQ=$SYN_DIR_FASTQ/$SYN_NAME_FASTQ
SYN_PATH_BAM=$SYN_DIR_BAM/$SYN_NAME_BAM
SYN_PATH_COUNT_1=$SYN_DIR_COUNT/$SYN_NAME_COUNT_1
SYN_PATH_COUNT_2=$SYN_DIR_COUNT/$SYN_NAME_COUNT_2

SHELL_PROCESS_PROV_A=$0
SHELL_PROCESS_A=$1
SHELL_CONFIG=$2

DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts

#Provenance shells
#	This method allows us to swap methods in and out in a modular form
#   If a method is not used (e.g. process C), set the process to blank: 
#   export SHELL_PROCESS_PROV_C=

export DIR_SCRIPT_PROV=/work/DAT_114__PCBC_Data/Scripts/Provenance

export SHELL_PROCESS_PROV_B=$DIR_SCRIPT_PROV/B_process_single_file_PROVENANCE.sh
export SHELL_PROCESS_PROV_C=$DIR_SCRIPT_PROV/Csra_to_fastq_PROVENANCE.sh
export SHELL_PROCESS_PROV_D=$DIR_SCRIPT_PROV/Dfastq_to_bam_by_STAR_PROVENANCE.sh
export SHELL_PROCESS_PROV_E=$DIR_SCRIPT_PROV/Ebam_to_count_PROVENANCE.sh

#B - Input (sra file)
#C sra -> fastq 
#D fastq -> bam
#E bam -> count

# Parameters for create_provenance script

export SYN_PROJECT_NAME='Stem Cell Data Processing Project'

export B_ACTIVITY_NAME="Import data"
export C_ACTIVITY_NAME="sra -> fastq"
export D_ACTIVITY_NAME="fastq -> bam"
export E_ACTIVITY_NAME="bam -> count"

export D_ACTIVITY_DESC="... using STAR"

export B_ENTITY_NAME=$SYN_NAME_SRA
export C_ENTITY_NAME=$SYN_NAME_FASTQ
export D_ENTITY_NAME=$SYN_NAME_BAM
export E1_ENTITY_NAME=$SYN_NAME_COUNT_1
export E2_ENTITY_NAME=$SYN_NAME_COUNT_2

export B_ENTITY_PATH=$PATH_SRA
export C_ENTITY_PATH=$PATH_FASTQ
export D_ENTITY_PATH=$PATH_BAM
export E1_ENTITY_PATH=$PATH_COUNT_1
export E2_ENTITY_PATH=$PATH_COUNT_2

export B_ENTITY_DESC=$FILE_SRA
export C_ENTITY_DESC=$FILE_FASTQ
export D_ENTITY_DESC=$FILE_BAM
export E1_ENTITY_DESC=$FILE_COUNT_1
export E2_ENTITY_DESC=$FILE_COUNT_2

export B_SYN_DIR=$SYN_DIR_SRA
export C_SYN_DIR=$SYN_DIR_FASTQ
export D_SYN_DIR=$SYN_DIR_BAM
export E_SYN_DIR=$SYN_DIR_COUNT

export C_SYN_ID_OF_PROGRAM=$SYNID_CONFIG\ $SYNID_A_SCRIPT\ $SYNID_B_SCRIPT\ $SYNID_C_SCRIPT\ $SYNID_SRA_TOOLKIT
export D_SYN_ID_OF_PROGRAM=$SYNID_CONFIG\ $SYNID_A_SCRIPT\ $SYNID_B_SCRIPT\ $SYNID_D_SCRIPT\ $SYNID_SAMTOOLS\ $SYNID_STAR
export E_SYN_ID_OF_PROGRAM=$SYNID_CONFIG\ $SYNID_A_SCRIPT\ $SYNID_B_SCRIPT\ $SYNID_E_SCRIPT\ $SYNID_SAMTOOLS\ $SYNID_CUFFLINKS

export C_SYN_VER_OF_PROGRAM=1\ 1\ 1\ 1\ 2
export D_SYN_VER_OF_PROGRAM=1\ 1\ 1\ 1\ 1\ 1
export E_SYN_VER_OF_PROGRAM=1\ 1\ 1\ 1\ 1\ 1

export C_USES=$SYN_PATH_SRA
export D_USES=$SYN_PATH_FASTQ
export E_USES=$SYN_PATH_BAM

# Set upload example: E_UPLOAD=-upload
export B_UPLOAD=
export C_UPLOAD=
export D_UPLOAD=
export E_UPLOAD=-upload
