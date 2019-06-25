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

terraform plan  -var="hcloud_token=${HCLOUD_TOKEN}"  -out=./terraform/plan ./terraform

### use plan to create infrastructure
terraform apply "./terraform/plan"

### destroy infrastructure
terraform destroy -var="hcloud_token=${HCLOUD_TOKEN}" ./terraform
terraform destroy -auto-approve -var="hcloud_token=${HCLOUD_TOKEN}" ./terraform
```

## observaions
- when you first time create a plan
    - then apply the plan
    - then try to aplly again, the plan is stale
    - you have to create a new plan (which should say `nothing changed`)
    - and this plan can be apllyed endlessly idempotend (hopefully)

## TODO
- ssh-key workflow

