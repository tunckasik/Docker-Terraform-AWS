variable "region" {
    default = "us-east-1"
}
variable "ami"{
    default = "ami-04581fbf744a7d11f"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "key_name" {
    default = "docker_tf_key" #change on your key-pair name

}
variable "instance_name" {
    default = "Docker-Instance"
}
variable "sc_name" {
  default = "Allow_SSH_&_38080"
}