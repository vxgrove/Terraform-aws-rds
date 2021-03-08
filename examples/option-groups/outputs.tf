# Default PostgreSQL
output "default_postgres_option_group_id" {
  description = "The ID of the default PostgreSQL option group (should be blank)"
  value       = module.default_postgres.this_db_option_group_id
}

output "default_postgres_option_group_arn" {
  description = "The ARN of the default PostgreSQL option group (should be blank)"
  value       = module.default_postgres.this_db_option_group_arn
}

# Default MySQL
output "default_mysql_option_group_id" {
  description = "The ID of the default MySQL option group"
  value       = module.default_mysql.this_db_option_group_id
}

output "default_mysql_option_group_arn" {
  description = "The ARN of the default MySQL option group"
  value       = module.default_mysql.this_db_option_group_arn
}

# Default MySQL name
output "default_mysql_name_option_group_id" {
  description = "The ID of the default MySQL option group using `name`"
  value       = module.default_mysql_name.this_db_option_group_id
}

output "default_mysql_name_option_group_arn" {
  description = "The ARN of the default MySQL option group using `name`"
  value       = module.default_mysql_name.this_db_option_group_arn
}

# BYO MySQL
output "byo_mysql_option_group_id" {
  description = "The ID of the BYO MySQL option group (should be blank)"
  value       = module.byo_mysql.this_db_option_group_id
}

output "byo_mysql_option_group_arn" {
  description = "The ARN of the BYO MySQL option group (should be blank)"
  value       = module.byo_mysql.this_db_option_group_arn
}

