output "instance_ip"   {
  value =   aws_instance.web.public_ip 
  
}
output "port_number" {
    value = ":8080"
}
output "waiting_time" {
   value = "is 4min to install and 2min to apply ip over the browser"

}