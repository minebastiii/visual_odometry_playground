rosrun dso_ros dso_live image:=/usb_cam/image_raw \
    calib=../testdata/visual_odometry_testdata/sequence_50/camera.txt \
    gamma=../testdata/visual_odometry_testdata/sequence_50/pcalib.txt \
    vignette=../testdata/visual_odometry_testdata/sequence_50/vignette.png