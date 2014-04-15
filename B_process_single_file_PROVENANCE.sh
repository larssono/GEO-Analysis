##INCOMING PARAMETERS: 1-Configuration file path, 2-Sample ID, 3-Sample Path

######## Load configuration file

source $1 $1 $2 $3

######## Run Scripts (see configuration file for script names - C, D, and E)

echo
echo Processing $ID_SAMPLE
echo

######## Provenance of input file

$DIR_SCRIPT_PROV/Csra_to_fastq_PROVENANCE.sh
$DIR_SCRIPT_PROV/Dfastq_to_bam_by_STAR_PROVENANCE.sh
$DIR_SCRIPT_PROV/Ebam_to_count_PROVENANCE.sh

#Original processing code
#
#$SHELL_SRA_TO_FASTQ
#$SHELL_FASTQ_TO_BAM
#$SHELL_BAM_TO_COUNT

