variable "region" {
  default = "eu-west-2"
}
variable "sg_id" {
  default = "" 
}
variable "ami_id" {
  default = "" 
}
variable "ins_type" {
  default = "t2.micro" 
}
variable "key_name" {
  default = "jenkins-CICDlab-key-pair"
}
variable "public_key" {
  default = "/home/ubuntu/.ssh/id_rsa.pub"
}
variable "my-servers" {
  type    = list(string)
  default = ["jenkins-server"]
}
