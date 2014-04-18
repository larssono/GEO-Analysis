mkdir -p $DIR_SAM
mkdir -p $DIR_BAM

## Running STAR

echo $PATH_STAR --runThreadN 8 --genomeDir $GENOME_IDX --outFileNamePrefix $PREFIX_SAM --outSAMunmapped Within --readFilesIn $PATH_FASTQ
$PATH_STAR --runThreadN 8 --genomeDir $GENOME_IDX --outFileNamePrefix $PREFIX_SAM --outSAMunmapped Within --readFilesIn $PATH_FASTQ

## Running samtools

module load samtools/$VER_SAMTOOLS
samtools view -b -S $PATH_SAM -t $PATH_NAME_LENGTH_REF > $PATH_BAM

## Provenance 

echo $DIR_SCRIPT_PROV/create_provenance.sh -an "$D_ACTIVITY_NAME" -ad "$D_ACTIVITY_DESC" -en "$D_ENTITY_NAME" -ep "$D_ENTITY_PATH" -fn "$D_SYN_DIR" -pn "$SYN_PROJECT_NAME" -progn $D_SYN_ID_OF_PROGRAM -progv $D_SYN_VER_OF_PROGRAM -uses $D_USES $D_UPLOAD
$DIR_SCRIPT_PROV/create_provenance.sh -an "$D_ACTIVITY_NAME" -ad "$D_ACTIVITY_DESC" -en "$D_ENTITY_NAME" -ep "$D_ENTITY_PATH" -fn "$D_SYN_DIR" -pn "$SYN_PROJECT_NAME" -progn $D_SYN_ID_OF_PROGRAM -progv $D_SYN_VER_OF_PROGRAM -uses $D_USES $D_UPLOAD
