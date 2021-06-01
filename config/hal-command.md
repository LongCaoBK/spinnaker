# 1, Cấu hình storage service

Sau khi setup xong halyard, cấu hình storage service với MinIO:

Given that Minio doesn’t support versioning objects, we need to disable it in Spinnaker. Add the following line to ~/.hal/default/profiles/front50-local.yml:
```
spinnaker.s3.versioning: false
```

Chạy lệnh sau trong với hal (MINIO_SECRET_KEY và MINIO_ACCESS_KEY đã thêm vào biến môi trường):
```
echo $MINIO_SECRET_KEY | hal config storage s3 edit --endpoint http://192.168.1.38:8000 \
    --access-key-id $MINIO_ACCESS_KEY \
    --secret-access-key 

hal config storage edit --type s3
```

# 2, Add k8s account
Thêm k8s account với contexts là minikube (STAGING_CONTEXT: minikube)
```
hal config provider kubernetes account add staging-demo \
  --context $STAGING_CONTEXT
```

# 3, Deploy Spinnaker
```
hal config version edit --version $(hal version latest -q)

hal config deploy edit --type distributed --account-name staging-demo

hal deploy apply
```

# 4, Cấu hình Docker Registry
Đang gặp lỗi tại đây...

```
hal config provider docker-registry enable

hal config provider docker-registry account add nexus-docker-registry \
    --address 192.168.1.38:8082 \
    --repositories repository/docker-hub \
    --username admin \
    --password 11111111
```

Đã thử khi thêm flag nhưng không ăn:
- --no-validate=true
- --insecure-registry=true

