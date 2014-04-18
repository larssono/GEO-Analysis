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
## Provenance 

echo $DIR_SCRIPT_PROV/create_provenance.sh -an "$D_ACTIVITY_NAME" -ad "$D_ACTIVITY_DESC" -ep "$D_ENTITY_PATH" -fn "$D_SYN_DIR" -pn "$SYN_PROJECT_NAME" -progn $D_SYN_ID_OF_PROGRAM -progv $D_SYN_VER_OF_PROGRAM -uses $D_USES $D_UPLOAD
$DIR_SCRIPT_PROV/create_provenance.sh -an "$D_ACTIVITY_NAME" -ad "$D_ACTIVITY_DESC" -ep "$D_ENTITY_PATH" -fn "$D_SYN_DIR" -pn "$SYN_PROJECT_NAME" -progn $D_SYN_ID_OF_PROGRAM -progv $D_SYN_VER_OF_PROGRAM -uses $D_USES $D_UPLOAD
