output "docdb_cluster_endpoint" {
  value = aws_docdb_cluster.todo_db.endpoint
}

output "docdb_cluster_id" {
  value = aws_docdb_cluster.todo_db.id
}
