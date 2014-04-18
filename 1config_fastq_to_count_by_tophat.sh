
# This configuration file is a runable script 
# that sets system variables used by the rest of the processing scripts.

# The assumed process uses tophat to convert a fastq to bam
# then uses cufflinks to comvert the bam to ___

#### Input

export PATH_CONFIG=$1
export ID_SAMPLE=$2
export FILE_FASTQ=$3

#### Static

export VER_CUFFLINKS=2.1.1
export VER_SAMTOOLS=0.1.19
export VER_TOPHAT=2.0.9

export DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts
export DIR_TEMP=/work/DAT_114__PCBC_Data/temp/$ID_SAMPLE
export DIR_FASTQ=/external-data/DAT_114__PCBC_Data/mRNA/fastq
export DIR_BAM=/work/DAT_114__PCBC_Data/Results/bam
export DIR_COUNT=/work/DAT_114__PCBC_Data/Results/count

export GENOME_IDX=/external-data/Genome/indicies/Hsapiens_UCSC_hg19_Bowtie2/genome
export GENOME_MDL=/external-data/Genome/gene_models/Hsapiens_UCSC_hg19.gtf

#### Derived

export SHELL_FASTQ_TO_COUNT=$DIR_SCRIPT/B_process_single_file.sh
export SHELL_SRA_TO_FASTQ=echo\ No\ need\ to\ convert\ SRA\ to\ FASTQ\ \-\ step\ skipped
export SHELL_FASTQ_TO_BAM=$DIR_SCRIPT/Dfastq_to_bam_by_tophat.sh 
export SHELL_BAM_TO_COUNT=$DIR_SCRIPT/Ebam_to_count.sh

#### Transient (Derived)

export DIR_COUNT_QC=$DIR_COUNT/$ID_SAMPLE

export PATH_FASTQ=$DIR_FASTQ/$FILE_FASTQ
export PATH_BAM=$DIR_BAM/$ID_SAMPLE.bam
export PATH_COUNT=$DIR_COUNT/$ID_SAMPLE.fpkm_tracking

