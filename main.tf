# This file contains the configuration for creating AWS Lambda layers using Terraform.
module "layers" {
    # Create a Lambda layer for each entry in the layers_info map
    for_each = local.layers_info
    source = "terraform-aws-modules/lambda/aws"
    version = "7.7.0"
 
    # Create a layer with the specified name and description
    create_layer = true
    layer_name  = each.key
    description = each.value.description
    source_path = [
        {
            path = "${path.module}/${each.value.path}", # Path to the layer source code
            pip_requirements = true,
            prefix_for_zip = "python"
        },
        {
            path = "${path.module}/layers/common_scripts", # Path to the common scripts
            prefix_for_zip = "python"
        },
    ]

    # Default runtime if not specified
    runtime = lookup(each.value, "runtime", var.lambda_default_settings["runtime"]) 
    
    store_on_s3 = true
    s3_prefix = "layers/${each.key}"
    s3_bucket = data.aws_s3_bucket.existing_bucket.id
    compatible_architectures = ["x86_64"]
}
