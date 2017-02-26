#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=data/mnist
DATA=data/mnist/
TOOLS= /build/tools

TRAIN_DATA_ROOT=data/mnist/
VAL_DATA_ROOT=data/mnist/
TEST_DATA_ROOT=data/mnist/
# Set RESIZE=true to resize the images to 256x256. Leave as false 
# if images have already been resized using another tool

RESIZE=false
if $RESIZE; then
	RESIZE_HEIGHT=256
	RESIZE_WIDTH=256
else
	RESIZE_HEIGHT=0
	RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
	echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
	echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
		" where the ImageNet training data is stored."
	exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
	echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
	echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
		" where the ImageNet validation data is stored."
	exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
        echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
        echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
                " where the ImageNet validation data is stored."
        exit 1
fi
echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
	--resize_height=$RESIZE_HEIGHT \
	--resize_width=$RESIZE_WIDTH \
	--shuffle \
	$TRAIN_DATA_ROOT \
	$DATA/train_equations_10.txt \
	$EXAMPLE/mnist_equation_train_10_lmdb

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
	--resize_height=$RESIZE_HEIGHT \
	--resize_width=$RESIZE_WIDTH \
	--shuffle \
	$VAL_DATA_ROOT \
	$DATA/test_equations_4.txt \
	$EXAMPLE/mnist_equation_test_4_lmdb

echo "Done"
