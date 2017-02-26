#!/bin/bash

# Generate txt files for training_equations_10_images_per_number_classes
for d in `ls -d training_equations_10_images_per_number_classes/*`; do
    label=$(basename $d)
    for f in `ls training_equations_10_images_per_number_classes/${label}/*.jpeg | gshuf`; do
        echo "${f} ${label}" >> txt_train_${label}.txt
    done

    cat txt_train_*.txt > train_equations_10.txt
done

for d in `ls -d testing_equations_4_images_per_number_classes/*`; do
    label=$(basename $d)
    for f in `ls testing_equations_4_images_per_number_classes/${label}/*.jpeg | gshuf`; do
        echo "${f} ${label}" >> txt_test_${label}.txt
    done

    cat txt_test_**.txt > test_equations_4.txt
done


