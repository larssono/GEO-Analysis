mkdir -p $DIR_FASTQ

module load sratoolkit/$VER_SRA_TOOLKIT

fastq-dump -I --split-files $PATH_SRA -O $DIR_FASTQ