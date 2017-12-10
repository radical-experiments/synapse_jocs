#!/usr/bin/env bash

#echo "base_O0"
#cd base_O0
#./run_test_matmult.sh
#cd ..
#
#echo "base_O2"
#cd base_O2
#./run_test_matmult.sh
#cd ..

echo "with_lib"
cd with_lib
./run_test_matmult.sh
cd ..

echo "with_arg_with_opt"
cd with_arg_with_opt
./run_test_matmult.sh
cd ..

#echo "with_arg_no_opt"
#cd with_arg_no_opt
#./run_test_matmult.sh
#cd ..
#
#echo "no_arg_with_opt"
#cd no_arg_with_opt
#./run_test_matmult.sh
#cd ..
#
#echo "no_arg_no_opt"
#cd no_arg_no_opt
#./run_test_matmult.sh
#cd ..
