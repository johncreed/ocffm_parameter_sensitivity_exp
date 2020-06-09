#!/bin/bash

logs="logs"
mkdir -p ${logs}

source kkbox_best_param.sh
source ob_best_param.sh
source kdd12_best_param.sh

echo "${l_best} ${w_best} ${k_best} ${t_best}"

k_task(){
    logs_path="${logs}/k_task"
    mkdir -p ${logs_path}
    for k in 16 32 64 
    do
        log_name="${k}.log"
    echo "./train -k ${k} -l ${l_best} -t ${t_best} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs}/${log_name}"
    done
}

w_task(){
    logs_path="${logs}/w_task"
    mkdir -p ${logs_path}
    for w in 0.5 0.125 0.03125 0.0078125 0.001953125 0.00048828125
    do
        log_name="${w}.log"
    echo "./train -k ${k_best} -l ${l_best} -t ${t_best} -r -1 -w ${w} -c 5 -p te item trva > ${logs}/${log_name}"
    done
}

l_task(){
    logs_path="${logs}/l_task"
    mkdir -p ${logs_path}
    for l in 1 4 16 64 256
    do
        log_name="${w}.log"
    echo "./train -k ${k_best} -l ${l_best} -t ${t_best} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs}/${log_name}"
    done
}

w_task(){
    logs_path="${logs}/w_task"
    mkdir -p ${logs_path}
    for w in 0.5 0.125 0.03125 0.0078125 0.001953125 0.00048828125
    do
        log_name="${w}.log"
    echo "./train -k ${k_best} -l ${l_best} -t ${t_best} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs}/${log_name}"
    done
}

w_task(){
    logs_path="${logs}/w_task"
    mkdir -p ${logs_path}
    for w in 0.5 0.125 0.03125 0.0078125 0.001953125 0.00048828125
    do
        log_name="${w}.log"
    echo "./train -k ${k_best} -l ${l_best} -t ${t_best} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs}/${log_name}"
    done
}
