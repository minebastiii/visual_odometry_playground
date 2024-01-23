# visual odometry playground
This repository contains def files for [apptainer](https://apptainer.org/) to create containers for some visual
odometry algorithms. All of them run in [ROS](https://ros.org/) to ensure compatibility to reallife robots.
The used ROS version is ROS Noetic from the [DockerHub](https://hub.docker.com/layers/osrf/ros/noetic-desktop-full-focal/images/sha256-32662064d4572123b8e6644bfb1b1b655053e760d10062b7a11e032b75e71929?context=explore).

## Wich algorithms are included?

1. [SVO] semi-direct monocular visual Odometry ([Github](https://github.com/uzh-rpg/rpg_svo))
2. [PTAM] parallel tracking and mapping ([Github](https://github.com/ethz-asl/ethzasl_ptam))
3. [DSO] direct sparse odometry ([Github](https://github.com/JakobEngel/dso))

## Dependencies

1. Linux System
2. [Apptainer](https://apptainer.org/)

## Build and start apptainer images

The simplest way to start with all available algorithms is the provided install_all script.
To use it simply give the script executable rights and execute it. You can find the install_all script
in the scripts folder, called install_all.sh.

1. Give execute rights
```sh
chmod +x install_all.sh
```
2. execute script
```sh
./install_all.sh
```

## Build single algorithm container

To build a single algorithm container you need to compile the ros_base first. This container contains the basic
ROS Noetic installation together with dependencies used across the algorithms. To do so just run following commands
to use the provided script (found in scripts folder) :

1. Give execute rigths
```sh
chmod +x install_ros_base.sh
```
2. execute script
```sh
./install_ros_base.sh
```

To compile a specific container run its installation script (once again found in scripts folder) with the same
commands as above. Just use the corresponding script instead of the ros_base one.

## Run container with specific algorithm

To run one of the installed containers just use the corresponding start_\<algo\>.sh script, where \<algo\> is one
of the available in the scripts folder. To run SVO fro example :

1. Give execute rigths (only one time needed if install_all.sh script isnt used before)
```sh
chmod +x start_svo.sh
```
2. execute script to start container
```sh
./start_svo.sh
```

In the corresponding containers you can do the following :

## How to use algorithms within compiled containers

1. start roscore
```sh
roscore
```
2. Continue with container specific commands :

### 1. SVO
#### Start SVO live with ROS

1. configure usb_cam.launch in /opt/ros/noetic/share/usb_cam/launch/usb_cam-test.launch and corresponsing configs
2. start usb_cam
```sh
roslaunch usb_cam usb_cam-test.launch
```
3. configure svo.launch in /svo_ws/src/rpg_svo/rqt_svo/src/rqt_svo/svo.launch
4. start svo, svo gui and rviz
```sh
roslaunch rqt_svo svo.launch
```

### 2. PTAM
#### Start PTAM live with ROS
ToDo

### 3. DSO

- [ROS wrapper GitHub](https://github.com/JakobEngel/dso_ros)

#### Testdata

Testdata used is the [Monocular Visual Odometry Dataset](https://cvg.cit.tum.de/data/datasets/mono-dataset?redirect=1).
For more information see [this paper](https://cvg.cit.tum.de/_media/spezial/bib/engel2016monodataset.pdf).

#### Start DSO on testdata

To start DSO run following command : 
```sh
/workspace/dso/build/bin/dso_dataset \
	files=../testdata/visual_odometry_testdata/<sequence_number>/images.zip \
	calib=../testdata/visual_odometry_testdata/<sequence_number>/camera.txt \
	gamma=../testdata/visual_odometry_testdata/<sequence_number>/pcalib.txt \
	vignette=../testdata/visual_odometry_testdata/<sequence_number>/vignette.png \
	preset=0 \
	mode=0 
```

Substitute the <sequence_number> with the corresponding sequence number from the dataset e.g. "sequence_42".
The testdata needs to be in the "testdata" folder in the root of this project.

Further information :
- [Dataset format](https://github.com/JakobEngel/dso?tab=readme-ov-file#31-dataset-format)
- [Commandline options](https://github.com/JakobEngel/dso?tab=readme-ov-file#32-commandline-options)

#### Start DSO live with ROS
ToDo

## More information
### Calibrate camera

- See [this paper](https://arxiv.org/pdf/1607.02555.pdf) for a photometrically calibrated benchmark for monocular visual odometry
- [Camera calibration GitHub](https://github.com/uzh-rpg/rpg_svo/wiki/Camera-Calibration)
- [Create photometric calibration like TUM-Vision Mono Dataset](https://github.com/tum-vision/mono_dataset_code)
- [Rolling shutter correction](https://github.com/OpenDroneMap/RSCalibration)
- [ROS Rolling shutter correction](https://github.com/ethz-asl/kalibr/wiki/Rolling-Shutter-Camera-calibration)