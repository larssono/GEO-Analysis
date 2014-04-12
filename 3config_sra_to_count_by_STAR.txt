
# This configuration file is a runable script 
# that sets system variables used by the rest of the processing scripts.

# The assumed process uses tophat to convert a fastq to bam
# then uses cufflinks to convert the bam to ___

#### Input

export PATH_CONFIG=$1
export ID_SAMPLE=$2
export FILE_SRA=$3

#### Static

export DIR_SCRIPT=/work/DAT_114__PCBC_Data/Scripts
export DIR_TEMP=/work/DAT_114__PCBC_Data/temp/$ID_SAMPLE
export DIR_SRA=/external-data/DAT_114__PCBC_Data/GEO
export DIR_FASTQ=/work/DAT_114__PCBC_Data/mRNA/fastq
export DIR_BAM=/work/DAT_114__PCBC_Data/Results/bam
export DIR_COUNT=/work/DAT_114__PCBC_Data/Results/count

export GENOME_IDX=/external-data/Genome/indicies/Hsapiens_UCSC_hg19_STAR/hg19_Gencode19
export GENOME_MDL=/external-data/Genome/gene_models/Hsapiens_UCSC_hg19.gtf

export VER_CUFFLINKS=2.1.1
export VER_SAMTOOLS=0.1.19
export VER_SRA_TOOLKIT=2.3.5
export VER_STAR=2.3.0e

#### Derived

export DIR_STAR=/home/apratap/softwares/STAR_$VER_STAR

export FILE_FASTQ=$ID_SAMPLE.fastq

export SHELL_SRA_TO_FASTQ=$DIR_SCRIPT/Csra_to_fastq.sh
export SHELL_FASTQ_TO_BAM=$DIR_SCRIPT/Dfastq_to_bam_by_STAR.sh 
export SHELL_BAM_TO_COUNT=$DIR_SCRIPT/Ebam_to_count.sh

export PATH_NAME_LENGTH_REF=$GENOME_IDX/chrNameLength.txt
export PATH_STAR=$DIR_STAR/STAR

#### Transient (Derived)

export DIR_COUNT_QC=$DIR_COUNT/$ID_SAMPLE

export FILE_FASTQ=$ID_SAMPLE.fastq
export FILE_BAM=$ID_SAMPLE.bam
export FILE_COUNT=$ID_SAMPLE.fpkm_tracking

export PATH_SRA=$DIR_SRA/$FILE_SRA
export PATH_FASTQ=$DIR_FASTQ/$FILE_FASTQ
export PATH_SAM=$DIR_TEMP\Aligned.out.sam
export PATH_BAM=$DIR_BAM/$FILE_BAM
export PATH_COUNT=$DIR_COUNT/$FILE_COUNT
