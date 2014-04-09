
SAMPLE=H9.102.2.5
IN_DIR=/external-data/DAT_114__PCBC_Data/mRNA/fastq
FASTQ_FILE=run0102_lane2_read1_index5\=H9-P37T7-1.fastq.gz
GENOME=/external-data/Genome/gene_models/Hsapiens_UCSC_hg19.gtf
FASTA=/external-data/Genome/genomes/Hsapiens_UCSC_hg19/WholeGenomeFasta/genome.fa
GENOME_IDX=/external-data/Genome/indicies/Hsapiens_UCSC_hg19_Bowtie2/genome

FASTQ=$IN_DIR/$FASTQ_FILE
DIR=$(pwd)
OUT_DIR=%DIR/bam
SAMPLE_BAM=$SAMPLE.bam
SAMPLE_OUT=$SAMPLE

rm $OUT_DIR/accepted_hits.bam
cd $DIR
module load tophat/2.0.9
tophat -o $OUT_DIR -p 8 -G $GENOME $GENOME_IDX $FASTQ
mv $OUT_DIR/accepted_hits.bam $OUT_DIR/$SAMPLE.bam
cd $OUT_DIR
samtools index $SAMPLE_BAM

cd $DIR
module load cufflinks/2.1.1

cufflinks -p 4 -G $GENOME -u --no-update-check -o $SAMPLE -L $SAMPLE $BAM