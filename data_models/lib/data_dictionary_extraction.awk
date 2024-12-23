#!/bin/awk -f
BEGIN{FS="|"}
FNR > 1 {
    gsub(/\s*/,"",$1)
    gsub(/\s*/,"",$4)
    if (FNR == 2)
    printf "\ncolumn_declarations <- c( '%s' = '%s'\n",$1,$4
    else
    printf "\t, '%s' = '%s'\n",$1,$4
}
END{ printf")\n\n"}
