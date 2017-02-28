#!/usr/bin/env sh
set -e

./build/tools/caffe train --solver=examples/mnist/lenet_solver.prototxt 2>&1 | tee 3_equations_8_9_10.log
