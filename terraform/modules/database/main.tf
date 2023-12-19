resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret" "db_secret" {
  name = "todo_db_password"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = random_password.db_password.result
}

resource "aws_docdb_cluster" "todo_db" {
  cluster_identifier     = "todo-cluster"
  engine                 = "docdb"
  master_username        = var.db_username
  master_password        = random_password.db_password.result
  db_subnet_group_name   = aws_docdb_subnet_group.todo_db_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "TodoDBCluster"
  }
}

resource "aws_docdb_subnet_group" "todo_db_subnet_group" {
  name       = "todo-db-subnet-group"
  subnet_ids = [var.subnet_id]
}
