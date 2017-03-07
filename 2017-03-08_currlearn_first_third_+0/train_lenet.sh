#!/usr/bin/env sh
set -e

./build/tools/caffe train --solver=examples/mnist/lenet_solver.prototxt 2>&1 | tee 84x28_first_third_+0.log
