#Original processing code
#
#module load samtools/$VER_SAMTOOLS
#samtools index $PATH_BAM

#cd $DIR_COUNT
#
#module load cufflinks/$VER_CUFFLINKS
#cufflinks -p 4 -G $GENOME_MDL -u --no-update-check -o $DIR_COUNT -L $ID_SAMPLE $PATH_BAM

#Provenance

$DIR_SCRIPT_PROV/create_provenance.sh -an "$E_ACTIVITY_NAME" -ad "$E_ACTIVITY_DESC" -en "$E1_ENTITY_NAME" -ep "$E1_ENTITY_PATH" -ed "$E1_ENTITY_DESC" -fn "$SYN_DIR_COUNT" -pn "$SYN_PROJECT_NAME" -progn $E_SYN_ID_OF_PROGRAM -progv $E_SYN_VER_OF_PROGRAM -uses $E_USES $E_UPLOAD

$DIR_SCRIPT_PROV/create_provenance.sh -an "$E_ACTIVITY_NAME" -ad "$E_ACTIVITY_DESC" -en "$E2_ENTITY_NAME" -ep "$E2_ENTITY_PATH" -ed "$E2_ENTITY_DESC" -fn "$SYN_DIR_COUNT" -pn "$SYN_PROJECT_NAME" -progn $E_SYN_ID_OF_PROGRAM -progv $E_SYN_VER_OF_PROGRAM -uses $E_USES $E_UPLOAD
