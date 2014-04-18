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

SYN_A_SCRIPT=$1
SYN_B_SCRIPT=syn2417974
SYN_C_SCRIPT=syn2417993
SYN_D_SCRIPT=syn2417994
SYN_E_SCRIPT=syn2417996
SYN_CONFIG=syn2417999

SYN_SRA_TOOLKIT=syn2415895
SYN_SAMTOOLS=syn2243148
SYN_STAR=syn2243150
SYN_CUFFLINKS=syn2243146

export SHELL_PROCESS_PROV_A=$0
export SHELL_PROCESS_A=$1

export DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts
export DIR_SCRIPT_PROV=/work/DAT_114__PCBC_Data/Scripts/Provenance

export SHELL_CONFIG=$DIR_SCRIPT/3config_sra_to_count_by_STAR.sh
export SHELL_CONFIG_PROV=$DIR_SCRIPT_PROV/3Provenance_Config_GEO_RNA_Seq.sh
export SHELL_PROCESS_PROV_B=$DIR_SCRIPT_PROV/B_process_single_file_PROVENANCE.sh
export SHELL_PROCESS_PROV_C=$DIR_SCRIPT_PROV/Csra_to_fastq_PROVENANCE.sh
export SHELL_PROCESS_PROV_D=$DIR_SCRIPT_PROV/Dfastq_to_bam_by_STAR_PROVENANCE.sh
export SHELL_PROCESS_PROV_E=$DIR_SCRIPT_PROV/Ebam_to_count_PROVENANCE.sh

export DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts

export SYN_PROJECT_NAME='Stem Cell Data Processing Project'

export SYN_DIR_SRA='Data/RNA_Seq_Test/sra'
export SYN_DIR_FASTQ='Data/RNA_Seq_Test/fastq'
export SYN_DIR_BAM='Data/RNA_Seq_Test/bam'
export SYN_DIR_COUNT='Data/RNA_Seq_Test/count'
export SYN_PATH_SRA=$SYN_DIR_SRA/$FILE_SRA
export SYN_PATH_FASTQ=$SYN_DIR_FASTQ/$FILE_FASTQ
export SYN_PATH_BAM=$SYN_DIR_BAM/$FILE_BAM
export SYN_PATH_COUNT=$SYN_DIR_COUNT/$FILE_COUNT

export DIR_SCRIPT_PROV_C=$DIR_SCRIPT_PROV/Csra_to_fastq_PROVENANCE.sh
export DIR_SCRIPT_PROV_D=$DIR_SCRIPT_PROV/Dfastq_to_bam_by_STAR_PROVENANCE.sh
export DIR_SCRIPT_PROV_E=$DIR_SCRIPT_PROV/Ebam_to_count_PROVENANCE.sh

#B - Input (sra file)
export B_ACTIVITY_NAME="Import data"
export B_ENTITY_PATH=$PATH_SRA
export B_ENTITY_DESC=$FILE_SRA
export B_SYN_PATH=$SYN_PATH_SRA
export B_UPLOAD=

#C sra -> fastq 
export C_ACTIVITY_NAME="sra -> fastq"
export C_ENTITY_PATH=$PATH_FASTQ
export C_ENTITY_DESC=$FILE_FASTQ
export C_SYN_ID_OF_PROGRAM=$SYN_SRA_TOOLKIT\ $SYN_A_SCRIPT\ $SYN_B_SCRIPT\ $SYN_C_SCRIPT\ $SYN_CONFIG
export C_SYN_VER_OF_PROGRAM=2\ 2\ 1\ 1\ 1
export C_USES=$SYN_PATH_SRA
export C_SYN_DIR=$SYN_DIR_FASTQ
export C_UPLOAD=

#D fastq -> bam
export D_ACTIVITY_NAME="fastq -> bam"
export D_ACTIVITY_DESC="... using STAR"
export D_ENTITY_PATH=$PATH_BAM
export D_ENTITY_DESC=$FILE_BAM
export D_SYN_ID_OF_PROGRAM=$SYN_STAR\ $SYN_SAMTOOLS\ $SYN_A_SCRIPT\ $SYN_B_SCRIPT\ $SYN_D_SCRIPT\ $SYN_CONFIG
export D_SYN_VER_OF_PROGRAM=1\ 1\ 2\ 1\ 1\ 1
export D_USES=$SYN_PATH_FASTQ
export D_SYN_DIR=$SYN_DIR_BAM
export D_UPLOAD=

#E bam -> count
export E_ACTIVITY_NAME="bam -> count"
export E1_ENTITY_PATH=$PATH_COUNT_1
export E2_ENTITY_PATH=$PATH_COUNT_2
export E1_ENTITY_DESC=$ID_SAMPLE\_$FILE_COUNT_1
export E2_ENTITY_DESC=$ID_SAMPLE\_$FILE_COUNT_2
export E_SYN_ID_OF_PROGRAM=$SYN_SAMTOOLS\ $SYN_CUFFLINKS\ $SYN_A_SCRIPT\ $SYN_B_SCRIPT\ $SYN_E_SCRIPT\ $SYN_CONFIG
export E_SYN_VER_OF_PROGRAM=1\ 1\ 2\ 1\ 1\ 1
export E_USES=$SYN_PATH_BAM
export E_SYN_DIR=$SYN_DIR_COUNT
export E_UPLOAD=-upload
