#!/bin/bash

#20090306 Takayuki Yuasa

if [ _$3 = _ ];
then
echo "fits_get_minimum_column_value.sh FILE EXTENSION COLUMN"
exit
fi

tmp=`get_hash_random.pl`

fits_dump_columns.sh ${1} ${2} $3 > $tmp

perl << EOF
open(FILE,"$tmp");
@file=<FILE>;close FILE;

\$min=\$file[0];

foreach \$line (@file){
 if(\$min<\$line){
  \$min=\$line;
 }
}

print \$min;
EOF

rm $tmp
