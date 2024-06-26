rosrun dso_ros dso_live image:=/usb_cam/image_raw \
    calib=../custom_config/dso_dji_cam_calib.yaml \
    savefile=dso_traj.txt \
    vignette=../testdata/visual_odometry_testdata/sequence_50/vignette.png \
    gamma=../custom_config/dji_cam_pcalib.txt