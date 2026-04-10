module "site" {
  source       = "./modules/s3_site"
  project_name = var.project_name
  environment  = var.environment
}

module "counter" {
  source       = "./modules/lambda_counter"
  project_name = var.project_name
}

module "api" {
  source               = "./modules/api_gateway"
  project_name         = var.project_name
  lambda_invoke_arn    = module.counter.lambda_invoke_arn
  lambda_function_name = module.counter.lambda_function_name
}
