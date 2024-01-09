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
```
chmod +x install_all.sh
```
2. execute script
```
./install_all.sh
```

## Build single algorithm container

To build a single algorithm container you need to compile the ros_base first. This container contains the basic
ROS Noetic installation together with dependencies used across the algorithms. To do so just run following commands
to use the provided script (found in scripts folder) :

1. Give execute rigths
```
chmod +x install_ros_base.sh
```
2. execute script
```
./install_ros_base.sh
```

To compile a specific container run its installation script (once again found in scripts folder) with the same
commands as above. Just use the corresponding script instead of the ros_base one.

## Run container with specific algorithm

To run one of the installed containers just use the corresponding start_\<algo\>.sh script, where \<algo\> is one
of the available in the scripts folder. To run SVO fro example :

1. Give execute rigths (only one time needed if install_all.sh script isnt used before)
```
chmod +x start_svo.sh
```
2. execute script
```
./start_svo.sh
```

## How to use algorithms within compiled containers
### 1. SVO
#### Start SVO live with ROS
ToDo

### 2. PTAM
#### Start PTAM live with ROS
ToDo

### 3. DSO
#### Testdata
ToDo

#### Start DSO on testdata
ToDo

#### Start DSO live with ROS
ToDo

## More information
### Calibrate camera
ToDo