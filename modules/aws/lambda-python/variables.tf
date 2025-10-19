variable "function_name" { type = string }
variable "runtime"       {
  type = string
  default = "python3.11"
}
variable "entry_file"    { type = string } # path to .py to zip
variable "handler"       {
  type = string
  default = "handler.lambda_handler"
}
variable "timeout"       {
  type = number
  default = 10
}

