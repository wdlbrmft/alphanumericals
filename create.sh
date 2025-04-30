#!/bin/sh

chars="a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9"
length=10
outdir=./out/

rm -rf $outdir

x=1
length=$(( $length - 1 )) # remove an off by one
# create a sh*tton of links
while [ $x -le $length ]; do

    next_x=$(( $x + 1 ))

    mkdir -p $outdir$x
    mkdir -p $outdir$next_x

    for char in $chars; do
        ln -s ../$next_x $outdir$x/$char 2> /dev/null
    done

    x=$(( $x + 1 ))

done

# Remove last layer of links
rm $outdir$next_x/*

# Create termination layer 
for char in $chars; do
    touch $outdir$x/$char
done

# Rename entry point
mv "${outdir}"1 "${outdir}"entrypoint

# Display a result
cd ./out/entrypoint
ls ./h/a/l/l/o/a/m/i/g/o