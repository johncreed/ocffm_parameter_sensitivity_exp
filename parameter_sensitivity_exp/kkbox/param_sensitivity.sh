#!/bin/bash

logs="logs"
mkdir -p ${logs}

source kkbox_best_param.sh

echo "${l_best} ${w_best} ${k_best} ${t_best}"

l_task(){
    logs_path="${logs}/l_task"
    mkdir -p ${logs_path}
    for l in 1 4 16 64 256
    do
        log_name="${l}.log"
    echo "./train -k ${k_best} -l ${l} -t ${t_best} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs_path}/${log_name}"
    done
}

k_task(){
    logs_path="${logs}/k_task"
    mkdir -p ${logs_path}
    for k in 16 32 64 
    do
        log_name="${k}.log"
    echo "./train -k ${k} -l ${l_best} -t ${t_best} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs_path}/${log_name}"
    done
}

w_task(){
    logs_path="${logs}/w_task"
    mkdir -p ${logs_path}
    for w in 0.5 0.125 0.03125 0.0078125 0.001953125 0.00048828125
    do
        log_name="${w}.log"
    echo "./train -k ${k_best} -l ${l_best} -t ${t_best} -r -1 -w ${w} -c 5 -p te item trva > ${logs_path}/${log_name}"
    done
}

t_task(){
    logs_path="${logs}/t_task"
    mkdir -p ${logs_path}
    log_name="${t}.log"
    echo "./train -k ${k_best} -l ${l_best} -t ${t_max} -r -1 -w ${w_best} -c 5 -p te item trva > ${logs_path}/${log_name}"
}

# lambda param
l_task > job_file
# w param
w_task >> job_file
# k param
k_task >> job_file
# t param
t_task >> job_file

