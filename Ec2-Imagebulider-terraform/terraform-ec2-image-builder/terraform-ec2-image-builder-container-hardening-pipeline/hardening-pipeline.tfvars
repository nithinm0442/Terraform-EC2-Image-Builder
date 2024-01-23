# Enter values for all of the following if you wish to avoid being prompted on each run.
account_id                   = "072616322033"
aws_region                   = "us-west-2"
vpc_name                     = "ec2vpc"
kms_key_alias                = "nithin-test-Acc"
ec2_iam_role_name            = "AWSServiceRoleForImageBuilder"
hardening_pipeline_role_name = "AmazonEC2RoleforDataPipelineRole"
aws_s3_ami_resources_bucket  = "test-ot-ec2builder-bucket"
image_name                   = "Windows_Server-2016-English-Full-Base"
ecr_name                     = "ec2ib"
recipe_version               = "1.0.0"
ebs_root_vol_size            = 10