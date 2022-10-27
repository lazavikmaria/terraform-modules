#OUTPUT MAIN-SG.
output "main-sg-security-group" {
  value = aws_security_group.main-sg.id
}