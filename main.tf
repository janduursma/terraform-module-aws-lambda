resource "aws_lambda_alias" "this" {
  count = length(var.lambda_aliases)

  description      = try(var.lambda_aliases[count.index]["description"], null)
  function_name    = var.lambda_aliases[count.index]["function_name"]
  function_version = var.lambda_aliases[count.index]["function_version"]
  name             = var.lambda_aliases[count.index]["name"]
  region           = try(var.lambda_aliases[count.index]["region"], null)

  dynamic "routing_config" {
    for_each = try([var.lambda_aliases[count.index]["routing_config"]], [])

    content {
      additional_version_weights = try(routing_config.value["additional_version_weights"], null)
    }
  }
}

resource "aws_lambda_code_signing_config" "this" {
  count = length(keys(var.lambda_code_signing_configs)) > 0 ? 1 : 0

  description = try(var.lambda_code_signing_configs[count.index]["description"], null)
  region      = try(var.lambda_code_signing_configs[count.index]["region"], null)
  tags        = merge(try(var.tags, {}), try(var.lambda_code_signing_configs[count.index]["tags"], {}))

  allowed_publishers {
    signing_profile_version_arns = var.lambda_code_signing_configs[count.index]["allowed_publishers"]["signing_profile_version_arns"]
  }

  dynamic "policies" {
    for_each = try([var.lambda_code_signing_configs[count.index]["policies"]], [])

    content {
      untrusted_artifact_on_deployment = policies.value["untrusted_artifact_on_deployment"]
    }
  }
}

resource "aws_lambda_event_source_mapping" "this" {
  count = length(keys(var.lambda_event_source_mapping)) > 0 ? 1 : 0

  batch_size                         = try(var.lambda_event_source_mapping["batch_size"], null)
  bisect_batch_on_function_error     = try(var.lambda_event_source_mapping["bisect_batch_on_function_error"], null)
  enabled                            = try(var.lambda_event_source_mapping["enabled"], null)
  event_source_arn                   = try(var.lambda_event_source_mapping["event_source_arn"], null)
  function_name                      = var.lambda_event_source_mapping["function_name"]
  function_response_types            = try(var.lambda_event_source_mapping["function_response_types"], null)
  kms_key_arn                        = try(var.lambda_event_source_mapping["kms_key_arn"], null)
  maximum_batching_window_in_seconds = try(var.lambda_event_source_mapping["maximum_batching_window_in_seconds"], null)
  maximum_record_age_in_seconds      = try(var.lambda_event_source_mapping["maximum_record_age_in_seconds"], null)
  maximum_retry_attempts             = try(var.lambda_event_source_mapping["maximum_retry_attempts"], null)
  parallelization_factor             = try(var.lambda_event_source_mapping["parallelization_factor"], null)
  queues                             = try(var.lambda_event_source_mapping["queues"], null)
  region                             = try(var.lambda_event_source_mapping["region"], null)
  starting_position                  = try(var.lambda_event_source_mapping["starting_position"], null)
  starting_position_timestamp        = try(var.lambda_event_source_mapping["starting_position_timestamp"], null)
  tags                               = merge(try(var.tags, {}), try(var.lambda_event_source_mapping["tags"], {}))
  topics                             = try(var.lambda_event_source_mapping["topics"], null)
  tumbling_window_in_seconds         = try(var.lambda_event_source_mapping["tumbling_window_in_seconds"], null)

  dynamic "amazon_managed_kafka_event_source_config" {
    for_each = try([var.lambda_event_source_mapping["amazon_managed_kafka_event_source_config"]], [])

    content {
      consumer_group_id = try(amazon_managed_kafka_event_source_config.value["consumer_group_id"], null)

      dynamic "schema_registry_config" {
        for_each = try([amazon_managed_kafka_event_source_config.value["schema_registry_config"]], [])

        content {
          event_record_format = try(schema_registry_config.value["event_record_format"], null)
          schema_registry_uri = try(schema_registry_config.value["schema_registry_uri"], null)

          dynamic "access_config" {
            for_each = try([schema_registry_config.value["access_config"]], [])

            content {
              type = try(access_config.value["type"], null)
              uri  = try(access_config.value["uri"], null)
            }
          }

          dynamic "schema_validation_config" {
            for_each = try(schema_registry_config.value["schema_validation_configs"], [])

            content {
              attribute = try(schema_validation_config.value["attribute"], null)
            }
          }
        }
      }
    }
  }

  dynamic "destination_config" {
    for_each = try([var.lambda_event_source_mapping["destination_config"]], [])

    content {
      dynamic "on_failure" {
        for_each = try([destination_config.value["on_failure"]], [])

        content {
          destination_arn = on_failure.value["destination_arn"]
        }
      }
    }
  }

  dynamic "document_db_event_source_config" {
    for_each = try([var.lambda_event_source_mapping["document_db_event_source_config"]], [])

    content {
      collection_name = try(document_db_event_source_config.value["collection_name"], null)
      database_name   = document_db_event_source_config.value["database_name"]
      full_document   = try(document_db_event_source_config.value["full_document"], null)
    }
  }

  dynamic "filter_criteria" {
    for_each = try([var.lambda_event_source_mapping["filter_criteria"]], [])

    content {
      dynamic "filter" {
        for_each = try(filter_criteria.value["filters"], [])

        content {
          pattern = try(filter.value["pattern"], null)
        }
      }
    }
  }

  dynamic "metrics_config" {
    for_each = try([var.lambda_event_source_mapping["metrics_config"]], [])

    content {
      metrics = metrics_config.value["metrics"]
    }
  }

  dynamic "provisioned_poller_config" {
    for_each = try([var.lambda_event_source_mapping["provisioned_poller_config"]], [])

    content {
      maximum_pollers = try(provisioned_poller_config.value["maximum_pollers"], null)
    }
  }

  dynamic "scaling_config" {
    for_each = try([var.lambda_event_source_mapping["scaling_config"]], [])

    content {
      maximum_concurrency = try(scaling_config.value["maximum_concurrency"], null)
    }
  }

  dynamic "self_managed_event_source" {
    for_each = try([var.lambda_event_source_mapping["self_managed_event_source"]], [])

    content {
      endpoints = self_managed_event_source.value["endpoints"]
    }
  }

  dynamic "self_managed_kafka_event_source_config" {
    for_each = try([var.lambda_event_source_mapping["self_managed_kafka_event_source_config"]], [])

    content {
      consumer_group_id = try(self_managed_kafka_event_source_config.value["consumer_group_id"], null)

      dynamic "schema_registry_config" {
        for_each = try([self_managed_kafka_event_source_config.value["schema_registry_config"]], [])

        content {
          event_record_format = try(schema_registry_config.value["event_record_format"], null)
          schema_registry_uri = try(schema_registry_config.value["schema_registry_uri"], null)

          dynamic "access_config" {
            for_each = try([schema_registry_config.value["access_config"]], [])

            content {
              type = try(access_config.value["type"], null)
              uri  = try(access_config.value["uri"], null)
            }
          }

          dynamic "schema_validation_config" {
            for_each = try(schema_registry_config.value["schema_validation_configs"], [])

            content {
              attribute = try(schema_validation_config.value["attribute"], null)
            }
          }
        }
      }
    }
  }

  dynamic "source_access_configuration" {
    for_each = try([var.lambda_event_source_mapping["source_access_configuration"]], [])

    content {
      type = source_access_configuration.value["type"]
      uri  = source_access_configuration.value["uri"]
    }
  }
}

resource "aws_lambda_function" "this" {
  count = length(keys(var.lambda_function)) > 0 ? 1 : 0

  architectures                      = try(var.lambda_function["architectures"], null)
  code_signing_config_arn            = try(var.lambda_function["code_signing_config_arn"], null)
  description                        = try(var.lambda_function["description"], null)
  filename                           = try(var.lambda_function["filename"], null)
  function_name                      = var.lambda_function["function_name"]
  handler                            = try(var.lambda_function["handler"], null)
  image_uri                          = try(var.lambda_function["image_uri"], null)
  kms_key_arn                        = try(var.lambda_function["kms_key_arn"], null)
  layers                             = try(var.lambda_function["layers"], null)
  memory_size                        = try(var.lambda_function["memory_size"], null)
  package_type                       = try(var.lambda_function["package_type"], null)
  publish                            = try(var.lambda_function["publish"], null)
  region                             = try(var.lambda_function["region"], null)
  replace_security_groups_on_destroy = try(var.lambda_function["replace_security_groups_on_destroy"], null)
  replacement_security_group_ids     = try(var.lambda_function["replacement_security_group_ids"], null)
  reserved_concurrent_executions     = try(var.lambda_function["reserved_concurrent_executions"], null)
  role                               = var.lambda_function["role"]
  runtime                            = try(var.lambda_function["runtime"], null)
  s3_bucket                          = try(var.lambda_function["s3_bucket"], null)
  s3_key                             = try(var.lambda_function["s3_key"], null)
  s3_object_version                  = try(var.lambda_function["s3_object_version"], null)
  skip_destroy                       = try(var.lambda_function["skip_destroy"], null)
  source_code_hash                   = try(var.lambda_function["source_code_hash"], null)
  source_kms_key_arn                 = try(var.lambda_function["source_kms_key_arn"], null)
  tags                               = merge(try(var.tags, {}), try(var.lambda_function["tags"], {}))
  timeout                            = try(var.lambda_function["timeout"], null)

  dynamic "dead_letter_config" {
    for_each = try([var.lambda_function["dead_letter_config"]], [])

    content {
      target_arn = dead_letter_config.value["target_arn"]
    }
  }

  dynamic "environment" {
    for_each = try([var.lambda_function["environment"]], [])

    content {
      variables = try(environment.value["variables"], null)
    }
  }

  dynamic "ephemeral_storage" {
    for_each = try([var.lambda_function["ephemeral_storage"]], [])

    content {
      size = ephemeral_storage.value["size"]
    }
  }

  dynamic "file_system_config" {
    for_each = try([var.lambda_function["file_system_config"]], [])

    content {
      arn              = file_system_config.value["arn"]
      local_mount_path = file_system_config.value["local_mount_path"]
    }
  }

  dynamic "image_config" {
    for_each = try([var.lambda_function["image_config"]], [])

    content {
      command           = try(image_config.value["command"], null)
      entry_point       = try(image_config.value["entry_point"], null)
      working_directory = try(image_config.value["working_directory"], null)
    }
  }

  dynamic "logging_config" {
    for_each = try([var.lambda_function["logging_config"]], [])

    content {
      application_log_level = try(logging_config.value["application_log_level"], null)
      log_format            = logging_config.value["log_format"]
      log_group             = try(logging_config.value["log_group"], null)
      system_log_level      = try(logging_config.value["system_log_level"], null)
    }
  }

  dynamic "snap_start" {
    for_each = try([var.lambda_function["snap_start"]], [])

    content {
      apply_on = snap_start.value["apply_on"]
    }
  }

  dynamic "tracing_config" {
    for_each = try([var.lambda_function["tracing_config"]], [])

    content {
      mode = tracing_config.value["mode"]
    }
  }

  dynamic "vpc_config" {
    for_each = try([var.lambda_function["vpc_config"]], [])

    content {
      ipv6_allowed_for_dual_stack = try(vpc_config.value["ipv6_allowed_for_dual_stack"], null)
      security_group_ids          = vpc_config.value["security_group_ids"]
      subnet_ids                  = vpc_config.value["subnet_ids"]
    }
  }
}

resource "aws_lambda_function_event_invoke_config" "this" {
  count = length(keys(var.lambda_function_event_invoke_config)) > 0 ? 1 : 0

  function_name                = var.lambda_function_event_invoke_config["function_name"]
  maximum_event_age_in_seconds = try(var.lambda_function_event_invoke_config["maximum_event_age_in_seconds"], null)
  maximum_retry_attempts       = try(var.lambda_function_event_invoke_config["maximum_retry_attempts"], null)
  qualifier                    = try(var.lambda_function_event_invoke_config["qualifier"], null)
  region                       = try(var.lambda_function_event_invoke_config["region"], null)

  dynamic "destination_config" {
    for_each = try([var.lambda_function_event_invoke_config["destination_config"]], [])

    content {
      dynamic "on_failure" {
        for_each = try([destination_config.value["on_failure"]], [])

        content {
          destination = on_failure.value["destination"]
        }
      }

      dynamic "on_success" {
        for_each = try([destination_config.value["on_success"]], [])

        content {
          destination = on_success.value["destination"]
        }
      }
    }
  }
}

resource "aws_lambda_function_recursion_config" "this" {
  count = length(keys(var.lambda_function_recursion_config)) > 0 ? 1 : 0

  function_name  = var.lambda_function_recursion_config["function_name"]
  recursive_loop = var.lambda_function_recursion_config["recursive_loop"]
  region         = try(var.lambda_function_recursion_config["region"], null)
}

resource "aws_lambda_function_url" "this" {
  count = length(keys(var.lambda_function_url)) > 0 ? 1 : 0

  authorization_type = var.lambda_function_url["authorization_type"]
  function_name      = var.lambda_function_url["function_name"]
  invoke_mode        = try(var.lambda_function_url["invoke_mode"], null)
  qualifier          = try(var.lambda_function_url["qualifier"], null)
  region             = try(var.lambda_function_url["region"], null)

  dynamic "cors" {
    for_each = try([var.lambda_function_url["cors"]], [])

    content {
      allow_credentials = try(cors.value["allow_credentials"], null)
      allow_headers     = try(cors.value["allow_headers"], null)
      allow_methods     = try(cors.value["allow_methods"], null)
      allow_origins     = try(cors.value["allow_origins"], null)
      expose_headers    = try(cors.value["expose_headers"], null)
      max_age           = try(cors.value["max_age"], null)
    }
  }
}

resource "aws_lambda_invocation" "this" {
  count = length(keys(var.lambda_invocation)) > 0 ? 1 : 0

  function_name   = var.lambda_invocation["function_name"]
  input           = var.lambda_invocation["input"]
  lifecycle_scope = try(var.lambda_invocation["lifecycle_scope"], null)
  qualifier       = try(var.lambda_invocation["qualifier"], null)
  region          = try(var.lambda_invocation["region"], null)
  terraform_key   = try(var.lambda_invocation["terraform_key"], null)
  triggers        = try(var.lambda_invocation["triggers"], null)
}

resource "aws_lambda_layer_version" "this" {
  count = length(var.lambda_layer_versions)

  compatible_architectures = try(var.lambda_layer_versions[count.index]["compatible_architectures"], null)
  compatible_runtimes      = try(var.lambda_layer_versions[count.index]["compatible_runtimes"], null)
  description              = try(var.lambda_layer_versions[count.index]["description"], null)
  filename                 = try(var.lambda_layer_versions[count.index]["filename"], null)
  layer_name               = var.lambda_layer_versions[count.index]["layer_name"]
  license_info             = try(var.lambda_layer_versions[count.index]["license_info"], null)
  region                   = try(var.lambda_layer_versions[count.index]["region"], null)
  s3_bucket                = try(var.lambda_layer_versions[count.index]["s3_bucket"], null)
  s3_key                   = try(var.lambda_layer_versions[count.index]["s3_key"], null)
  s3_object_version        = try(var.lambda_layer_versions[count.index]["s3_object_version"], null)
  skip_destroy             = try(var.lambda_layer_versions[count.index]["skip_destroy"], null)
  source_code_hash         = try(var.lambda_layer_versions[count.index]["source_code_hash"], null)
}

resource "aws_lambda_layer_version_permission" "this" {
  count = length(var.lambda_layer_version_permissions)

  action          = var.lambda_layer_version_permissions[count.index]["action"]
  layer_name      = var.lambda_layer_version_permissions[count.index]["layer_name"]
  organization_id = try(var.lambda_layer_version_permissions[count.index]["organization_id"], null)
  principal       = var.lambda_layer_version_permissions[count.index]["principal"]
  region          = try(var.lambda_layer_version_permissions[count.index]["region"], null)
  skip_destroy    = try(var.lambda_layer_version_permissions[count.index]["skip_destroy"], null)
  statement_id    = var.lambda_layer_version_permissions[count.index]["statement_id"]
  version_number  = var.lambda_layer_version_permissions[count.index]["version_number"]
}

resource "aws_lambda_permission" "this" {
  count = length(keys(var.lambda_permission)) > 0 ? 1 : 0

  action                 = var.lambda_permission["action"]
  event_source_token     = try(var.lambda_permission["event_source_token"], null)
  function_name          = var.lambda_permission["function_name"]
  function_url_auth_type = try(var.lambda_permission["function_url_auth_type"], null)
  principal              = var.lambda_permission["principal"]
  principal_org_id       = try(var.lambda_permission["principal_org_id"], null)
  qualifier              = try(var.lambda_permission["qualifier"], null)
  region                 = try(var.lambda_permission["region"], null)
  source_account         = try(var.lambda_permission["source_account"], null)
  source_arn             = try(var.lambda_permission["source_arn"], null)
  statement_id           = try(var.lambda_permission["statement_id"], null)
  statement_id_prefix    = try(var.lambda_permission["statement_id_prefix"], null)
}

resource "aws_lambda_provisioned_concurrency_config" "this" {
  count = length(keys(var.lambda_provisioned_concurrency_config)) > 0 ? 1 : 0

  function_name                     = var.lambda_provisioned_concurrency_config["function_name"]
  provisioned_concurrent_executions = var.lambda_provisioned_concurrency_config["provisioned_concurrent_executions"]
  qualifier                         = var.lambda_provisioned_concurrency_config["qualifier"]
  region                            = try(var.lambda_provisioned_concurrency_config["region"], null)
  skip_destroy                      = try(var.lambda_provisioned_concurrency_config["skip_destroy"], null)
}

resource "aws_lambda_runtime_management_config" "this" {
  count = length(keys(var.lambda_runtime_management_config)) > 0 ? 1 : 0

  function_name       = var.lambda_runtime_management_config["function_name"]
  qualifier           = try(var.lambda_runtime_management_config["qualifier"], null)
  region              = try(var.lambda_runtime_management_config["region"], null)
  runtime_version_arn = try(var.lambda_runtime_management_config["runtime_version_arn"], null)
  update_runtime_on   = try(var.lambda_runtime_management_config["update_runtime_on"], null)
}
