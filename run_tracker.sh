DO_SEG=true
MODEL_SIZE=x #n, s, m, l, x
# construct model name
MODEL_NAME="yolov8"
MODEL_NAME=${MODEL_NAME}${MODEL_SIZE}

if [ $DO_SEG = true ] ; then
    MODEL_NAME=${MODEL_NAME}-seg
fi

# tracker type
TRACKER="ocsort"

# append the .pt
MODEL_NAME=${MODEL_NAME}.pt

# Data source
# PROJECT="runs/track"
# SOURCE=/home/abhijatbiswas/datasets/avtfcw-videos/front_test.mp4

PROJECT="runs/test_AVT"
SOURCE=/home/abhijatbiswas/datasets/avtfcw-videos/bdd_task_track/traffic_frames_padded/evoque_2016k_055_20170616_1455_76994_149_traffic

# PROJECT="runs/UNINEXT-comparison"
# SOURCE=/home/abhijatbiswas/gitstuff/UNINEXT/datasets/bdd/images/track/val/b1c9c847-3bda4659/

# run command
# echo "

# export PYTHONPATH=${PYTHONPATH}:./

SOURCE_FILENAME=$(basename -- "${SOURCE}")
SOURCE_FILENAME="${SOURCE_FILENAME%.*}"
RUN_NAME=${MODEL_NAME}+${TRACKER}+${SOURCE_FILENAME}


python examples/track.py --source ${SOURCE} \
--save --save-txt \
--yolo-model ${MODEL_NAME} \
--tracking-method ${TRACKER} --project ${PROJECT} --name ${RUN_NAME} \
--device 0 --img 1280
# "