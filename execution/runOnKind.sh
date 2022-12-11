#!/bin/bash
cd ~/sharedData/Paper/
bash prepareRun.sh
cd ./execution/executiondata

export NXF_OFFLINE=true
export NXF_DEBUG=3
export NXF_ANSI_LOG=false

workflow=$1

~/sharedData/Paper/nextflow_locality/docker/nextflow kuberun /input/exp/$workflow/ \
-v pvc-host-shared-data:/pvcdata \
-v project-pvc-host-shared-data:/input \
-profile kubernetesConf \
-head-image test2kind \
-config ../nextflowNormal.config \
-config ../../SchedulerApiExperiments/execution/configs/$workflow.config \
--save_reference false \
--outdir /pvcdata/outputs/ \
-with-report \
-remoteProfile test
#-dsl1