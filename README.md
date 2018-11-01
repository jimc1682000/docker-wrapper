# How to use docker-wrapper?
First, change the wrapper.cfg to what package you want to rapper

IFS=':' read -r -a PACK <<< "$PACKAGE"
#REF: https://stackoverflow.com/questions/10586153/split-string-into-an-array-in-bash
#To iterate over the elements:
#for element in "${array[@]}"
#do
#    echo "$element"
#done
