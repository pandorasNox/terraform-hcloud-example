# terraform-hcloud-example
terraform hetzner cloud example

##wip
- continue: https://www.youtube.com/watch?v=UvHr0L6X8dc

## terraform plan
```
terraform plan \
    -var="hcloud_token=..." \
    -var="pub_key=..." \
    -var="pvt_key=..."
```


```
## example

### init (e.g. download provider)
terraform init ./terraform

### create plan
terraform plan \
    -var="hcloud_token=${HCLOUD_TOKEN}" \
    -out=./terraform/plan ./terraform

### use plan to create infrastructure
terraform apply "./terraform/plan"

### destroy infrastructure
terraform destroy -var="hcloud_token=${HCLOUD_TOKEN}" ./terraform
```

## TODO
- ssh-key workflow

