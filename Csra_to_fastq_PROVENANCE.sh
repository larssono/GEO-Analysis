#Original processing code
#
#module load sratoolkit/$VER_SRA_TOOLKIT
#
#fastq-dump -I --split-files $PATH_SRA -O $DIR_FASTQ
#
#Provenance
echo $DIR_SCRIPT_PROV/create_provenance.sh -an "$C_ACTIVITY_NAME" -ep "$PATH_FASTQ" -fn "$SYN_DIR_FASTQ" -pn "$SYN_PROJECT_NAME" -progn $C_PROGRAM_NAME -progv $C_PROGRAM_VER $C_USES
$DIR_SCRIPT_PROV/create_provenance.sh -an "$C_ACTIVITY_NAME" -ep "$PATH_FASTQ" -fn "$SYN_DIR_FASTQ" -pn "$SYN_PROJECT_NAME" -progn $C_PROGRAM_NAME -progv $C_PROGRAM_VER $C_USES