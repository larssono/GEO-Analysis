mkdir -p $DIR_FASTQ

module load sratoolkit/$VER_SRA_TOOLKIT

fastq-dump -I --split-files $PATH_SRA -O $DIR_FASTQ

#Provenance
echo $DIR_SCRIPT_PROV/create_provenance.sh -an "$C_ACTIVITY_NAME" -en "$C_ENTITY_NAME" -ep "$C_ENTITY_PATH" -ed "$C_ENTITY_DESC" -fn "$C_SYN_DIR" -pn "$SYN_PROJECT_NAME" -progn $C_SYN_ID_OF_PROGRAM -progv $C_SYN_VER_OF_PROGRAM -uses $C_USES $C_UPLOAD
$DIR_SCRIPT_PROV/create_provenance.sh -an "$C_ACTIVITY_NAME" -en "$C_ENTITY_NAME" -ep "$C_ENTITY_PATH" -ed "$C_ENTITY_DESC" -fn "$C_SYN_DIR" -pn "$SYN_PROJECT_NAME" -progn $C_SYN_ID_OF_PROGRAM -progv $C_SYN_VER_OF_PROGRAM -uses $C_USES $C_UPLOAD