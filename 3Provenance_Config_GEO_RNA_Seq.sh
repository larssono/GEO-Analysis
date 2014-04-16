#PROJECT_NAME='Stem Cell Data Processing Project'
#FOLDER_NAME='Data/RNA_Seq_Test/sra'
#ENTITY_PATH=$PATH_SRA
#ENTITY_DESCRIPTION=
#ACTIVITY_NAME='Load data'
#ACTIVITY_DESCRIPTION=
#PROGRAM_NAME=
#PROGRAM_VERSION=
#IN_SYNAPSE=0

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
export B_ENTITY_DESC=$FILE_SRA

#C sra -> fastq 
export C_ACTIVITY_NAME="sra -> fastq"
export C_ENTITY_DESC=$FILE_FASTQ
export C_PROGRAM_NAME="sratoolkit"
export C_PROGRAM_VER=$VER_SRA_TOOLKIT
export C_USES=$SYN_PATH_SRA $PATH_CONFIG $SHELL_SRA_TO_FASTQ 

#D fastq -> bam
export D_ACTIVITY_NAME="fastq -> bam"
export D_ACTIVITY_DESC="... using STAR"
export D_ENTITY_DESC=$FILE_BAM
export D_PROGRAM_NAME=STAR samtools
export D_PROGRAM_VER=$VER_STAR $VER_SAMTOOLS
export D_USES=\"$SYN_PATH_FASTQ\"\ \"$PATH_CONFIG\"\ \"$SHELL_FASTQ_TO_BAM\"

#E bam -> count
export E_ACTIVITY_NAME="bam -> count"
export E_ENTITY_DESC=$FILE_COUNT