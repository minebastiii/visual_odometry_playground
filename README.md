# svo_ros_apptainer
Apptainer def files with fixed svo_ros files to build an ros environment with svo built in.

## Build and start apptainer images

1. Build ros_base.def
```
apptainer build ros_base.sif ros_base.def
```

2. Build svo_ros in sandbox mode
```
apptainer build --sandbox svo/ svo_ros.def
```

3. launch svo_ros
```
apptainer run -w svo
```
