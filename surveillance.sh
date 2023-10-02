#!/bin/bash

# a) Surveillance d'une machine
cd prometheus

wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar -xvf ~/prometheus/node_exporter-1.0.1.linux-amd64.tar.gz
mv ~/prometheus/node_exporter-1.0.1.linux-amd64 ~/prometheus/node_exporter

rm ~/prometheus/node_exporter-1.0.1.linux-amd64.tar.gz

#node_exporter/node_exporter &
#node_cpu_scaling_frequency_hertz

# b) surveillance du démon docker 

sudo service docker stop

#sudo dockerd --experimental --metrics-addr 127.0.0.1:9323
#node_cpu_scaling_frequency_hertz

# c) surveillance de Jenkins

# activer le plugin prometheus metrics 
# activer le plugin CloudBees Disk Usage Simple

# d) lancement des exporteurs

~/prometheus/node_exporter/node_exporter &

sudo dockerd --experimental --metrics-addr 127.0.0.1:9323 &

cd ..

prometheus/prometheus --config.file=prometheus/prometheus.yml &
