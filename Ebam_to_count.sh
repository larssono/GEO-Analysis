
module load samtools/$VER_SAMTOOLS
samtools index $PATH_BAM

mkdir -p $DIR_COUNT
cd $DIR_COUNT

module load cufflinks/$VER_CUFFLINKS
cufflinks -p 4 -G $GENOME_MDL -u --no-update-check -o $DIR_COUNT -L $ID_SAMPLE $PATH_BAM