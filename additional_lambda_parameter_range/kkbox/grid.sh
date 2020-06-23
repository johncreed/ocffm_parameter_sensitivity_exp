#!/bin/bash

logs="logs"
mkdir -p ${logs}

k=64
t=100

task(){
    logs_path="${logs}/task"
    mkdir -p ${logs_path}
    for l in 64
    do
        for w in 0.00048828125 0.0009765625 0.001953125 0.00390625 0.0078125 0.015625 0.03125 0.0625 0.125 0.25
        do
            log_name="${l}.${w}.log"
            echo "./train -k ${k} -l ${l} -t ${t} -r -1 -w ${w} -c 5 -p va item tr > ${logs_path}/${log_name}"
        done
    done
}

task >> job_file

