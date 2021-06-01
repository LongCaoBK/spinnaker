# Install Halyard
```
docker run \
    --name halyard --rm \
    -v /home/longcao/workspace/viettel/spinnaker/.hal:/home/spinnaker/.hal \
    -v /home/longcao/.kube:/home/spinnaker/.kube \
    -v /home/longcao/.minikube:/home/longcao/.minikube \
    --network host \
    -it \
    us-docker.pkg.dev/spinnaker-community/docker/halyard:stable
```

# Install MinIO
```
docker run -p 8000:9000 \
    --name minio \
    -v /home/longcao/workspace/viettel/spinnaker/data:/data \
    -e "MINIO_ROOT_USER=minio" \
    -e "MINIO_ROOT_PASSWORD=11111111" \
    minio/minio server /data
```

# Install Nexus
```
docker run -d -p 8081:8081 \
    -p 8082:8082 -p 8083:8083 \
    -m 1g \
    --name nexus \
    -v /home/longcao/workspace/viettel/spinnaker/nexus-data:/nexus-data \
    sonatype/nexus3
```

# Start Minikube
```
minikube start
```