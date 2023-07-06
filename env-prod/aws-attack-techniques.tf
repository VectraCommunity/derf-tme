##########################################################################################
# Permission Assignment
##########################################################################################
module "aws_permissions_required" {
  source = "../attack-techniques/aws/permissions-required"


}

##########################################################################################
# Attacks in the Credential Access
##########################################################################################

module "aws_ssm_retrieve_securestring_parameter" {
  source = "../attack-techniques/aws/credential-access/ssm-retrieve-securestring-parameters"

  projectId          = local.gcp_deployment_project_id

  providers = {
    google          = google.derf
  }

## Attacks defined in Google Worksflows rely on the underlying infrastructure to be in place to
## Work properly such as the Proxy App, Derf Execution Users and the Base GCP Project.  
  depends_on = [
    module.aws_derf_execution_users,
    module.gcp_bootstrapping,
    module.gcp-aws-proxy-app,
    module.gcp_derf_user_secrets,
    module.aws_permissions_required
  ]

}

module "aws_ec2_steal_instance_credentials" {
  source = "../attack-techniques/aws/credential-access/ec2-steal-instance-credentials"

  projectId          = local.gcp_deployment_project_id

  providers = {
    google          = google.derf
  }

## Attacks defined in Google Worksflows rely on the underlying infrastructure to be in place to
## Work properly such as the Proxy App, Derf Execution Users and the Base GCP Project.  
  depends_on = [
    module.aws_derf_execution_users,
    module.gcp_bootstrapping,
    module.gcp-aws-proxy-app,
    module.gcp_derf_user_secrets,
    module.aws_permissions_required
  ]

}

##########################################################################################
# Attacks in the Discovery Category
##########################################################################################
module "aws_ec2_get_user_data" {
  source = "../attack-techniques/aws/discovery/ec2-get-user-data"

  projectId          = local.gcp_deployment_project_id

  providers = {
    google          = google.derf
  }

## Attacks defined in Google Worksflows rely on the underlying infrastructure to be in place to
## Work properly such as the Proxy App, Derf Execution Users and the Base GCP Project.  
  depends_on = [
    module.aws_derf_execution_users,
    module.gcp_bootstrapping,
    module.gcp-aws-proxy-app,
    module.gcp_derf_user_secrets,
    module.aws_permissions_required
  ]

}


##########################################################################################
# Attacks in the Defense Evasion Category
##########################################################################################
module "aws_cloudtrail_trail_delete" {
  source = "../attack-techniques/aws/defense-evasion/cloudtrail-delete"

  projectId          = local.gcp_deployment_project_id

  providers = {
    google          = google.derf
  }

## Attacks defined in Google Worksflows rely on the underlying infrastructure to be in place to
## Work properly such as the Proxy App, Derf Execution Users and the Base GCP Project.  
  depends_on = [
    module.aws_derf_execution_users,
    module.gcp_bootstrapping,
    module.gcp-aws-proxy-app,
    module.gcp_derf_user_secrets,
    module.aws_permissions_required
  ]

}


##########################################################################################
# Attacks in the Exfiltration
##########################################################################################
module "aws_ec2_share_ebs_snapshot" {
  source = "../attack-techniques/aws/exfiltration/ec2-share-ebs-snapshot"

  projectId          = local.gcp_deployment_project_id

  providers = {
    google          = google.derf
  }

## Attacks defined in Google Worksflows rely on the underlying infrastructure to be in place to
## Work properly such as the Proxy App, Derf Execution Users and the Base GCP Project.  
  depends_on = [
    module.aws_derf_execution_users,
    module.gcp_bootstrapping,
    module.gcp-aws-proxy-app,
    module.gcp_derf_user_secrets,
    module.aws_permissions_required
  ]

}