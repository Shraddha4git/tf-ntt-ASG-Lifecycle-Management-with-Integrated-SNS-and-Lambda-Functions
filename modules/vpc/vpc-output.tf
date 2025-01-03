/*output "private_subnet_ids_sega" {
  value = aws_subnet.mum_uat_ots_subnet_segA.subnet_ids
}
output "private_subnet_ids_sege" {
  value = aws_subnet.mum_uat_ots_subnet_segE.subnet_ids
}*/
output "private_subnet_ids" {
  value = [ aws_subnet.mum_uat_ots_subnet_segA.id, aws_subnet.mum_uat_ots_subnet_segE.id ]
}