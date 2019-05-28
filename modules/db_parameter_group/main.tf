locals {
  description = coalesce(
    var.description,
    "Database parameter group for ${var.identifier}",
  )
}

resource "aws_db_parameter_group" "this_no_prefix" {
  count = var.create && false == var.use_name_prefix ? 1 : 0

  name        = var.name
  description = local.description
  family      = var.family

  dynamic "parameter" {
    for_each = [var.parameters]
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_parameter_group" "this" {
  count = var.create && var.use_name_prefix ? 1 : 0

  name_prefix = var.name_prefix
  description = local.description
  family      = var.family

  dynamic "parameter" {
    for_each = [var.parameters]
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.identifier)
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

