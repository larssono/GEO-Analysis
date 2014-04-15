#Original processing code
#
### Running STAR
#
#$PATH_STAR --runThreadN 8 --genomeDir $GENOME_IDX --outFileNamePrefix $DIR_TEMP --outSAMunmapped Within --readFilesCommand gunzip --readFilesIn $PATH_FASTQ
#
### Running samtools
#
#module load samtools/$VER_SAMTOOLS
#
#samtools view -b -S $PATH_SAM -t $PATH_NAME_LENGTH_REF > $PATH_BAM
#
#
## Provenance …