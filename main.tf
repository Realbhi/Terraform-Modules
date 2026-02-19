module "dev-infra" {

    source = "./infra"
    env = "dev"
    ami = "ami-019715e0d74f695be"
    count_of_instance = 1
    instance_type = "t3.micro"
    instance_name = "Dev-i-"
    instance_vol = 10
}


module "Prod-infra" {
 
    source = "./infra"
    env = "prod"
    ami = "ami-019715e0d74f695be"
    count_of_instance = 2
    instance_type = "t3.small"
    instance_name = "Prod-i-"
    instance_vol = 15

}


module "Stage-infra" {

    source = "./infra"
    env = "stage"
    ami = "ami-019715e0d74f695be"
    count_of_instance = 1
    instance_type = "t3.micro"
    instance_name = "Stage-i-"
    instance_vol = 10
}
