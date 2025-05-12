variable "lambda_default_settings" {
  type = object({
    timeout                      = number
    runtime                      = string
    compatible_runtimes          = list(string)
  })
  default = {
    timeout             = 10
    runtime             = "python3.10"
    compatible_runtimes = ["python3.9", "python3.10", "python3.11"]
  }
}
