
# This configuration file is a runable script 
# that sets system variables used by the rest of the processing scripts.

# The assumed process uses tophat to convert a fastq to bam
# then uses cufflinks to comvert the bam to ___

#### Input

source ./0test_level2.sh A B C D

echo WWW=$WWW
echo XXX=$XXX
echo YYY=$YYY
echo ZZZ=$ZZZ

./0test_level2_again.sh
