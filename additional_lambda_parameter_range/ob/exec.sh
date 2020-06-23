#! /bin/bash

num_job=2
job_file=$1

cat ${job_file} | xargs -d '\n' -P ${num_job} -I {} sh -c {} &
