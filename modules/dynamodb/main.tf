resource "aws_dynamodb_table" "bucket-iti-wael" {
  name = "bucket-iti-wael"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}